
use v6-alpha;

class KindaPerl6::Visitor::EmitLisp {

    # This visitor is a list emitter
    # TODO !!!
    
    method visit ( $node ) {
        $node.emit_lisp($.visitor_args{'secure'});
    };

}

class CompUnit {
    sub set_secure_mode( $args_secure ) {
        if ($args_secure != 0) {
            return '(pushnew :kp6-cl-secure *features*)' ~ Main::newline();
        } else {
            return '';
        }
    };

    method emit_lisp( $args_secure ) {
        my $interpreter := '|' ~ $.name ~ '|';

          ';; Do not edit this file - Lisp generated by ' ~ $Main::_V6_COMPILER_NAME ~ Main::newline()
        ~ '(in-package #:cl-user)' ~ Main::newline()
        ~ set_secure_mode($args_secure)
        ~ '(load "lib/KindaPerl6/Runtime/Lisp/Runtime.lisp")' ~ Main::newline()
        ~ '(defpackage #:' ~ $.name ~ Main::newline()
        ~ '  (:use #:cl #:kp6-cl))' ~ Main::newline()
        ~ '(in-package #:' ~ $.name ~ ')' ~ Main::newline()
        ~ '(defun main ()' ~ Main::newline()
        ~ ' (with-kp6-interpreter (' ~ $interpreter ~')' ~ Main::newline()
        ~ '  (with-kp6-package (' ~ $interpreter ~ ' "GLOBAL")' ~ Main::newline()
        ~ $.body.emit_lisp($interpreter, 3) ~ ')))' ~ Main::newline()
        # This is a function so (sb-ext:save-lisp-and-die) has
        # something to call into
        ~ '(main)' ~ Main::newline()
    }
}

class Val::Int {
    method emit_lisp ($interpreter, $indent) { 
        "(make-instance \'kp6-Int :value " ~ $.int ~ ")";
    }
}

class Val::Bit {
    method emit_lisp ($interpreter, $indent) { 
        "(make-instance \'kp6-Bit :value " ~ $.bit ~ ")";
    }
}

class Val::Num {
    method emit_lisp ($interpreter, $indent) { 
        "(make-instance \'kp6-Num :value " ~ $.num ~ ")";
    }
}

class Val::Buf {
    method emit_lisp ($interpreter, $indent) { 
        "(make-instance \'kp6-Str :value " ~ '"' ~ Main::mangle_string( $.buf ) ~ '"' ~ ")";
    }
}

class Val::Char {
    method emit_lisp ($interpreter, $indent) { 
        '(make-instance \'kp6-Char :value (code-char ' ~ $.char ~ '))'
    }
}

class Val::Undef {
    method emit_lisp ($interpreter, $indent) { 
        "(make-instance \'kp6-Undef)";
    }
}

class Val::Object {
    method emit_lisp ($interpreter, $indent) {
	'(kp6-error ' ~ $interpreter ~ ' \'kp6-not-implemented :feature "literal objects")';
    }
}

class Native::Buf {
    method emit_lisp ($interpreter, $indent) { 
	'(kp6-error ' ~ $interpreter ~ ' \'kp6-not-implemented :feature "Native::Buf objects")';
    }
}

class Lit::Seq {
    method emit_lisp ($interpreter, $indent) {
        '(list ' ~ (@.seq.>>emit_lisp($interpreter, $indent)).join(' ') ~ ')';
    }
}

class Lit::Array {
    method emit_lisp ($interpreter, $indent) {
        "(make-instance \'kp6-Array :value (list " ~ (@.array.>>emit_lisp($interpreter, $indent)).join(' ') ~ "))";
    }
}

class Lit::Hash {
    method emit_lisp ($interpreter, $indent) {
        my $fields := @.hash;
        my $str := ''; # XXX (' ' x ($indent + 1))
        my $field;
        for @$fields -> $field { 
            $str := $str ~ '(kp6-store hash ' ~ ($field[0]).emit_lisp($interpreter, $indent) ~ ' ' ~ ($field[1]).emit_lisp($interpreter, $indent) ~ ')' ~ Main::newline(); # XXX (' ' x ($indent + 1))
        }; 
  
	'(let ((hash (make-instance \'kp6-Hash)))' ~ Main::newline() ~ $str ~ ' hash)';
    }
}

