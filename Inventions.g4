grammar Inventions;

/*
 * Handles every file inside `inventions`. This works alongside technologies.
 */

// TODO there is an issue with inventions that start off with a number. I do not know how to reframe
// identifier to work. that issue can be found in navy_inventions which has only ONE invention
// starting with a number.

import Conditions;

IDENTIFIER: (LETTER | DIGIT) (LETTER | '0' .. '9')*;

inventions: invention* EOF;
invention: IDENTIFIER ASSIGN L_BRACE inventionData* R_BRACE;
inventionData:
	inventionLimit
	| chanceBlock
	| newsExpr
	| effectBlock
	| corePopConsciousnessModifierExpr
	| corePopMilitancyModifierExpr
	| orgRegainExpr
	| politicalReformDesireExpr
	| socialReformDesireExpr;
inventionLimit:
	LIMIT ASSIGN L_BRACE (armyProfessionalismExpr | condition)* R_BRACE;
// I'm struggling with finding a solution for this. Since an armyProfExpr is also a modifier, and a
// technologyRel. It's as simple as using the context of this block to bar the matching of other
// defined rules here. this is just a workaround for now.

chanceBlock:
	CHANCE ASSIGN L_BRACE (baseExpr | modifierBlock)* R_BRACE;
baseExpr: BASE ASSIGN INT;

newsExpr: NEWS ASSIGN affirmative;

effectBlock: EFFECT ASSIGN L_BRACE effect* R_BRACE;
effect:
	armyEffect
	| commerceEffect
	| industryEffect
	| cultureEffect
	| navalEffect
	| unitExpr
	| activateUnitExpr
	| activateBuildingExpr
	| colonialLifeRatingExpr;

armyEffect:
	armyBaseBlock
	| mobilizationSizeExpr
	| gasAttackExpr
	| gasDefenseExpr
	| moraleExpr
	| mobilizationEconImpactExpr;
armyBaseBlock: ARMY_BASE ASSIGN L_BRACE armyBaseEffect* R_BRACE;
armyBaseEffect:
	defaultOrganizationExpr
	| supplyConsumptionExpr
	| maximumSpeedExpr;
defaultOrganizationExpr:
	DEFAULT_ORGANIZATION ASSIGN (INT | FLOAT);
supplyConsumptionExpr: SUPPLY_CONSUMPTION ASSIGN (INT | FLOAT);

unitExpr: IDENTIFIER ASSIGN L_BRACE unitEffect* R_BRACE;
unitEffect:
	attackExpr
	| defenseExpr
	| reconExpr
	| armyProfessionalismExpr
	| siegeExpr
	| supplyConsumptionExpr
	| maximumSpeedExpr
	| supportExpr
	| defaultOrganizationExpr
	| hullExpr
	| gunPowerExpr
	| torpedoAttackExpr;
attackExpr: ATTACK ASSIGN (INT | FLOAT);
defenseExpr: DEFENSE ASSIGN (INT | FLOAT);
reconExpr: RECONNAISSANCE ASSIGN (INT | FLOAT);
armyProfessionalismExpr:
	ARMY_PROFESSIONALISM ASSIGN (INT | FLOAT);
siegeExpr: SIEGE ASSIGN (INT | FLOAT);
maximumSpeedExpr: MAXIMUM_SPEED ASSIGN (INT | FLOAT);
supportExpr: SUPPORT ASSIGN (INT | FLOAT);
hullExpr: HULL ASSIGN INT;
gunPowerExpr: GUN_POWER ASSIGN INT;
torpedoAttackExpr: TORPEDO_ATTACK ASSIGN INT;

mobilizationSizeExpr: MOBILIZATION_SIZE ASSIGN (INT | FLOAT);
gasAttackExpr: GAS_ATTACK ASSIGN affirmative;
gasDefenseExpr: GAS_DEFENSE ASSIGN affirmative;
moraleExpr: MORALE ASSIGN (INT | FLOAT);
mobilizationEconImpactExpr:
	MOBILIZATION_ECONOMY_IMPACT ASSIGN (INT | FLOAT);

