grammar Goods;

/*
 * Handles `common/goods.txt`.
 */

goods: goodsType* EOF;
goodsType:
	militaryGoodsType
	| rawMaterialGoodsType
	| industrialGoodsType
	| consumerGoodsType;

militaryGoodsType:
	MILITARY_GOODS ASSIGN L_BRACE resource* R_BRACE;
rawMaterialGoodsType:
	RAW_MATERIAL_GOODS ASSIGN L_BRACE resource* R_BRACE;
industrialGoodsType:
	INDUSTRIAL_GOODS ASSIGN L_BRACE resource* R_BRACE;
consumerGoodsType:
	CONSUMER_GOODS ASSIGN L_BRACE resource* R_BRACE;

resource: IDENTIFIER ASSIGN L_BRACE resourceData* R_BRACE;
resourceData:
	costExpr
	| colorExpr
	| availableFromStartExpr
	| tradeableExpr
	| moneyExpr
	| overseasPenaltyExpr;

costExpr: COST ASSIGN (INT | FLOAT);
colorExpr: COLOR ASSIGN L_BRACE INT INT INT R_BRACE;
availableFromStartExpr: AVAILABLE_FROM_START ASSIGN affirmative;
tradeableExpr: TRADEABLE ASSIGN affirmative;
moneyExpr: MONEY ASSIGN affirmative;
overseasPenaltyExpr: OVERSEAS_PENALTY ASSIGN affirmative;

MILITARY_GOODS: 'military_goods';
RAW_MATERIAL_GOODS: 'raw_material_goods';
INDUSTRIAL_GOODS: 'industrial_goods';
CONSUMER_GOODS: 'consumer_goods';
COST: 'cost';
COLOR: 'color';
AVAILABLE_FROM_START: 'available_from_start';
TRADEABLE: 'tradeable';
MONEY: 'money';
OVERSEAS_PENALTY: 'overseas_penalty';

FLOAT: INT? '.' DIGIT+;

INT: '-'? DIGIT+;
fragment DIGIT: ('0' .. '9');

affirmative: YES | NO;
YES: 'yes';
NO: 'no';

// boolean operators
AND: 'AND';
OR: 'OR';
NOT: 'NOT';

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

STRING: '"' (~'"' | '\\"')* '"';
IDENTIFIER: LETTERS (LETTERS | '0' .. '9')*;
fragment LETTERS: ('a' .. 'z' | 'A' .. 'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
