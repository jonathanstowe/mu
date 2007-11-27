{ package KindaPerl6::Grammar; 
# Do not edit this file - Perl 5 generated by KindaPerl6
# AUTHORS, COPYRIGHT: Please look at the source file.
use v5;
use strict;
no strict "vars";
use constant KP6_DISABLE_INSECURE_CODE => 0;
use KindaPerl6::Runtime::Perl5::Runtime;
my $_MODIFIED; INIT { $_MODIFIED = {} }
INIT { $_ = ::DISPATCH($::Scalar, "new", { modified => $_MODIFIED, name => "$_" } ); }
do {do { if (::DISPATCH(::DISPATCH(::DISPATCH(  ( $GLOBAL::Code_VAR_defined = $GLOBAL::Code_VAR_defined || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', $::KindaPerl6::Grammar )
,"true"),"p5landish") ) { }  else { do {do {::MODIFIED($::KindaPerl6::Grammar);
$::KindaPerl6::Grammar = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'KindaPerl6::Grammar' )
 )
, 'PROTOTYPE',  )
}} } }
; do { use vars qw($_rule_double_quoted); $_rule_double_quoted = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?!(?:(?:\\)|(?:\')|(?:\")|(?:\$)|(?:\@)|(?:\%)))(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_double_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "double_quoted" ]; })))|(?:))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "double_quoted" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_double_quoted/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_quoted_any); $_rule_quoted_any = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?:\n\r?|\r\n?|\X)))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "quoted_any" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_quoted_any/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_quoted_array); $_rule_quoted_array = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?=(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; })(?:(?:\@))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "before" ]; }))(?:(??{ eval '$_rule_var' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "var" ]; }))\[(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))\](?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Apply, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'code' )
, value           => ::DISPATCH( $::Var, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'sigil' )
, value           => ::DISPATCH( $::Str, 'new', '&' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'twigil' )
, value           => ::DISPATCH( $::Str, 'new', '' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' )
, value           => ::DISPATCH( $::Str, 'new', 'prefix:<~>' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'namespace' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [] }
 )
,  } ),  )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'arguments' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'var' )
 )
 )
] }
 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; })))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "quoted_array" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_quoted_array/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_quoted_hash); $_rule_quoted_hash = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?=(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; })(?:(?:\%))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "before" ]; }))(?:(??{ eval '$_rule_var' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "var" ]; }))\{(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))\}(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Apply, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'code' )
, value           => ::DISPATCH( $::Var, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'sigil' )
, value           => ::DISPATCH( $::Str, 'new', '&' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'twigil' )
, value           => ::DISPATCH( $::Str, 'new', '' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' )
, value           => ::DISPATCH( $::Str, 'new', 'prefix:<~>' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'namespace' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [] }
 )
,  } ),  )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'arguments' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'var' )
 )
 )
] }
 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; })))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "quoted_hash" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_quoted_hash/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_quoted_scalar); $_rule_quoted_scalar = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?=(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; })(?:(?:\$))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "before" ]; }))(?:(??{ eval '$_rule_var' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "var" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Apply, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'code' )
, value           => ::DISPATCH( $::Var, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'sigil' )
, value           => ::DISPATCH( $::Str, 'new', '&' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'twigil' )
, value           => ::DISPATCH( $::Str, 'new', '' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' )
, value           => ::DISPATCH( $::Str, 'new', 'prefix:<~>' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'namespace' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [] }
 )
,  } ),  )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'arguments' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'var' )
 )
 )
] }
 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; })))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "quoted_scalar" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_quoted_scalar/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_quoted_exp); $_rule_quoted_exp = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?:(??{ eval '$_rule_quoted_array' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_array" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_array' )
 )
 )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:(?:(??{ eval '$_rule_quoted_hash' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_hash" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_hash' )
 )
 )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:(?:(??{ eval '$_rule_quoted_scalar' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_scalar" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_scalar' )
 )
 )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:\'(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 39 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:\\(?:(?:a(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 7 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:b(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 8 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:t(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 9 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:n(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 10 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:f(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 12 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:r(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 13 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:e(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 27 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:\"(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 34 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:\'(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 39 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:\\(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Char, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'char' )
, value           => ::DISPATCH( $::Int, 'new', 92 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:(?:(??{ eval '$_rule_quoted_any' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_any" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
, value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_any' )
 )
 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))))|(?:(?:(?:\$)|(?:\@)|(?:\%)|(?:))(?:(??{ eval '$_rule_double_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "double_quoted" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
, value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', $MATCH )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; })))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "quoted_exp" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_quoted_exp/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_quoted_exp_seq); $_rule_quoted_exp_seq = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:(?:(??{ eval '$_rule_quoted_exp' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_exp" ]; }))(?:(?:(?=(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; })(?:(?:\"))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "before" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_exp' )
 )
 )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:(?:(??{ eval '$_rule_quoted_exp_seq' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_exp_seq" ]; }))(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Apply, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'code' )
, value           => ::DISPATCH( $::Var, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'sigil' )
, value           => ::DISPATCH( $::Str, 'new', '&' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'twigil' )
, value           => ::DISPATCH( $::Str, 'new', '' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' )
, value           => ::DISPATCH( $::Str, 'new', 'infix:<~>' )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'namespace' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [] }
 )
,  } ),  )
,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'arguments' )
, value           => ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_exp' )
 )
 )
, ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_exp_seq' )
 )
 )
] }
 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; })))))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "quoted_exp_seq" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_quoted_exp_seq/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_single_quoted); $_rule_single_quoted = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:\\(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_single_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture_to_array", "single_quoted" ]; })))|(?:(?!(?:(?:\')))(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_single_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture_to_array", "single_quoted" ]; })))|(?:))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "single_quoted" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_single_quoted/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_angle_quoted); $_rule_angle_quoted = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:\\(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_angle_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture_to_array", "angle_quoted" ]; })))|(?:(?!(?:(?:\>)))(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_angle_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture_to_array", "angle_quoted" ]; })))|(?:))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "angle_quoted" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_angle_quoted/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_french_quoted); $_rule_french_quoted = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:\\(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_french_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture_to_array", "french_quoted" ]; })))|(?:(?!(?:(?:\»)))(?:\n\r?|\r\n?|\X)(?:(??{ eval '$_rule_french_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture_to_array", "french_quoted" ]; })))|(?:))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "french_quoted" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_french_quoted/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
; do { use vars qw($_rule_val_buf); $_rule_val_buf = qr (?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; $GLOBAL::_M2 = $GLOBAL::_M; })(?:(?:\"(?:(??{ eval '$_rule_quoted_exp_seq' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "quoted_exp_seq" ]; }))\"(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'quoted_exp_seq' )
 )
 )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; }))|(?:\'(?:(??{ eval '$_rule_single_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "single_quoted" ]; }))\'(?{ local $GLOBAL::_M = $GLOBAL::_M; Match::from_global_data( $GLOBAL::_M ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; @Match::Matches = (); my $ret = ( sub {do {return(::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
, value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'single_quoted' )
 )
 )
,  } ),  )
)
}; "974^213" } )->();if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; }; })))(?{ local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; $GLOBAL::_M2 = $GLOBAL::_M; }) x; 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "val_buf" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; ( ref($_) ? $_->{_dispatch}( $_, "Str" )->{_value} : $_ ) =~ /$_rule_val_buf/; if ( $GLOBAL::_M2->[1] eq 'to' ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), ); } 
}
; 1 }
