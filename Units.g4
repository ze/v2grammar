grammar Units;

/*
 * Handles every file inside `units`.
 */

unit: IDENTIFIER ASSIGN L_BRACE unitData* R_BRACE EOF;

unitData:
	iconType
	| typeExpr
	| spriteExpr
	| activeExpr
	| unitTypeExpr
	| primaryCultureExpr
	| floatingFlagExpr
	| priorityExpr
	| maxStrengthExpr
	| weightedValueExpr
	| defaultOrganizationExpr
	| maximumSpeedExpr
	| canBuildOverseasExpr
	| buildTimeExpr
	| buildCostBlock
	| supplyConsumptionExpr
	| supplyCostBlock
	| unitAbilities
	| capitalExpr
	| moveSoundExpr
	| selectSoundExpr
	| colonialPointsExpr
	| minPortLevelExpr
	| limitPerPortExpr
	| supplyConsumptionScoreExpr
	| spriteOverrideExpr
	| spriteMountExpr
	| spriteMountAttachNodeExpr
	| sailExpr
	| transportExpr;

iconType: iconExpr | navalIconExpr;

iconExpr: ICON ASSIGN INT;
navalIconExpr: NAVAL_ICON ASSIGN INT;

typeExpr: TYPE ASSIGN (LAND | NAVAL);
spriteExpr: SPRITE ASSIGN IDENTIFIER;
activeExpr: ACTIVE ASSIGN affirmative;
unitTypeExpr:
	UNIT_TYPE ASSIGN (SUPPORT | TRANSPORT | IDENTIFIER);
primaryCultureExpr: PRIMARY_CULTURE ASSIGN affirmative;
floatingFlagExpr: FLOATING_FLAG ASSIGN affirmative;
priorityExpr: PRIORITY ASSIGN INT;
maxStrengthExpr: MAX_STRENGTH ASSIGN INT;
weightedValueExpr: WEIGHTED_VALUE ASSIGN (INT | FLOAT);
defaultOrganizationExpr: DEFAULT_ORGANIZATION ASSIGN INT;
maximumSpeedExpr: MAXIMUM_SPEED ASSIGN (INT | FLOAT);
canBuildOverseasExpr: CAN_BUILD_OVERSEAS ASSIGN affirmative;
buildTimeExpr: BUILD_TIME ASSIGN INT;
buildCostBlock: BUILD_COST ASSIGN L_BRACE resourceExpr* R_BRACE;
supplyConsumptionExpr: SUPPLY_CONSUMPTION ASSIGN (INT | FLOAT);
supplyCostBlock:
	SUPPLY_COST ASSIGN L_BRACE resourceExpr* R_BRACE;
capitalExpr: CAPITAL ASSIGN affirmative;
moveSoundExpr: MOVE_SOUND ASSIGN IDENTIFIER;
selectSoundExpr: SELECT_SOUND ASSIGN IDENTIFIER;
colonialPointsExpr: COLONIAL_POINTS ASSIGN INT;
minPortLevelExpr: MIN_PORT_LEVEL ASSIGN INT;
limitPerPortExpr: LIMIT_PER_PORT ASSIGN INT;
supplyConsumptionScoreExpr: SUPPLY_CONSUMPTION_SCORE ASSIGN INT;
spriteOverrideExpr: SPRITE_OVERRIDE ASSIGN IDENTIFIER;
spriteMountExpr: SPRITE_MOUNT ASSIGN IDENTIFIER;
spriteMountAttachNodeExpr:
	SPRITE_MOUNT_ATTACH_NODE ASSIGN IDENTIFIER;
sailExpr: SAIL ASSIGN affirmative;
transportExpr: TRANSPORT ASSIGN affirmative;

resourceExpr: IDENTIFIER ASSIGN (INT | FLOAT);

unitAbilities: (landAbility | navalAbility)+;
landAbility:
	reconExpr
	| attackExpr
	| defenseExpr
	| disciplineExpr
	| supportExpr
	| maneuverExpr
	| siegeExpr;
reconExpr: RECON ASSIGN (INT | FLOAT);
attackExpr: ATTACK ASSIGN (INT | FLOAT);
defenseExpr: DEFENSE ASSIGN (INT | FLOAT);
disciplineExpr: DISCIPLINE ASSIGN (INT | FLOAT);
supportExpr: SUPPORT ASSIGN (INT | FLOAT);
maneuverExpr: MANEUVER ASSIGN (INT | FLOAT);
siegeExpr: SIEGE ASSIGN (INT | FLOAT);

navalAbility:
	hullExpr
	| gunPowerExpr
	| fireRangeExpr
	| evasionExpr
	| torpedoAttackExpr;
hullExpr: HULL ASSIGN (INT | FLOAT);
gunPowerExpr: GUN_POWER ASSIGN (INT | FLOAT);
fireRangeExpr: FIRE_RANGE ASSIGN (INT | FLOAT);
evasionExpr: EVASION ASSIGN (INT | FLOAT);
torpedoAttackExpr: TORPEDO_ATTACK ASSIGN (INT | FLOAT);

ICON: 'icon';
NAVAL_ICON: 'naval_icon';
TYPE: 'type';
SPRITE: 'sprite';
LAND: 'land';
NAVAL: 'naval';
ACTIVE: 'active';
UNIT_TYPE: 'unit_type';
PRIMARY_CULTURE: 'primary_culture';
FLOATING_FLAG: 'floating_flag';
PRIORITY: 'priority';
MAX_STRENGTH: 'max_strength';
DEFAULT_ORGANIZATION: 'default_organisation';
MAXIMUM_SPEED: 'maximum_speed';
CAN_BUILD_OVERSEAS: 'can_build_overseas';
WEIGHTED_VALUE: 'weighted_value';
BUILD_TIME: 'build_time';
BUILD_COST: 'build_cost';
SUPPLY_CONSUMPTION: 'supply_consumption';
SUPPLY_COST: 'supply_cost';
RECON: 'reconnaissance';
ATTACK: 'attack';
DEFENSE: 'defence'; // usa usa usa
DISCIPLINE: 'discipline';
SUPPORT: 'support';
MANEUVER: 'maneuver';
SIEGE: 'siege';
HULL: 'hull';
GUN_POWER: 'gun_power';
FIRE_RANGE: 'fire_range';
EVASION: 'evasion';
CAPITAL: 'capital';
MOVE_SOUND: 'move_sound';
SELECT_SOUND: 'select_sound';
COLONIAL_POINTS: 'colonial_points';
MIN_PORT_LEVEL: 'min_port_level';
LIMIT_PER_PORT: 'limit_per_port';
SUPPLY_CONSUMPTION_SCORE: 'supply_consumption_score';
SPRITE_OVERRIDE: 'sprite_override';
SPRITE_MOUNT: 'sprite_mount';
SPRITE_MOUNT_ATTACH_NODE: 'sprite_mount_attach_node';
SAIL: 'sail';
TRANSPORT: 'transport';
TORPEDO_ATTACK: 'torpedo_attack';

affirmative: YES | NO;
YES: 'yes';
NO: 'no';

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

IDENTIFIER: LETTERS (LETTERS | DIGIT)*;

FLOAT: INT? '.' DIGIT+;

INT: '-'? DIGIT+;
fragment DIGIT: ('0' ..'9');
fragment LETTERS: ('a' ..'z' | 'A' ..'Z' | '_');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