class Lit::Pair {
    method emit_lisp ($interpreter, $indent) {
        "(make-instance \'kp6-pair :key " ~ $.key.emit_lisp($interpreter, $indent) ~ " :value " ~ $.value.emit_lisp($interpreter, $indent) ~ ")";
    }
}

class Lit::NamedArgument {
    method emit_lisp ($interpreter, $indent) {
	'(make-kp6-argument \'named (make-instance \'kp6-pair :key ' ~ $.key.emit_lisp($interpreter, $indent) ~ ' :value ' ~ $.value.emit_lisp($interpreter, $indent) ~ '))';
    }
}

class Lit::Code {
    method emit_lisp ($interpreter, $indent) {
          '(with-kp6-pad ('
        ~ $interpreter
	~ ')'
        ~ Main::newline()
        ~ self.emit_declarations($interpreter, $indent)
	~ Main::newline()
        ~ self.emit_body($interpreter, $indent)
        ~ ')';
    };
    method emit_body ($interpreter, $indent) {
        (@.body.>>emit_lisp($interpreter, $indent)).join(Main::newline());
    };
    method emit_signature ($interpreter, $indent) {
        $.sig.emit_lisp($interpreter, $indent)
    };
    method emit_declarations ($interpreter, $indent) {
        my $s := '';
        my $name;
        for @($.pad.variable_names) -> $name {
            my $decl := ::Decl(
                decl => 'my',
                type => '',
                var  => ::Var(
                    sigil     => '',
                    twigil    => '',
                    name      => $name,
                    namespace => [ ],
                ),
            );

            if $s ne '' {
                $s := $s ~ Main::newline();
            }

            $s := $s ~ $name.emit_lisp($interpreter, $indent); # XXX ~ (' ' x $indent)
        };
        return $s;
    };
    method emit_arguments ($interpreter, $indent) {
        my $array_  := ::Var( sigil => '@', twigil => '', name => '_',       namespace => [ ], );
        my $hash_   := ::Var( sigil => '%', twigil => '', name => '_',       namespace => [ ], );
        my $CAPTURE := ::Var( sigil => '$', twigil => '', name => 'CAPTURE', namespace => [ ],);
        my $CAPTURE_decl := ::Decl(decl=>'my',type=>'',var=>$CAPTURE);
        my $str := '';
        $str := $str ~ $CAPTURE_decl.emit_lisp($interpreter, $indent);
        $str := $str ~ '::DISPATCH_VAR($CAPTURE,"STORE",::CAPTURIZE(\@_));';

        my $bind_ := ::Bind(parameters=>$array_,arguments=>::Call(invocant => $CAPTURE,method => 'array',arguments => []));
        $str := $str ~ $bind_.emit_lisp($interpreter, $indent) ~ ' ';

        my $bind_hash := 
                     ::Bind(parameters=>$hash_, arguments=>::Call(invocant => $CAPTURE,method => 'hash', arguments => []));
        $str := $str ~ $bind_hash.emit_lisp($interpreter, $indent) ~ ' ';

        my $i := 0;
        my $field;
        for @($.sig.positional) -> $field { 
            my $bind := ::Bind(parameters=>$field,arguments=>::Index(obj=> $array_ , 'index'=>::Val::Int(int=>$i)) );
            $str := $str ~ $bind.emit_lisp($interpreter, $indent) ~ ' ';
            $i := $i + 1;
        };

        return $str;
    };
}

