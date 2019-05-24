grammar ProductionTypes;

/*
 * Handles `common/production_types.txt`.
 */

// types will be sorted by their types and templates etc if its used as a template, mark it as a
// template. if it uses a template, its a factory. rgo's can be worked like this as well
productionType: IDENTIFIER ASSIGN L_BRACE /* */ R_BRACE EOF;

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

IDENTIFIER: LETTERS (LETTERS | DIGIT)*;

fragment DIGIT: ('0' .. '9');
fragment LETTERS: ('a' .. 'z' | 'A' .. 'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
