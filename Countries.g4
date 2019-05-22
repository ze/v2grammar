grammar Countries;

/*
 * Handles the countries.txt file in directory `common`.
 */

countryListing: (countrySpec | dynamicTagsExpr)* EOF;
countrySpec: COUNTRY_TAG ASSIGN STRING;
dynamicTagsExpr: DYNAMIC_TAGS ASSIGN affirmative;

DYNAMIC_TAGS: 'dynamic_tags';
affirmative: YES | NO;
YES: 'yes';
NO: 'no';

/*
 * Handle any country definition file in directory `common/countries`.
 */

countryDefinition: countryDefs* EOF;
countryDefs:
	colorExpr
	| graphicalCultureExpr
	| partyBlock
	| unitNamesBlock;

colorExpr: COLOR ASSIGN L_BRACE INT INT INT R_BRACE;
graphicalCultureExpr: GRAPHICAL_CULTURE ASSIGN IDENTIFIER;

partyBlock: PARTY ASSIGN L_BRACE partyInfo* R_BRACE;
partyInfo:
	nameExpr
	| startDateExpr
	| endDateExpr
	| ideologyExpr
	// TODO social policies. need to parse that separately and validate
	| policyExpr;

unitNamesBlock: UNIT_NAMES ASSIGN L_BRACE unitNameExpr* R_BRACE;

unitNameExpr:
	IDENTIFIER ASSIGN L_BRACE (STRING | IDENTIFIER)* R_BRACE;

nameExpr: NAME ASSIGN STRING;
startDateExpr: START_DATE ASSIGN DATE;
endDateExpr: END_DATE ASSIGN DATE;
ideologyExpr: IDEOLOGY ASSIGN IDENTIFIER;
policyExpr: IDENTIFIER ASSIGN IDENTIFIER;

COLOR: 'color';
GRAPHICAL_CULTURE: 'graphical_culture';
UNIT_NAMES: 'unit_names';
PARTY: 'party';
NAME: 'name';
START_DATE: 'start_date';
END_DATE: 'end_date';
IDEOLOGY: 'ideology';
DATE: INT '.' INT '.' INT;

COUNTRY_TAG: (CAP_LETTER CAP_OR_DIGIT CAP_OR_DIGIT);
fragment CAP_OR_DIGIT: CAP_LETTER | DIGIT;
fragment CAP_LETTER: ('A' ..'Z');

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

STRING: '"' (~'"' | '\\"')* '"';

INT: '-'? DIGIT+;
IDENTIFIER: LETTERS (LETTERS | DIGIT)*;

fragment DIGIT: ('0' ..'9');
fragment LETTERS: ('a' ..'z' | 'A' ..'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
