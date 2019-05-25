grammar Pops;

/*
 * Handle every file in `history/pops`.
 */

pops: province* EOF;
province: INT ASSIGN L_BRACE popType* R_BRACE;

popType: IDENTIFIER ASSIGN L_BRACE popTypeData* R_BRACE;

popTypeData: cultureExpr | religionExpr | sizeExpr;

cultureExpr: CULTURE ASSIGN IDENTIFIER;
religionExpr: RELIGION ASSIGN IDENTIFIER;
sizeExpr: SIZE ASSIGN INT;

CULTURE: 'culture';
RELIGION: 'religion';
SIZE: 'size';

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

INT: DIGIT+;
fragment DIGIT: ('0' .. '9');

IDENTIFIER: LETTER (LETTER | '0' .. '9')*;
fragment LETTER: ('a' .. 'z' | 'A' .. 'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
