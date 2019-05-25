grammar Issues;

/*
 * Handles `common/issues.txt`.
 */

// TODO issues
issues: EOF;

IDENTIFIER: LETTER (LETTER | DIGIT)*;

fragment DIGIT: ('0' .. '9');
fragment LETTER: ('a' .. 'z' | 'A' .. 'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
