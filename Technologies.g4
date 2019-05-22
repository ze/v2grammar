grammar Technologies;

/*
 * Handles every file inside `technologies`. The files to be read will be defined in
 * `common/technology.txt`. (see Technology.g4)
 */

import Conditions;

technologies: technology* EOF;
technology:
	IDENTIFIER ASSIGN L_BRACE (
		areaExpr
		| yearExpr
		| costExpr
		| uncivMilitaryExpr
		| technologyEffect
		| aiChanceBlock
	)* R_BRACE;

areaExpr:
	AREA ASSIGN IDENTIFIER; // the area is defined in common/technology.txt.
yearExpr: YEAR ASSIGN INT;
costExpr: COST ASSIGN INT;
uncivMilitaryExpr: UNCIV_MILITARY ASSIGN affirmative;

technologyEffect:
	activateBuildingExpr
	| activateUnitExpr
	| armyEffect
	| unitEffectBlock // both naval and land
	| unitExpr // what does this do? I'm assuming it does graphical stuff but I have no idea really.
	| commerceEffect
	| cultureEffect
	| industryEffect
	| navalEffect
	| rgoGoodsOutputBlock
		// bottom are both commerce and industry. These two branches have high intersectionality.
	| rgoSizeBlock
	| farmRgoEffExpr;
activateBuildingExpr: ACTIVATE_BUILDING ASSIGN IDENTIFIER;
activateUnitExpr: ACTIVATE_UNIT ASSIGN IDENTIFIER;

armyEffect:
	armyBaseBlock
	| digInCapExpr
	| maxFortExpr
	| combatWidthExpr
	| mobilizationSizeExpr
	| moraleExpr
	| militaryTacticsExpr;

armyBaseBlock: ARMY_BASE ASSIGN L_BRACE armyBaseEffect* R_BRACE;
armyBaseEffect:
	defaultOrganizationExpr
	| supplyConsumptionExpr
	| maximumSpeedExpr;
defaultOrganizationExpr:
	DEFAULT_ORGANIZATION ASSIGN (INT | FLOAT);
supplyConsumptionExpr: SUPPLY_CONSUMPTION ASSIGN (INT | FLOAT);

digInCapExpr: DIG_IN_CAP ASSIGN INT;
maxFortExpr: MAX_FORT ASSIGN INT;
combatWidthExpr: COMBAT_WIDTH ASSIGN INT;
mobilizationSizeExpr:
	MOBILIZATION_SIZE ASSIGN (INT | FLOAT);
	// should never be an int, but just in case. same for below sometimes.
moraleExpr: MORALE ASSIGN (INT | FLOAT);
militaryTacticsExpr: MILITARY_TACTICS ASSIGN (INT | FLOAT);

unitEffectBlock: IDENTIFIER ASSIGN L_BRACE unitEffect* R_BRACE;
unitEffect:
	supportExpr
	| attackExpr
	| defenseExpr
	| supplyConsumptionExpr;
supportExpr: SUPPORT ASSIGN (INT | FLOAT);
attackExpr: ATTACK ASSIGN (INT | FLOAT);
defenseExpr: DEFENSE ASSIGN (INT | FLOAT);

unitExpr: UNIT ASSIGN INT;

commerceEffect:
	taxEffExpr
	| administrativeEfficiencyExpr
	| factoryInputExpr
	| factoryOutputExpr
	| influenceExpr;
taxEffExpr: TAX_EFF ASSIGN (INT | FLOAT);
administrativeEfficiencyExpr:
	ADMINISTRATIVE_EFFICIENCY ASSIGN (INT | FLOAT); // should never be an int but can happen.
factoryInputExpr: FACTORY_INPUT ASSIGN (INT | FLOAT);
factoryOutputExpr: FACTORY_OUTPUT ASSIGN (INT | FLOAT);

rgoGoodsOutputBlock:
	RGO_GOODS_OUTPUT ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
rgoSizeBlock: RGO_SIZE ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
rgoGoodExpr: IDENTIFIER ASSIGN (INT | FLOAT);

influenceExpr: INFLUENCE ASSIGN (INT | FLOAT);
farmRgoEffExpr: FARM_RGO_EFF ASSIGN (INT | FLOAT);

cultureEffect:
	prestigeExpr
	| increaseResearchExpr
	| colonialMigrationExpr
	| educationEfficiencyExpr
	| maxNationalFocusExpr
	| cbCreationSpeed
	| diplomaticPointsExpr
	| regularExperienceLevelExpr
	| reinforceRateExpr;
prestigeExpr: PRESTIGE ASSIGN (INT | FLOAT);
increaseResearchExpr: INCREASE_RESEARCH ASSIGN (INT | FLOAT);
colonialMigrationExpr: COLONIAL_MIGRATION ASSIGN (INT | FLOAT);
educationEfficiencyExpr:
	EDUCATION_EFFICIENCY ASSIGN (INT | FLOAT);
