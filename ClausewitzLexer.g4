lexer grammar ClausewitzLexer;

channels {
    COMMENTS_CHANNEL,
    NEWLINE_CHANNEL
}

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

DATE: INT '.' INT '.' INT;

FLOAT: INT? '.' DIGIT+;
INT: '-'? DIGIT+;

STRING: '"' ~('\r' | '\n' | '"')* '"';

IDENTIFIER: LETTER (LETTER | DIGIT)*;
fragment DIGIT: ('0'..'9');
fragment LETTER:
    '\u0024'..'\u003C'
    | '\u003E'..'\u007A'
    | '\u007E'
    | '\u00A1'..'\u00FF'
    | '\u20AC'
    | '\u2018'..'\u201A'
    | '\u201C'..'\u201E'
    | '\u0192'
    | '\u2026'
    | '\u2020'..'\u2022'
    | '\u2013'..'\u2014'
    | '\u02C6'
    | '\u02030'
    | '\u2122'
    | '\u0160'..'\u0161'
    | '\u2039'..'\u203A'
    | '\u0152'..'\u0153'
    | '\u017D'..'\u017E'
    | '\u0178';

WS: [ \t] -> skip;


COMMENT: '#' ~('\r' | '\n')* -> channel(COMMENTS_CHANNEL);
NEWLINES: '\n'+ -> channel(NEWLINE_CHANNEL);
CARRIAGE_RETURN: '\r' -> skip;