commerceEffect:
	taxEffExpr
	| administrativeEfficiencyExpr
	| factoryInputExpr
	| factoryOutputExpr
	| loanInterestExpr;
taxEffExpr: TAX_EFF ASSIGN (INT | FLOAT);
administrativeEfficiencyExpr:
	ADMINISTRATIVE_EFFICIENCY ASSIGN (INT | FLOAT); // should never be an int but can happen.
factoryInputExpr: FACTORY_INPUT ASSIGN (INT | FLOAT);
factoryOutputExpr: FACTORY_OUTPUT ASSIGN (INT | FLOAT);
loanInterestExpr: LOAN_INTEREST ASSIGN (INT | FLOAT);

industryEffect:
	factoryThroughputExpr
	| factoryCostExpr
	| rgoOutputExpr
	| factoryGoodsOutputBlock
	| factoryGoodsThroughputBlock
	| maxRailroadExpr
	| supplyLimitExpr
	| rgoGoodsOutputBlock
	| rgoSizeBlock
	| landAttritionExpr
	| popGrowthExpr;
factoryThroughputExpr: FACTORY_THROUGHPUT ASSIGN (INT | FLOAT);
factoryCostExpr: FACTORY_COST ASSIGN (INT | FLOAT);
rgoOutputExpr: RGO_OUTPUT ASSIGN (INT | FLOAT);
factoryGoodsOutputBlock:
	FACTORY_GOODS_OUTPUT ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
factoryGoodsThroughputBlock:
	FACTORY_GOODS_THROUGHPUT ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
rgoGoodsOutputBlock:
	RGO_GOODS_OUTPUT ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
rgoSizeBlock: RGO_SIZE ASSIGN L_BRACE rgoGoodExpr* R_BRACE;
rgoGoodExpr: IDENTIFIER ASSIGN (INT | FLOAT);
maxRailroadExpr: MAX_RAILROAD ASSIGN (INT | FLOAT);
supplyLimitExpr: SUPPLY_LIMIT ASSIGN (INT | FLOAT);
landAttritionExpr: LAND_ATTRITION ASSIGN (INT | FLOAT);
popGrowthExpr: POP_GROWTH ASSIGN (INT | FLOAT);

cultureEffect:
	permanentPrestigeExpr
	| sharedPrestigeExpr
	| colonaialPrestigeExpr
	| increaseResearchExpr
	| colonialMigrationExpr
	| educationEfficiencyExpr
	| maxNationalFocusExpr
	| cbCreationSpeed
	| diplomaticPointsExpr
	| regularExperienceLevelExpr
	| reinforceRateExpr
	| warExhaustionExpr
	| pluralityExpr
	| suppressionPointsModifierExpr
	| separatismExpr
	| rebelOrgGainBlock
	| enableCrimeExpr
	| soldierToPopLossExpr;
permanentPrestigeExpr: PERMANENT_PRESTIGE ASSIGN (INT | FLOAT);
sharedPrestigeExpr: SHARED_PRESTIGE ASSIGN (INT | FLOAT);
colonaialPrestigeExpr: COLONIAL_PRESTIGE ASSIGN (INT | FLOAT);
increaseResearchExpr: INCREASE_RESEARCH ASSIGN (INT | FLOAT);
colonialMigrationExpr: COLONIAL_MIGRATION ASSIGN (INT | FLOAT);
educationEfficiencyExpr:
	EDUCATION_EFFICIENCY ASSIGN (INT | FLOAT);