class Lit::Object {
    method emit_lisp ($interpreter, $indent) {
        # $.class ~ '->new( ' ~ @.fields.>>emit_lisp.join(', ') ~ ' )';
        my $fields := @.fields;
        my $str := '';
        # say @fields.map(sub { $_[0].emit_lisp ~ ' => ' ~ $_[1].emit_lisp}).join(', ') ~ ')';
        my $field;
        for @$fields -> $field { 
            $str := $str ~ ($field[0]).emit_lisp($interpreter, $indent) ~ ' => ' ~ ($field[1]).emit_lisp($interpreter, $indent) ~ ',';
        }; 
        '(kp6-new \'kp6-' ~ $.class ~ ' ' ~ $str ~ ')';
    }
}

class Index {
    method emit_lisp ($interpreter, $indent) {
        '(kp6-lookup ' ~ $.obj.emit_lisp($interpreter, $indent) ~ ' (perl->cl ' ~ $.index.emit_lisp($interpreter, $indent) ~ '))'
    }
}

class Lookup {
    method emit_lisp ($interpreter, $indent) {
	# XXX since we don't have a proper ::Index object which takes care of PERL->CL, we have to do it ourselves
	#'(kp6-lookup ' ~ $.obj.emit_lisp ~ ' ' ~ $.index.emit_lisp ~ ')'
        '(kp6-lookup ' ~ $.obj.emit_lisp($interpreter, $indent) ~ ' (perl->cl ' ~ $.index.emit_lisp($interpreter, $indent) ~ '))'
    }
}

class Assign {
    method emit_lisp ($interpreter, $indent) {
        # TODO - same as ::Bind
        
        my $node := $.parameters;
        
	if $node.isa('Var') {
	    return $node.emit_lisp_assignment($.arguments.emit_lisp($interpreter, $indent));
	}

	if ($node.isa('Lookup') || $node.isa('Index')) && ($node.obj).isa('Var') {
	    return '(kp6-store ' ~ ($node.obj).emit_lisp ~ ' (perl->cl ' ~ ($node.index).emit_lisp ~ ') ' ~ $.arguments.emit_lisp($interpreter, $indent) ~ ')';
	}

	'(kp6-error ' ~ $interpreter ~ ' \'kp6-not-implemented :feature "assigning to anything other than variables")';
    }
}

class Var {
    method emit_lisp ($interpreter, $indent) {
	return self.emit_lisp_lookup(0)
    };

    method emit_lisp_name {
	'(kp6-generate-variable "' ~ $.sigil ~ '" "' ~ $.name ~ '")'
    }

    method emit_lisp_namespace {
	'"' ~ $.namespace.join('::') ~ '"';
    }

    method emit_lisp_lookup ($cell) {
	my $variant := $cell ?? '/c' !! '';

	if @($.namespace) {
	    return '(lookup-package-variable' ~ $variant ~ ' ' ~ self.emit_lisp_name ~ ' ' ~ self.emit_lisp_namespace ~ ')';
	} else {
	    return '(lookup-lexical-variable' ~ $variant ~ ' ' ~ self.emit_lisp_name ~ ')';
	}
    }

    method emit_lisp_assignment ($value, $cell) {
	my $variant := $cell ?? '/c' !! '';

	if @($.namespace) {
	    return '(set-package-variable' ~ $variant ~ ' ' ~ self.emit_lisp_name ~ ' ' ~ $value ~ ' ' ~ self.emit_lisp_namespace ~ ')';
	} else {
	    return '(set-lexical-variable' ~ $variant ~ ' ' ~ self.emit_lisp_name ~ ' ' ~ $value ~ ')';
	}
    }

    method perl {
        # this is used by the signature emitter
          '(kp6-new \'signature-item ' 
        ~     'sigil: \'' ~ $.sigil  ~ '\', '
        ~     'twigil: \'' ~ $.twigil ~ '\', '
        ~     'name: \'' ~ $.name   ~ '\', '
        ~     'namespace: [ ], '
        ~ ')'
    }
}

