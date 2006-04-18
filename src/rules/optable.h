#ifndef PGE_OPTABLE_H

#include <Judy.h>

#define HashIns(x, y, z) \
        *(JudySLIns(&x, y, PJE0)) = (PPvoid_t)z

#define HashSet(x, y) \
        *(JudySLIns(&x, y, PJE0))

#define HashFree(x) \
        JudySLFreeArray(&x, PJE0)

#define PGE_OPTABLE_H 1

#define PGE_OPTABLE_ARITY           0x0003
#define PGE_OPTABLE_ASSOC           0x000c
#define PGE_OPTABLE_ASSOC_RIGHT     0x0004
#define PGE_OPTABLE_ASSOC_LIST      0x0008
#define PGE_OPTABLE_NOWS            0x1000
#define PGE_OPTABLE_NULLTERM        0x2000

#define PGE_OPTABLE_EXPECT          0x00f0
#define PGE_OPTABLE_EXPECT_TERM     0x0010
#define PGE_OPTABLE_EXPECT_OPER     0x0060
#define PGE_OPTABLE_EXPECT_TERMPOST 0x0050

#define PGE_OPTABLE_SYNCAT          0x0f00

#define PGE_OPTABLE_EMPTY           0x0000
#define PGE_OPTABLE_TERM            0x0100
#define PGE_OPTABLE_POSTFIX         0x0200
#define PGE_OPTABLE_CLOSE           0x0300
#define PGE_OPTABLE_PREFIX          0x0400
#define PGE_OPTABLE_PRELIST         0x0500
#define PGE_OPTABLE_INFIX           0x0600
#define PGE_OPTABLE_TERNARY         0x0700
#define PGE_OPTABLE_POSTCIRCUMFIX   0x0800
#define PGE_OPTABLE_CIRCUMFIX       0x0900

#define PGE_SCTABLE_TERM            0x0110
#define PGE_SCTABLE_POSTFIX         0x0221
#define PGE_SCTABLE_CLOSE           0x0320
#define PGE_SCTABLE_PREFIX          0x0411
#define PGE_SCTABLE_PRELIST         0x0511
#define PGE_SCTABLE_INFIX           0x0622
#define PGE_SCTABLE_TERNARY         0x0723
#define PGE_SCTABLE_POSTCIRCUMFIX   0x0842
#define PGE_SCTABLE_CIRCUMFIX       0x0911

typedef double TokenPrec;
typedef char* TokenName;
typedef unsigned int Pos;
typedef unsigned int Bool;
typedef unsigned int ParseMode;
typedef void* Callback; /* callback */
typedef void* Extras; /* extras */

typedef Pvoid_t Array;
typedef Pvoid_t Hash;
typedef const char* Str;

/* static Pvoid_t sctable = (PWord_t)NULL; */

struct _op_parser {
    Hash tokens;
    Hash keys;
    Hash klens;
    Callback ws;
};
typedef struct _op_parser OpParser;

struct _op_token {
    TokenName   name;
    TokenPrec   prec;
    Callback    parsed;
    Str         key_close;
    TokenPrec   prec_close;
    ParseMode   mode;
    Extras      extras;
};
typedef struct _op_token OpToken;

struct _op_match {
    OpToken     token;
    Pos         from;
    Pos         to;
    Str         target;
};
typedef struct _op_match OpMatch;

ParseMode sctable (Str in);

#endif
