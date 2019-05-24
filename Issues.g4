grammar Issues;

/*
 * Handles `common/issues.txt`.
 */

// TODO issues
issues: EOF;

IDENTIFIER: LETTERS (LETTERS | DIGIT)*;

fragment DIGIT: ('0' .. '9');
fragment LETTERS: ('a' .. 'z' | 'A' .. 'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