maxNationalFocusExpr: MAX_NATIONAL_FOCUS ASSIGN INT;
cbCreationSpeed: CB_CREATION_SPEED ASSIGN (INT | FLOAT);
diplomaticPointsExpr: DIPLOMATIC_POINTS ASSIGN (INT | FLOAT);
regularExperienceLevelExpr: REGULAR_EXPERIENCE_LEVEL ASSIGN INT;
reinforceRateExpr: REINFORCE_RATE ASSIGN (INT | FLOAT);
warExhaustionExpr: WAR_EXHAUSTION ASSIGN (INT | FLOAT);
pluralityExpr: PLURALITY ASSIGN (INT | FLOAT);
suppressionPointsModifierExpr:
	SUPPRESSION_POINTS_MODIFIER ASSIGN (INT | FLOAT);
separatismExpr: SEPARATISM ASSIGN (INT | FLOAT);
rebelOrgGainBlock:
	REBEL_ORG_GAIN ASSIGN L_BRACE (factionExpr | valueExpr)* R_BRACE;
factionExpr: FACTION ASSIGN IDENTIFIER;
enableCrimeExpr: ENABLE_CRIME ASSIGN IDENTIFIER;
soldierToPopLossExpr: SOLDIER_TO_POP_LOSS ASSIGN (INT | FLOAT);

navalEffect:
	navyBaseBlock
	| colonialPointsExpr
	| maxNavalBaseExpr
	| colonialPrestigeExpr
	| supplyRangeExpr
	| navalAttritionExpr;
navyBaseBlock: NAVY_BASE ASSIGN L_BRACE navyBaseEffect* R_BRACE;
navyBaseEffect:
	maximumSpeedExpr
	| buildTimeExpr
	| defaultOrganizationExpr
	| hullExpr
	| gunPowerExpr;
buildTimeExpr: BUILD_TIME ASSIGN (INT | FLOAT);

colonialPointsExpr: COLONIAL_POINTS ASSIGN INT;
maxNavalBaseExpr: MAX_NAVAL_BASE ASSIGN INT;
colonialPrestigeExpr: COLONIAL_PRESTIGE ASSIGN (INT | FLOAT);
supplyRangeExpr: SUPPLY_RANGE ASSIGN (INT | FLOAT);
navalAttritionExpr: NAVAL_ATTRITION ASSIGN (INT | FLOAT);

activateUnitExpr: ACTIVATE_UNIT ASSIGN IDENTIFIER;
activateBuildingExpr: ACTIVATE_BUILDING ASSIGN IDENTIFIER;
colonialLifeRatingExpr:
	COLONIAL_LIFE_RATING ASSIGN INT; // should be negative
corePopConsciousnessModifierExpr:
	CORE_POP_CONSCIOUSNESS_MODIFIER ASSIGN (INT | FLOAT);
corePopMilitancyModifierExpr:
	CORE_POP_MILITANCY_MODIFIER ASSIGN (INT | FLOAT);

modifierBlock:
	MODIFIER ASSIGN L_BRACE (factorExpr | inventionCondition)* R_BRACE;
factorExpr: FACTOR ASSIGN (INT | FLOAT);
inventionCondition:
	condition
	| armyProfessionalismExpr
	| warCountriesExpr
	| pluralityExpr;
warCountriesExpr:
	WAR_COUNTRIES ASSIGN L_BRACE condition* R_BRACE;
orgRegainExpr: ORG_REGAIN ASSIGN (INT | FLOAT);
politicalReformDesireExpr:
	POLITICAL_REFORM_DESIRE ASSIGN (INT | FLOAT);
socialReformDesireExpr:
	SOCIAL_REFORM_DESIRE ASSIGN (INT | FLOAT);

// this file allows you to use 'not' or 'NOT'. I don't like the inconsistency.
NOT: 'NOT' | 'not';

CHANCE: 'chance';
LIMIT: 'limit';
BASE: 'base';
NEWS: 'news';
EFFECT: 'effect';
MODIFIER: 'modifier';
FACTOR: 'factor';
WAR_COUNTRIES: 'war_countries';
CORE_POP_CONSCIOUSNESS_MODIFIER:
	'core_pop_consciousness_modifier';