class Bind {
    method emit_lisp ($interpreter, $indent) {
        if $.arguments.isa('Var') {
            return $.parameters.emit_lisp_assignment($.arguments.emit_lisp_lookup(1), 1);
        }

	if $.arguments.isa('Sub') {
	    return $.parameters.emit_lisp_assignment($.arguments.emit_lisp($interpreter, $indent));
	}

        # XXX: TODO
        return '(kp6-error ' ~ $interpreter ~ ' \'kp6-not-implemented :feature "binding anything other than variables")';

        # XXX - replace Bind with Assign
        if $.parameters.isa('Call')
        {
            return ::Assign(parameters=>$.parameters,arguments=>$.arguments).emit_lisp($interpreter, $indent);
        };
        if $.parameters.isa('Lookup') {
            return ::Assign(parameters=>$.parameters,arguments=>$.arguments).emit_lisp($interpreter, $indent);
        };
        if $.parameters.isa('Index') {
            return ::Assign(parameters=>$.parameters,arguments=>$.arguments).emit_lisp($interpreter, $indent);
        };

        my $str := '';
        $str := $str ~ '(setf ' ~ $.parameters.emit_lisp($interpreter, $indent) ~ ' ' ~ $.arguments.emit_lisp($interpreter, $indent) ~ ')';
        return $str;
    }
}

class Proto {
    method emit_lisp ($interpreter, $indent) {
        return '\''~$.name;   # ???
    }
}

class Call {
    method emit_lisp ($interpreter, $indent) {
	if $.invocant.isa('Var') && (($.method eq 'LOOKUP') || ($.method eq 'INDEX')) {
	    return '(kp6-lookup ' ~ $.invocant.emit_lisp($interpreter, $indent) ~ ' (perl->cl ' ~ (($.arguments)[0]).emit_lisp($interpreter, $indent) ~ '))';
	}
    }
}

class Apply {
    method emit_lisp ($interpreter, $indent) {
	my $name := $.code.name;

    if ($name eq 'infix:<//>') {
        # Hack this is the code generated by C<defined()>
        my $apply_func :=
          '(kp6-apply-function ' ~ $interpreter ~ ' '
        ~ '(perl->cl (lookup-package-variable (kp6-generate-variable "&" "defined") "GLOBAL")) '
        ~ '(list ';
        return '(or (kp6-true ' ~ $apply_func ~ (@.arguments.>>emit_lisp($interpreter, $indent)).join('))) (kp6-true ') ~ '))';
    }

	if ($name eq 'infix:<&&>') {
	    return '(and (kp6-true ' ~ (@.arguments.>>emit_lisp($interpreter, $indent)).join(') (kp6-true ') ~ '))';
	}

	if ($name eq 'infix:<||>') {
	    return '(or (kp6-true ' ~ (@.arguments.>>emit_lisp($interpreter, $indent)).join(') (kp6-true ') ~ '))';
	}

	if ($name eq 'ternary:<?? !!>') {
	    return '(if (kp6-true ' ~ (@.arguments[0]).emit_lisp($interpreter, $indent) ~ ') (progn ' ~ (@.arguments[1]).emit_lisp($interpreter, $indent) ~ ') (progn ' ~ (@.arguments[2]).emit_lisp($interpreter, $indent) ~ '))';
	}

        my $op := $.code.emit_lisp($interpreter, $indent);

        my $str := '(kp6-apply-function ' ~ $interpreter ~ ' (perl->cl ' ~ $op ~ ') (list';
	
	for @.arguments -> $arg {
	    $str := $str ~ ' (make-instance \'kp6-positional-parameter :value ';

	    if $arg.isa('Var') {
		$str := $str ~ $arg.emit_lisp_lookup(1);
	    } else {
		$str := $str ~ '(make-kp6-cell ' ~ $arg.emit_lisp($interpreter, $indent) ~ ')';
	    }

	    $str := $str ~ ')'
	}

	$str := $str ~ '))';
	return $str;
    }
}

class Return {
    method emit_lisp ($interpreter, $indent) {
        return
        #'do { print Main::perl(caller(),' ~ $.result.emit_lisp ~ '); return(' ~ $.result.emit_lisp ~ ') }';
        'return(' ~ $.result.emit_lisp($interpreter, $indent) ~ ')';
    }
}

