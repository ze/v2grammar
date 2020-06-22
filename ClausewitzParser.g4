parser grammar ClausewitzParser;
options { tokenVocab = ClausewitzLexer; }

program: expr* EOF;

expr:
    assignExpr
    | braceExpr;

assignExpr: assignType ASSIGN assignValue;

assignType:
    IDENTIFIER
    | INT
    | DATE;

assignValue:
    exprType
    | braceExpr;

braceExpr: L_BRACE braceValue* R_BRACE;

braceValue:
    exprType
    | expr;

exprType:
    IDENTIFIER
    | STRING
    | INT
    | FLOAT
    | DATE;
