grammar Provinces;

/*
 * Handle every file in `history/provinces`.
 */

province: provinceData* EOF;
provinceData:
	ownerExpr
	| controllerExpr
	| addCoreExpr
	| tradeGoodsExpr
	| lifeRatingExpr
	| terrainExpr
	| fortExpr
	| railroadExpr
	| navalBaseExpr
	| colonialExpr
	| partyLoyaltyBlock
	| stateBuildingBlock
	| dateBlock;

ownerExpr: OWNER ASSIGN COUNTRY_TAG;
controllerExpr: CONTROLLER ASSIGN COUNTRY_TAG;
addCoreExpr: ADD_CORE ASSIGN COUNTRY_TAG;
tradeGoodsExpr: TRADE_GOODS ASSIGN IDENTIFIER;
lifeRatingExpr: LIFE_RATING ASSIGN INT;
terrainExpr: TERRAIN ASSIGN IDENTIFIER;
fortExpr: FORT ASSIGN INT;
railroadExpr: RAILROAD ASSIGN INT;
navalBaseExpr: NAVAL_BASE ASSIGN INT;
colonialExpr: COLONIAL ASSIGN INT;

partyLoyaltyBlock:
	PARTY_LOYALTY ASSIGN L_BRACE (
		ideologyExpr
		| loyaltyValueExpr
	)* R_BRACE;
ideologyExpr: IDEOLOGY ASSIGN IDENTIFIER;
loyaltyValueExpr: LOYALTY_VALUE ASSIGN INT;

stateBuildingBlock:
	STATE_BUILDING ASSIGN L_BRACE (
		levelExpr
		| buildingExpr
		| upgradeExpr
	)* R_BRACE;
levelExpr: LEVEL ASSIGN INT;
buildingExpr: BUILDING ASSIGN IDENTIFIER;
upgradeExpr: UPGRADE ASSIGN affirmative;

dateBlock: DATE ASSIGN L_BRACE provinceData* R_BRACE;

OWNER: 'owner';
CONTROLLER: 'controller';
ADD_CORE: 'add_core';
TRADE_GOODS: 'trade_goods';
LIFE_RATING: 'life_rating';
TERRAIN: 'terrain';
FORT: 'fort';
RAILROAD: 'railroad';
NAVAL_BASE: 'naval_base';
COLONIAL: 'colonial';

PARTY_LOYALTY: 'party_loyalty';
IDEOLOGY: 'ideology';
LOYALTY_VALUE: 'loyalty_value';

STATE_BUILDING: 'state_building';
LEVEL: 'level';
BUILDING: 'building';
UPGRADE: 'upgrade';

affirmative: YES | NO;
YES: 'yes';
NO: 'no';

DATE: INT '.' INT '.' INT;

COUNTRY_TAG: CAP_LETTER CAP_LETTER CAP_LETTER;
fragment CAP_LETTER: ('A' .. 'Z');

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

INT: DIGIT+;
IDENTIFIER: LETTERS (LETTERS | DIGIT)*;
fragment DIGIT: ('0' .. '9');
fragment LETTERS: ('a' .. 'z' | 'A' .. 'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