class If {
    method emit_lisp ($interpreter, $indent) {
	my $cond := '(kp6-true ' ~ $.cond.emit_lisp($interpreter, $indent) ~ ')';

	return '(cond ' ~ Main::newline()
	     ~ '(' ~ $cond ~ ' ' ~ ($.body ?? $.body.emit_lisp($interpreter, $indent) !! 'nil') ~ ')'
	     ~ ($.otherwise ?? Main::newline() ~ '(t ' ~ $.otherwise.emit_lisp($interpreter, $indent) ~ ')' !! '') 
	     ~ ')';
    }
}

class For {
    method emit_lisp ($interpreter, $indent) {
        my $cond := $.cond;
        if   $cond.isa( 'Var' ) 
          && $cond.sigil eq '@' 
        {
        } else {
            $cond := ::Apply( code => ::Var(sigil=>'&',twigil=>'',name=>'prefix:<@>',namespace => [ 'GLOBAL' ],), arguments => [$cond] );
        }
#        'for ' 
#        ~   $.topic.emit_lisp($interpreter, $indent) 
#        ~ ' ( @{ ' ~ $cond.emit_lisp($interpreter, $indent) ~ '->{_value}{_array} } )'
#        ~ ' { ' 
#        ~     $.body.emit_lisp($interpreter, $indent) 
#        ~ ' } ';
        '(kp6-for-->-single'
        ~ '  ' ~ $.topic.emit_lisp_name()
        ~ '  ' ~ $cond.emit_lisp($interpreter, $indent)
        ~ '  ' ~ $.body.emit_lisp($interpreter, $indent) 
        ~ ')';
    }
}

class While {
    method emit_lisp ($interpreter, $indent) {
        my $cond := $.cond;
        if   $cond.isa( 'Var' ) 
          && $cond.sigil eq '@' 
        {
        } else {
            $cond := ::Apply( code => ::Var(sigil=>'&',twigil=>'',name=>'prefix:<@>',namespace => [ 'GLOBAL' ],), arguments => [$cond] );
        }
        '(loop :while (kp6-true ' ~ $.cond.emit_lisp($interpreter, $indent) ~ ')' ~ Main::newline()
        ~ ' :do '
        ~     $.body.emit_lisp($interpreter, $indent)
        ~ ')'
        ~ Main::newline()
    }
}