maxNationalFocusExpr: MAX_NATIONAL_FOCUS ASSIGN INT;
cbCreationSpeed: CB_CREATION_SPEED ASSIGN (INT | FLOAT);
diplomaticPointsExpr: DIPLOMATIC_POINTS ASSIGN (INT | FLOAT);
regularExperienceLevelExpr: REGULAR_EXPERIENCE_LEVEL ASSIGN INT;
reinforceRateExpr: REINFORCE_RATE ASSIGN (INT | FLOAT);

industryEffect:
	factoryThroughputExpr
	| factoryCostExpr
	| rgoOutputExpr
	| factoryGoodsOutputBlock
	| maxRailroadExpr
	| supplyLimitExpr;
factoryThroughputExpr: FACTORY_THROUGHPUT ASSIGN (INT | FLOAT);
factoryCostExpr: FACTORY_COST ASSIGN (INT | FLOAT);
rgoOutputExpr: RGO_OUTPUT ASSIGN (INT | FLOAT);
factoryGoodsOutputBlock:
	FACTORY_GOODS_OUTPUT ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
maxRailroadExpr: MAX_RAILROAD ASSIGN (INT | FLOAT);
supplyLimitExpr: SUPPLY_LIMIT ASSIGN (INT | FLOAT);

navalEffect:
	navyBaseBlock
	| colonialPointsExpr
	| maxNavalBaseExpr
	| colonialPrestigeExpr
	| supplyRangeExpr;
navyBaseBlock: NAVY_BASE ASSIGN L_BRACE navyBaseEffect* R_BRACE;
navyBaseEffect:
	maximumSpeedExpr
	| buildTimeExpr
	| defaultOrganizationExpr;
maximumSpeedExpr: MAXIMUM_SPEED ASSIGN (INT | FLOAT);
buildTimeExpr: BUILD_TIME ASSIGN (INT | FLOAT);

colonialPointsExpr: COLONIAL_POINTS ASSIGN INT;
maxNavalBaseExpr: MAX_NAVAL_BASE ASSIGN INT;
colonialPrestigeExpr: COLONIAL_PRESTIGE ASSIGN (INT | FLOAT);
supplyRangeExpr: SUPPLY_RANGE ASSIGN (INT | FLOAT);

aiChanceBlock:
	AI_CHANCE ASSIGN L_BRACE (factorExpr | modifierBlock)* R_BRACE;

modifierBlock:
	MODIFIER ASSIGN L_BRACE (factorExpr | condition)* R_BRACE;
factorExpr: FACTOR ASSIGN (INT | FLOAT);

// this grammar is ok with either spelling of not sadly.
NOT: 'not' | 'NOT';

AREA: 'area';
COST: 'cost';
UNCIV_MILITARY: 'unciv_military';
ACTIVATE_BUILDING: 'activate_building';
ACTIVATE_UNIT: 'activate_unit';
AI_CHANCE: 'ai_chance';
MODIFIER: 'modifier';
FACTOR: 'factor';

ARMY_BASE: 'army_base';
DEFAULT_ORGANIZATION: 'default_organisation';
SUPPLY_CONSUMPTION: 'supply_consumption';
DIG_IN_CAP: 'dig_in_cap';
MAX_FORT: 'max_fort';
COMBAT_WIDTH: 'combat_width';
MOBILIZATION_SIZE:
	'mobilisation_size'; // z is way cooler than s.
MORALE: 'morale';
MILITARY_TACTICS: 'military_tactics';

SUPPORT: 'support';
ATTACK: 'attack';
DEFENSE: 'defence'; // this anglo spelling is really annoying.

UNIT: 'unit';

TAX_EFF: 'tax_eff';
ADMINISTRATIVE_EFFICIENCY: 'administrative_efficiency';
FACTORY_INPUT: 'factory_input';
FACTORY_OUTPUT: 'factory_output';
RGO_GOODS_OUTPUT: 'rgo_goods_output';
RGO_SIZE: 'rgo_size';
INFLUENCE: 'influence';
FARM_RGO_EFF: 'farm_rgo_eff';

PRESTIGE: 'prestige';
INCREASE_RESEARCH: 'increase_research';
COLONIAL_MIGRATION: 'colonial_migration';
EDUCATION_EFFICIENCY: 'education_efficiency';
MAX_NATIONAL_FOCUS: 'max_national_focus';
CB_CREATION_SPEED: 'cb_creation_speed';
DIPLOMATIC_POINTS: 'diplomatic_points';
REGULAR_EXPERIENCE_LEVEL: 'regular_experience_level';
REINFORCE_RATE: 'reinforce_rate';

FACTORY_THROUGHPUT: 'factory_throughput';
FACTORY_COST: 'factory_cost';
RGO_OUTPUT: 'rgo_output';
FACTORY_GOODS_OUTPUT: 'factory_goods_output';
MAX_RAILROAD: 'max_railroad';
SUPPLY_LIMIT: 'supply_limit';

NAVY_BASE: 'navy_base';
MAXIMUM_SPEED: 'maximum_speed';
COLONIAL_POINTS: 'colonial_points';
MAX_NAVAL_BASE: 'max_naval_base';
BUILD_TIME: 'build_time';
COLONIAL_PRESTIGE: 'colonial_prestige';
SUPPLY_RANGE: 'supply_range';
