grammar Buildings;

/*
 * Handles creating building definitions in `common/buildings.txt`.
 */

buildings: building* EOF;
building: IDENTIFIER ASSIGN L_BRACE buildingData* R_BRACE;

buildingData:
	typeExpr
	| onCompletionExpr
	| completionSizeExpr
	| maxLevelExpr
	| goodsCostBlock
	| timeExpr
	| visibilityExpr
	| onMapExpr
	| productionTypeExpr // see ProductionTypes.g4
	| popBuildFactoryExpr
	| advancedFactoryExpr
	| strategicFactoryExpr
	| shipyardExpr
	| defaulEnabledExpr
	| infrastructureExpr; // forts, naval bases, railroads are all infrastructure.

typeExpr: TYPE ASSIGN (INFRASTRUCTURE | IDENTIFIER);
// I really hate conflicting identifiers. It can be infrastructure or others.
onCompletionExpr: ON_COMPLETION ASSIGN IDENTIFIER;
completionSizeExpr: COMPLETION_SIZE ASSIGN (INT | FLOAT);
maxLevelExpr: MAX_LEVEL ASSIGN INT;
goodsCostBlock: GOODS_COST ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
rgoGoodExpr: IDENTIFIER ASSIGN (INT | FLOAT); // see Goods.g4
timeExpr: TIME ASSIGN INT;
visibilityExpr: VISIBILITY ASSIGN affirmative;
onMapExpr: ONMAP ASSIGN affirmative;
productionTypeExpr: PRODUCTION_TYPE ASSIGN IDENTIFIER;
popBuildFactoryExpr: POP_BUILD_FACTORY ASSIGN affirmative;
advancedFactoryExpr: ADVANCED_FACTORY ASSIGN affirmative;
strategicFactoryExpr: STRATEGIC_FACTORY ASSIGN affirmative;
defaulEnabledExpr: DEFAULT_ENABLED ASSIGN affirmative;

shipyardExpr: steamExpr | sailExpr;
steamExpr: STEAM ASSIGN affirmative;
sailExpr: SAIL ASSIGN affirmative;

infrastructureExpr:
	provinceExpr
	| fortLevelExpr
	| costExpr
	| navalCapacityExpr
	| capitalExpr
	| portExpr
	| colonialPointsExpr
	| onePerStateExpr
	| colonialRangeExpr
	| localShipBuildExpr
	| infrastructureValueExpr
	| movementCostExpr
	| spawnRailwayTrackExpr;
provinceExpr: PROVINCE ASSIGN affirmative;
fortLevelExpr: FORT_LEVEL ASSIGN INT;
costExpr: COST ASSIGN INT;
navalCapacityExpr: NAVAL_CAPACITY ASSIGN INT;
capitalExpr: CAPITAL ASSIGN affirmative;
portExpr: PORT ASSIGN affirmative;
colonialPointsExpr: COLONIAL_POINTS ASSIGN L_BRACE INT* R_BRACE;

// Amount of levels is defined by max_level earlier on
onePerStateExpr: ONE_PER_STATE ASSIGN affirmative;
colonialRangeExpr: COLONIAL_RANGE ASSIGN INT;
localShipBuildExpr: LOCAL_SHIP_BUILD ASSIGN (INT | FLOAT);
infrastructureValueExpr: INFRASTRUCTURE ASSIGN (INT | FLOAT);
movementCostExpr: MOVEMENT_COST ASSIGN (INT | FLOAT);
spawnRailwayTrackExpr: SPAWN_RAILWAY_TRACK ASSIGN affirmative;

TYPE: 'type';
ON_COMPLETION: 'on_completion';
COMPLETION_SIZE: 'completion_size';
MAX_LEVEL: 'max_level';
GOODS_COST: 'goods_cost';
TIME: 'time';
VISIBILITY: 'visibility';
ONMAP: 'onmap';
PRODUCTION_TYPE: 'production_type';
POP_BUILD_FACTORY: 'pop_build_factory';
ADVANCED_FACTORY: 'advanced_factory';
STRATEGIC_FACTORY: 'strategic_factory';
DEFAULT_ENABLED: 'default_enabled';

STEAM: 'steam';
SAIL: 'sail';

PROVINCE: 'province';
FORT_LEVEL: 'fort_level';
COST: 'cost';
NAVAL_CAPACITY: 'naval_capacity';
CAPITAL: 'capital';
PORT: 'port';
COLONIAL_POINTS: 'colonial_points';
ONE_PER_STATE: 'one_per_state';
COLONIAL_RANGE: 'colonial_range';
LOCAL_SHIP_BUILD: 'local_ship_build';
INFRASTRUCTURE: 'infrastructure';
MOVEMENT_COST: 'movement_cost';
SPAWN_RAILWAY_TRACK: 'spawn_railway_track';

affirmative: YES | NO;
YES: 'yes';
NO: 'no';

FLOAT: INT? '.' DIGIT+;

INT: '-'? DIGIT+;

IDENTIFIER: LETTERS (LETTERS | DIGIT)*;
fragment DIGIT: ('0' ..'9');
fragment LETTERS: ('a' ..'z' | 'A' ..'Z' | '_');

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