class Decl {
    method emit_lisp ($interpreter, $indent) {
        my $decl := $.decl;
        my $name := $.var.name;

	if $decl eq 'our' {
	    return '(define-package-variable ' ~ $.var.emit_lisp_name ~ ' (enclosing-package))' ~ Main::newline()
		 ~ '(define-lexical-variable ' ~ $.var.emit_lisp_name ~ ')' ~ Main::newline()
		 ~ '(set-lexical-variable/c ' ~ $.var.emit_lisp_name ~ ' (lookup-package-variable/c ' ~ $.var.emit_lisp_name ~ ' (enclosing-package)))';
	}
	if $decl eq 'my' {
	    return '(define-lexical-variable ' ~ $.var.emit_lisp_name ~ ')';
	}

	return '(kp6-error ' ~ $interpreter ~ ' \'kp6-not-implemented :feature "\\"' ~ $decl ~ '\\" variables")';

        if $decl eq 'has' {
            return 'sub ' ~ $name ~ ' { ' ~
            '@_ == 1 ' ~
                '? ( $_[0]->{' ~ $name ~ '} ) ' ~
                ': ( $_[0]->{' ~ $name ~ '} = $_[1] ) ' ~
            '}';
        };
        my $create := ', \'new\', { modified => $_MODIFIED, name => \'' ~ $.var.emit_lisp($interpreter, $indent) ~ '\' } ) ';
        if $decl eq 'our' {
            my $s;
            # ??? use vars --> because compile-time scope is too tricky to use 'our'
            # ??? $s := 'use vars \'' ~ $.var.emit_lisp ~ '\'; ';  
            $s := 'our ';

            if ($.var).sigil eq '$' {
                return $s 
                    ~ $.var.emit_lisp($interpreter, $indent)
                    ~ ' = ::DISPATCH( $::Scalar' ~ $create
                    ~ ' unless defined ' ~ $.var.emit_lisp($interpreter, $indent) ~ '; '
                    ~ 'BEGIN { '
                    ~     $.var.emit_lisp($interpreter, $indent)
                    ~     ' = ::DISPATCH( $::Scalar' ~ $create
                    ~     ' unless defined ' ~ $.var.emit_lisp($interpreter, $indent) ~ '; '
                    ~ '}'
            };
            if ($.var).sigil eq '&' {
                return $s 
                    ~ $.var.emit_lisp($interpreter, $indent)
                    ~ ' = ::DISPATCH( $::Routine' ~ $create ~ ';'
            };
            if ($.var).sigil eq '%' {
                return $s ~ $.var.emit_lisp($interpreter, $indent)
                    ~ ' = ::DISPATCH( $::Hash' ~ $create ~ ';'
            };
            if ($.var).sigil eq '@' {
                return $s ~ $.var.emit_lisp($interpreter, $indent)
                    ~ ' = ::DISPATCH( $::Array' ~ $create ~ ';'
            };
            return $s ~ $.var.emit_lisp($interpreter, $indent)
        };
        if ($.var).sigil eq '$' {
            return 
                  $.decl ~ ' ' 
                # ~ $.type ~ ' ' 
                ~ $.var.emit_lisp($interpreter, $indent) ~ '; '
                ~ $.var.emit_lisp($interpreter, $indent)
                ~ ' = ::DISPATCH( $::Scalar' ~ $create
                ~ ' unless defined ' ~ $.var.emit_lisp($interpreter, $indent) ~ '; '
                ~ 'BEGIN { '
                ~     $.var.emit_lisp($interpreter, $indent)
                ~     ' = ::DISPATCH( $::Scalar' ~ $create
                ~ '}'
        };
        if ($.var).sigil eq '&' {
            return 
                  $.decl ~ ' ' 
                # ~ $.type ~ ' ' 
                ~ $.var.emit_lisp($interpreter, $indent) ~ '; '
                ~ $.var.emit_lisp($interpreter, $indent)
                ~ ' = ::DISPATCH( $::Routine' ~ $create
                ~ ' unless defined ' ~ $.var.emit_lisp($interpreter, $indent) ~ '; '
                ~ 'BEGIN { '
                ~     $.var.emit_lisp($interpreter, $indent)
                ~     ' = ::DISPATCH( $::Routine' ~ $create
                ~ '}'
        };
        if ($.var).sigil eq '%' {
            return $.decl ~ ' ' 
                # ~ $.type 
                ~ ' ' ~ $.var.emit_lisp($interpreter, $indent)
                ~ ' = ::DISPATCH( $::Hash' ~ $create ~ '; '
        };
        if ($.var).sigil eq '@' {
            return $.decl ~ ' ' 
                # ~ $.type 
                ~ ' ' ~ $.var.emit_lisp($interpreter, $indent)
                ~ ' = ::DISPATCH( $::Array' ~ $create ~ '; '
        };
        return $.decl ~ ' ' 
            # ~ $.type ~ ' ' 
            ~ $.var.emit_lisp($interpreter, $indent);
    }
}

class Sig {
    method emit_lisp ($interpreter, $indent) {
	my $str := '(make-instance \'kp6-signature';

	if $.invocant {
	    $str := $str ~ ' :invocant ' ~ $.invocant.emit_lisp($interpreter, $indent);
	}

	$str := $str ~ ' :positional (list';

	for @($.positional) -> $decl {
	    $str := $str ~ ' (make-instance \'kp6-named-parameter :name ' ~ $decl.emit_lisp_name($interpreter, $indent) ~ ')';
	}

	$str := $str ~ ')';

	$str := $str ~ ')';

	return $str;
    };
}