CORE_POP_MILITANCY_MODIFIER: 'core_pop_militancy_modifier';
ORG_REGAIN: 'org_regain';
POLITICAL_REFORM_DESIRE: 'political_reform_desire';
SOCIAL_REFORM_DESIRE: 'social_reform_desire';

ARMY_BASE: 'army_base';
ATTACK: 'attack';
DEFENSE: 'defence';
RECONNAISSANCE: 'reconnaissance';
ARMY_PROFESSIONALISM: 'army_professionalism';
SIEGE: 'siege';
MOBILIZATION_SIZE: 'mobilisation_size';
SUPPLY_CONSUMPTION: 'supply_consumption';
MAXIMUM_SPEED: 'maximum_speed';
SUPPORT: 'support';
HULL: 'hull';
GUN_POWER: 'gun_power';
TORPEDO_ATTACK: 'torpedo_attack';
DEFAULT_ORGANIZATION: 'default_organisation';
GAS_ATTACK: 'gas_attack';
GAS_DEFENSE: 'gas_defence';
MORALE: 'morale';
MOBILIZATION_ECONOMY_IMPACT: 'mobilisation_economy_impact';

TAX_EFF: 'tax_eff';
ADMINISTRATIVE_EFFICIENCY: 'administrative_efficiency';
FACTORY_INPUT: 'factory_input';
FACTORY_OUTPUT: 'factory_output';
LOAN_INTEREST: 'loan_interest';
RGO_GOODS_OUTPUT: 'rgo_goods_output';
RGO_SIZE: 'rgo_size';
INFLUENCE: 'influence';
FARM_RGO_EFF: 'farm_rgo_eff';

FACTORY_THROUGHPUT: 'factory_throughput';
FACTORY_COST: 'factory_cost';
RGO_OUTPUT: 'rgo_output';
FACTORY_GOODS_OUTPUT: 'factory_goods_output';
FACTORY_GOODS_THROUGHPUT: 'factory_goods_throughput';
MAX_RAILROAD: 'max_railroad';
SUPPLY_LIMIT: 'supply_limit';
LAND_ATTRITION: 'land_attrition';
POP_GROWTH: 'pop_growth';

PERMANENT_PRESTIGE: 'permanent_prestige';
SHARED_PRESTIGE: 'shared_prestige';
COLONIAL_PRESTIGE: 'colonial_prestige';
INCREASE_RESEARCH: 'increase_research';
COLONIAL_MIGRATION: 'colonial_migration';
EDUCATION_EFFICIENCY: 'education_efficiency';
MAX_NATIONAL_FOCUS: 'max_national_focus';
CB_CREATION_SPEED: 'cb_creation_speed';
DIPLOMATIC_POINTS: 'diplomatic_points';
REGULAR_EXPERIENCE_LEVEL: 'regular_experience_level';
REINFORCE_RATE: 'reinforce_rate';
WAR_EXHAUSTION: 'war_exhaustion';
PLURALITY: 'plurality';
SUPPRESSION_POINTS_MODIFIER: 'suppression_points_modifier';
SEPARATISM:
	'seperatism'; // spelled as such to not conflict with technology relations.
REBEL_ORG_GAIN: 'rebel_org_gain';
FACTION: 'faction';
ENABLE_CRIME: 'enable_crime';
SOLDIER_TO_POP_LOSS: 'soldier_to_pop_loss';

NAVY_BASE: 'navy_base';
COLONIAL_POINTS: 'colonial_points';
MAX_NAVAL_BASE: 'max_naval_base';
BUILD_TIME: 'build_time';
SUPPLY_RANGE: 'supply_range';
NAVAL_ATTRITION: 'naval_attrition';

ACTIVATE_UNIT: 'activate_unit';
ACTIVATE_BUILDING: 'activate_building';
COLONIAL_LIFE_RATING: 'colonial_life_rating';