class Capture {
    method emit_lisp ($interpreter, $indent) {
        my $s := '(kp6-new \'capture ';
        if defined $.invocant {
           $s := $s ~ 'invocant: ' ~ $.invocant.emit_lisp($interpreter, $indent) ~ ', ';
        }
        else {
            $s := $s ~ 'invocant: $::Undef, '
        };
        if defined $.array {
           $s := $s ~ 'array: ::DISPATCH( $::Array, "new", { _array => [ ';
                            my $item;
           for @.array -> $item { 
                $s := $s ~ $item.emit_lisp($interpreter, $indent) ~ ', ';
            }
            $s := $s ~ ' ] } ),';
        };
        if defined $.hash {
           $s := $s ~ 'hash: ::DISPATCH( $::Hash, "new", { _hash => { ';
                           my $item;
           for @.hash -> $item { 
                $s := $s ~ ($item[0]).emit_lisp($interpreter, $indent) ~ '->{_value} => ' ~ ($item[1]).emit_lisp($interpreter) ~ ', ';
            }
            $s := $s ~ ' } } ),';
        };
        return $s ~ ')';
    };
}

class Subset {
    method emit_lisp ($interpreter, $indent) {
          '(kp6-new \'subset ' 
        ~ 'base_class: ' ~ $.base_class.emit_lisp($interpreter, $indent) 
        ~ ', '
        ~ 'block: '    
        ~       'sub { local $_ = shift; ' ~ ($.block.block).emit_lisp($interpreter, $indent) ~ ' } '    # XXX
        ~ ')';
    }
}

class Method {
    method emit_lisp ($interpreter, $indent) {
          '(kp6-new \'code '
        ~   'code: sub { '  
        ~     $.block.emit_declarations($interpreter, $indent) 
        ~     '$self = shift; ' 
        ~     $.block.emit_arguments($interpreter, $indent) 
        ~     $.block.emit_body($interpreter, $indent)
        ~    ' '
        ~   'signature: ' 
        ~       $.block.emit_signature($interpreter, $indent)
        ~ ')';
    }
}

class Sub {
    method emit_lisp ($interpreter, $indent) {
	return '(make-kp6-sub (' ~ $.block.emit_signature($interpreter, $indent) ~ ')' ~ Main::newline() ~ $.block.emit_body($interpreter, $indent) ~ ')';
    }
}

class Do {
    # Everything's an expression in lisp so do {} is implicit:)
    method emit_lisp ($interpreter, $indent) {
        $.block.emit_lisp($interpreter, $indent);
    }
}

class BEGIN {
    method emit_lisp ($interpreter, $indent) {
        'BEGIN { ' ~ 
          $.block.emit_lisp($interpreter, $indent) ~ 
        ' }'
    }
}

class Use {
    method emit_lisp ($interpreter, $indent) {
        if ($.mod eq 'v6') {
            return Main::newline() ~ '#use v6' ~ Main::newline();
        }
        if ( $.perl5 ) {
            return 'use ' ~ $.mod ~ ';$::' ~ $.mod ~ '= KindaPerl6::Runtime::Perl5::Wrap::use5(\'' ~ $.mod ~ '\')';
        } else {
            return 'use ' ~ $.mod;
        }
    }
}

=begin

=head1 NAME 

KindaPerl6::Perl5::Lisp - Code generator for KindaPerl6-in-Lisp

=head1 DESCRIPTION

This module generates Common Lisp code for the KindaPerl6
compiler. The runtime is located in F<lib/KindaPerl6/Runtime/Lisp/>.

=head1 CONFORMANCE

sbcl is currently the primary runtime being used to develop this,
clisp is also tested occasionally.

=head1 AUTHORS

The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 homepage at L<http://dev.perl.org/perl6>.

The Pugs homepage at L<http://pugscode.org/>.

=head1 COPYRIGHT

Copyright 2007 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=end
