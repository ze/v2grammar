grammar Effects;

import Conditions;

effect:
	countryEffect
	| countryScopeEffect
	| provinceEffect
	| provinceScopeEffect
	| stateEffect
	| stateScopeEffect
	| popEffect
	| globalEffect;

countryScopeEffect:
	allCoreEffect
	| anyCountryEffect
	| anyGreaterPowerEffect
	| anyOwnedEffect
	| anyPopEffect
	| anyNeighborCountryEffect
	| anyStateEffect
	| capitalScopeEffect
	| countryTagEffect
	| culturalUnionEffect
	| fromEffect
	| overlordEffect
	| randomCountryEffect
	| randomStateEffect
	| randomOwnedEffect
	| randomPopEffect
	//    | regionEffect // DYNAMIC ISSUE
	| sphereOwnerEffect;

allCoreEffect:
	ALL_CORE ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

anyCountryEffect:
	ANY_COUNTRY ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

anyGreaterPowerEffect:
	ANY_GREATER_POWER ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

anyOwnedEffect:
	ANY_OWNED ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

anyNeighborCountryEffect:
	ANY_NEIGHBOR_COUNTRY ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

anyStateEffect:
	ANY_STATE ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

capitalScopeEffect:
	CAPITAL_SCOPE ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

countryTagEffect: (THIS | FROM | COUNTRY_TAG) ASSIGN L_BRACE (
		effect
		| limitBlock
	)* R_BRACE;

culturalUnionEffect:
	CULTURAL_UNION ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

fromEffect:
	LOWER_FROM ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

overlordEffect:
	OVERLORD ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

randomCountryEffect:
	RANDOM_COUNTRY ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

randomStateEffect:
	RANDOM_STATE ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

randomOwnedEffect:
	RANDOM_OWNED ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

randomPopEffect:
	RANDOM_POP ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

sphereOwnerEffect:
	SPHERE_OWNER ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

provinceScopeEffect:
	anyNeighborProvinceEffect
	| anyPopEffect
	| provinceCountryEffect
	| culturalUnionEffect
	| ownerEffect
	| provinceIDEffect
	| randomNeighborProvinceEffect
	| randomEmptyNeighborProvinceEffect;

anyNeighborProvinceEffect:
	ANY_NEIGHBOR_PROVINCE ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

provinceCountryEffect:
	COUNTRY ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

ownerEffect:
	OWNER ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

provinceIDEffect:
	INT ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

randomNeighborProvinceEffect:
	RANDOM_NEIGHBOR_PROVINCE ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

randomEmptyNeighborProvinceEffect:
	RANDOM_EMPTY_NEIGHBOR_PROVINCE ASSIGN L_BRACE (
		effect
		| limitBlock
	)* R_BRACE;

globalEffect:
	enableIdeologyAction
	| addCrisisTemperatureAction
	| killLeaderAction
	| defineGeneralAction
	| removeCountryModifierAction
	| clrGlobalFlagAction
	| setGlobalFlagAction;

popEffect:
	assimilateAction
	| consciousnessAction
	| dominantIssueAction
	| ideologyAction
	| literacyAction
	| militancyAction
	| moneyAction
	| moveIssuePercentageAction
	| movePopAction
	| popTypeAction
	| reducePopAction
	| scaledConsciousnessAction
	| scaledMilitancyAction;

assimilateAction: ASSIMILATE ASSIGN affirmative;
consciousnessAction: CONSCIOUSNESS ASSIGN (INT | FLOAT);
dominantIssueAction:
	DOMINANT_ISSUE ASSIGN L_BRACE (factorExpr | valueExpr)* R_BRACE;
ideologyAction: IDEOLOGY ASSIGN ideologyBlock;
literacyAction: LITERACY ASSIGN (INT | FLOAT);
militancyAction: MILITANCY ASSIGN (INT | FLOAT);
moneyAction: MONEY ASSIGN INT;
moveIssuePercentageAction:
	MOVE_ISSUE_PERCENTAGE ASSIGN L_BRACE (
		fromExpr
		| toExpr
		| valueExpr
	)* R_BRACE;
movePopAction: MOVE_POP ASSIGN INT;
popTypeAction: POP_TYPE ASSIGN IDENTIFIER;
reducePopAction: REDUCE_POP ASSIGN (INT | FLOAT);
scaledConsciousnessAction: SCALED_CONSCIOUSNESS issueBlock;
scaledMilitancyAction: SCALED_MILITANCY issueBlock;

ideologyBlock: L_BRACE (factorExpr | valueExpr)* R_BRACE;
issueBlock:
	ASSIGN L_BRACE (
		factorExpr
		| ideologyExpr
		| valueExpr
		| issueExpr
	)* R_BRACE;
ideologyExpr: IDEOLOGY ASSIGN IDENTIFIER;
issueExpr: ISSUE ASSIGN IDENTIFIER;

fromExpr: LOWER_FROM ASSIGN IDENTIFIER;
toExpr: LOWER_TO ASSIGN IDENTIFIER;

provinceEffect:
	addCoreAction
	| addProvinceModifierAction
	| changeControllerAction
	| changeProvinceNameAction
	| fortAction
	| infrastructureAction
	| lifeRatingAction
	| navalBaseAction
	| removeCoreAction
	| removeProvinceModifierAction
	| rgoSizeAction
	| secedeProvinceAction
	| tradeGoodsAction
	| clrProvinceFlagAction
	| provinceEventAction
	| setProvinceFlagAction;

addCoreAction: ADD_CORE ASSIGN (THIS | FROM | COUNTRY_TAG);
addProvinceModifierAction:
	ADD_PROVINCE_MODIFIER ASSIGN eventModifierBlock;
changeControllerAction: CHANGE_CONTROLLER ASSIGN COUNTRY_TAG;
changeProvinceNameAction: CHANGE_PROVINCE_NAME ASSIGN STRING;
changeRegionNameAction: CHANGE_REGION_NAME ASSIGN STRING;
flashpointTensionAction:
	FLASHPOINT_TENSION ASSIGN (INT | FLOAT);
fortAction: FORT ASSIGN INT;
infrastructureAction: INFRASTRUCTURE ASSIGN INT;
lifeRatingAction: LIFE_RATING ASSIGN INT;
navalBaseAction: NAVAL_BASE ASSIGN INT;
removeCoreAction: REMOVE_CORE ASSIGN (COUNTRY_TAG | THIS | INT);
removeProvinceModifierAction:
	REMOVE_PROVINCE_MODIFIER ASSIGN IDENTIFIER;
rgoSizeAction: RGO_SIZE ASSIGN INT;
secedeProvinceAction:
	SECEDE_PROVINCE ASSIGN (THIS | FROM | COUNTRY_TAG);
tradeGoodsAction: TRADE_GOODS ASSIGN IDENTIFIER;

eventModifierBlock: L_BRACE (nameExpr | durationExpr)* R_BRACE;
nameExpr: 'name' ASSIGN (IDENTIFIER | STRING);
durationExpr: 'duration' ASSIGN INT;

countryEffect:
	activateTechnologyAction
	| addAcceptedCultureAction
	| removeAcceptedCultureAction
	| addCountryModifierAction
	| addCrisisInterestAction
	| badboyAction
	| capitalAction
	| civilizedAction
	| leadershipAction
	| nationalvalueAction
	| pluralityAction
	| prestigeAction
	| prestigeFactorAction
	| primaryCultureAction
	| religionAction
	| researchPointsAction
	| techSchoolAction
	| warExhaustionAction
	| yearsOfResearchAction
	| nationalizeAction
	// specific effects. I don't get why the wiki places these effects into their own section.
	| diplomaticEffect
	| economicEffect
	// these are most of the political effects. I just decided to not make it a parser rule since it's lame.
	| electionAction
	| governmentAction
	| politicalReformAction
	| rulingPartyIdeologyAction
	| politicalReformAction
	| upperHouseAction
	// the function effects are also split sadly.
	| changeTagAction
	| changeTagNoCoreSwitchAction
	| changeVariableAction
	| clrCountryFlagAction
	| countryEventAction
	// so far all uses I've seen of this are within the country scope. makes sense to me.
	| randomAction
	| randomListAction
	| setCountryFlagAction
	| setVariableAction;

anyPopEffect:
	ANY_POP ASSIGN L_BRACE (effect | limitBlock)* R_BRACE;

activateTechnologyAction: ACTIVATE_TECHNOLOGY ASSIGN IDENTIFIER;
addAcceptedCultureAction:
	ADD_ACCEPTED_CULTURE ASSIGN IDENTIFIER;
removeAcceptedCultureAction:
	REMOVE_ACCEPTED_CULTURE ASSIGN IDENTIFIER;
addCountryModifierAction:
	ADD_COUNTRY_MODIFIER ASSIGN eventModifierBlock;
addCrisisInterestAction: ADD_CRISIS_INTEREST ASSIGN affirmative;
addCrisisTemperatureAction:
	ADD_CRISIS_TEMPERATURE ASSIGN (INT | FLOAT);
badboyAction: BADBOY ASSIGN (INT | FLOAT);
capitalAction: CAPITAL ASSIGN INT;
civilizedAction: CIVILIZED ASSIGN affirmative;
killLeaderAction: KILL_LEADER ASSIGN INT;
defineGeneralAction:
	DEFINE_GENERAL ASSIGN generalDefinitionBlock;
leadershipAction: LEADERSHIP ASSIGN INT;
nationalvalueAction: NATIONALVALUE ASSIGN IDENTIFIER;
pluralityAction: PLURALITY ASSIGN (INT | FLOAT);
prestigeAction: PRESTIGE ASSIGN (INT | FLOAT);
prestigeFactorAction: PRESTIGE_FACTOR ASSIGN (INT | FLOAT);
primaryCultureAction:
	PRIMARY_CULTURE ASSIGN (
		THIS
		| FROM
		| COUNTRY_TAG
		| IDENTIFIER
	);
religionAction: RELIGION ASSIGN IDENTIFIER;
removeCountryModifierAction:
	REMOVE_COUNTRY_MODIFIER ASSIGN IDENTIFIER;
researchPointsAction: RESEARCH_POINTS ASSIGN (INT | FLOAT);
techSchoolAction: TECH_SCHOOL ASSIGN IDENTIFIER;
warExhaustionAction: WAR_EXHAUSTION ASSIGN (INT | FLOAT);
yearsOfResearchAction: YEARS_OF_RESEARCH ASSIGN (INT | FLOAT);
nationalizeAction: NATIONALIZE ASSIGN affirmative;

generalDefinitionBlock:
	L_BRACE (nameExpr | personalityExpr | backgroundExpr)* R_BRACE;
personalityExpr: 'personality' ASSIGN IDENTIFIER;
backgroundExpr: 'background' ASSIGN IDENTIFIER;

stateScopeEffect: STATE_SCOPE ASSIGN L_BRACE effect* R_BRACE;

stateEffect:
	isSlaveAction
	| changeRegionNameAction
	| flashpointTensionAction;

electionAction: ELECTION ASSIGN YES;
enableIdeologyAction: ENABLE_IDEOLOGY ASSIGN IDENTIFIER;
governmentAction: GOVERNMENT ASSIGN IDENTIFIER;
isSlaveAction: IS_SLAVE ASSIGN affirmative;
rulingPartyIdeologyAction:
	RULING_PARTY_IDEOLOGY ASSIGN IDENTIFIER;
politicalReformAction: IDENTIFIER ASSIGN IDENTIFIER;
upperHouseAction: UPPER_HOUSE ASSIGN ideologyBlock;

diplomaticEffect:
	addCasusBelliAction
	| annexToAction
	| casusBelliAction
	| createAllianceAction
	| createVassalAction
	| diplomaticInfluenceAction
	| endMilitaryAccessAction
	| endWarAction
	| inheritAction
	| leaveAllianceAction
	| militaryAccessAction
	| neutralityAction
	| relationExpr // used in conditions
	| releaseAction
	| releaseVassalAction
	| warAction;

addCasusBelliAction: ADD_CASUS_BELLI ASSIGN warGoalBlock;
annexToAction: ANNEX_TO ASSIGN (THIS | FROM | COUNTRY_TAG);
casusBelliAction: CASUS_BELLI ASSIGN warGoalBlock;
createAllianceAction: CREATE_ALLIANCE ASSIGN COUNTRY_TAG;
createVassalAction: CREATE_VASSAL ASSIGN COUNTRY_TAG;
diplomaticInfluenceAction:
	DIPLOMATIC_INFLUENCE ASSIGN whoValueBlock;
endMilitaryAccessAction:
	END_MILITARY_ACCESS ASSIGN (THIS | FROM | COUNTRY_TAG);
endWarAction: END_WAR ASSIGN (THIS | FROM | COUNTRY_TAG);
inheritAction: INHERIT ASSIGN (THIS | FROM | COUNTRY_TAG);
leaveAllianceAction:
	LEAVE_ALLIANCE ASSIGN (THIS | FROM | COUNTRY_TAG);
militaryAccessAction:
	MILITARY_ACCESS ASSIGN (THIS | FROM | COUNTRY_TAG);
neutralityAction: NEUTRALITY ASSIGN affirmative;
releaseAction: RELEASE ASSIGN (THIS | FROM | COUNTRY_TAG);
releaseVassalAction:
	RELEASE_VASSAL ASSIGN (THIS | FROM | COUNTRY_TAG);
warAction: WAR ASSIGN warBlock;

warGoalBlock:
	L_BRACE (targetExpr | typeExpr | monthsExpr)* R_BRACE;
targetExpr: 'target' ASSIGN (THIS | FROM | COUNTRY_TAG);
typeExpr: 'type' ASSIGN IDENTIFIER;
monthsExpr: 'months' ASSIGN INT;

warBlock:
	L_BRACE (
		targetExpr
		| attackerGoalBlock
		| defenderGoalBlock
		| callAllyExpr
	)* R_BRACE;
attackerGoalBlock:
	'attacker_goal' ASSIGN L_BRACE (
		casusBelliExpr
		| stateProvinceIDExpr
	)* R_BRACE;
stateProvinceIDExpr: 'state_province_id' ASSIGN INT;

defenderGoalBlock:
	'defender_goal' ASSIGN L_BRACE casusBelliExpr R_BRACE;
casusBelliExpr: CASUS_BELLI ASSIGN IDENTIFIER;
callAllyExpr: 'call_ally' ASSIGN affirmative;

economicEffect:
	addTaxRelativeIncomeAction
	//    | resourceAction // DYNAMIC action
	| treasuryAction;

addTaxRelativeIncomeAction:
	ADD_TAX_RELATIVE_INCOME ASSIGN (INT | FLOAT);
//resourceAction: IDENTIFIER ASSIGN (INT | FLOAT); // DYNAMIC ISSUE
treasuryAction: TREASURY ASSIGN (INT | FLOAT);

changeTagAction: CHANGE_TAG ASSIGN COUNTRY_TAG;
changeTagNoCoreSwitchAction:
	CHANGE_TAG_NO_CORE_SWITCH ASSIGN COUNTRY_TAG;
changeVariableAction: CHANGE_VARIABLE ASSIGN whichValueBlock;
clrProvinceFlagAction:
	CLR_PROVINCE_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
clrCountryFlagAction:
	CLR_COUNTRY_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
clrGlobalFlagAction:
	CLR_GLOBAL_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
countryEventAction: COUNTRY_EVENT ASSIGN INT;
provinceEventAction:
	PROVINCE_EVENT ASSIGN L_BRACE 'id' ASSIGN INT R_BRACE; // Why did PDX design it like so?
randomAction: RANDOM ASSIGN randomChanceBlock;
randomChanceBlock: L_BRACE (chanceExpr | effect)* R_BRACE;
chanceExpr: 'chance' ASSIGN INT;

randomListAction:
	RANDOM_LIST ASSIGN L_BRACE randomListItem* R_BRACE;
randomListItem: INT ASSIGN L_BRACE effect* R_BRACE;

setProvinceFlagAction:
	SET_PROVINCE_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
setCountryFlagAction:
	SET_COUNTRY_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
setGlobalFlagAction:
	SET_GLOBAL_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
setVariableAction: SET_VARIABLE ASSIGN whichValueBlock;

factorExpr: FACTOR ASSIGN (INT | FLOAT);
FACTOR: 'factor';

ASSIMILATE: 'assimilate';
DOMINANT_ISSUE: 'dominant_issue';
MOVE_ISSUE_PERCENTAGE: 'move_issue_percentage';
MOVE_POP: 'move_pop';
POP_TYPE: 'pop_type';
REDUCE_POP: 'reduce_pop';
SCALED_CONSCIOUSNESS: 'scaled_consciousness';
SCALED_MILITANCY: 'scaled_militancy';
ADD_CORE: 'add_core';
ADD_PROVINCE_MODIFIER: 'add_province_modifier';
CHANGE_CONTROLLER: 'change_controller';
CHANGE_PROVINCE_NAME: 'change_province_name';
CHANGE_REGION_NAME: 'change_region_name';
REMOVE_CORE: 'remove_core';
REMOVE_PROVINCE_MODIFIER: 'remove_province_modifier';
RGO_SIZE: 'RGO_size';
SECEDE_PROVINCE: 'secede_province';
ACTIVATE_TECHNOLOGY: 'activate_technology';
ADD_ACCEPTED_CULTURE: 'add_accepted_culture';
REMOVE_ACCEPTED_CULTURE: 'remove_accepted_culture';
ADD_COUNTRY_MODIFIER: 'add_country_modifier';
ADD_CRISIS_INTEREST: 'add_crisis_interest';
ADD_CRISIS_TEMPERATURE: 'add_crisis_temperature';
KILL_LEADER: 'kill_leader';
DEFINE_GENERAL: 'define_general';
PLURALITY: 'plurality';
PRESTIGE_FACTOR: 'prestige_factor';
REMOVE_COUNTRY_MODIFIER: 'remove_country_modifier';
RESEARCH_POINTS: 'research_points';
YEARS_OF_RESEARCH: 'years_of_research';
NATIONALIZE: 'nationalize';
ENABLE_IDEOLOGY: 'enable_ideology';
ADD_CASUS_BELLI: 'add_casus_belli';
ANNEX_TO: 'annex_to';
CREATE_ALLIANCE: 'create_alliance';
CREATE_VASSAL: 'create_vassal';
DIPLOMATIC_INFLUENCE: 'diplomatic_influence';
END_MILITARY_ACCESS: 'end_military_access';
END_WAR: 'end_war';
INHERIT: 'inherit';
LEAVE_ALLIANCE: 'leave_alliance';
RELEASE: 'release';
RELEASE_VASSAL: 'release_vassal';
ADD_TAX_RELATIVE_INCOME: 'add_tax_relative_income';
// [RESOURCE NAME]: '[resource name]'; // DYNAMIC ISSUE
LEADERSHIP: 'leadership';
TREASURY: 'treasury';
CHANGE_TAG: 'change_tag';
CHANGE_TAG_NO_CORE_SWITCH: 'change_tag_no_core_switch';
CHANGE_VARIABLE: 'change_variable';
CLR_PROVINCE_FLAG: 'clr_province_flag';
CLR_COUNTRY_FLAG: 'clr_country_flag';
CLR_GLOBAL_FLAG: 'clr_global_flag';
RANDOM: 'random';
RANDOM_LIST: 'random_list';
SET_PROVINCE_FLAG: 'set_province_flag';
SET_COUNTRY_FLAG: 'set_country_flag';
SET_GLOBAL_FLAG: 'set_global_flag';
SET_VARIABLE: 'set_variable';

COUNTRY_EVENT: 'country_event';
PROVINCE_EVENT: 'province_event';

// modifiers
MODIFIER: 'modifier';
CB_GENERATION_SPEED_MODIFIER: 'cb_generation_speed_modifier';
//CORE_POP_(TRAIT)_MODIFER: 'core_pop_(trait)_modifer';
DIPLOMATIC_POINTS_MODIFIER: 'diplomatic_points_modifier';
FACTORY_COST: 'factory_cost';
FACTORY_INPUT: 'factory_input';
FACTORY_OUTPUT: 'factory_output';
FACTORY_OWNER_COST: 'factory_owner_cost';
FACTORY_THROUGHPUT: 'factory_throughput';
GLOBAL_ASSIMILATION_RATE: 'global_assimilation_rate';
GLOBAL_IMMIGRANT_ATTRACT: 'global_immigrant_attract';
//GLOBAL_POP_(TRAIT)_MODIFIER: 'global_pop_(trait)_modifier';
GLOBAL_POPULATION_GROWTH: 'global_population_growth';
IMPORT_COST: 'import_cost';
INFLUENCE_MODIFIER: 'influence_modifier';
ISSUE_CHANGE_SPEED: 'issue_change_speed';
LAND_ORGANISATION: 'land_organisation';
LAND_UNIT_START_EXPERIENCE: 'land_unit_start_experience';
LEADERSHIP_MODIFIER: 'leadership_modifier';
LOAN_INTEREST: 'loan_interest';
MAX_LOAN_MODIFIER: 'max_loan_modifier';
MAX_MILITARY_SPENDING: 'max_military_spending';
MAX_SOCIAL_SPENDING: 'max_social_spending';
MAX_TARIFF: 'max_tariff';
MIN_MILITARY_SPENDING: 'min_military_spending';
MIN_SOCIAL_SPENDING: 'min_social_spending';
MIN_TARIFF: 'min_tariff';
MOBILIZATION_ECONOMY_IMPACT: 'mobilization_economy_impact';
MOBILIZATION_IMPACT: 'mobilization_impact';
MOBILISATION_SIZE: 'mobilisation_size';
NAVAL_ORGANISATION: 'naval_organisation';
NAVAL_UNIT_START_EXPERIENCE: 'naval_unit_start_experience';
//NON_ACCEPTED_POP_(TRAIT)_MODIFIER: 'non_accepted_pop_(trait)_modifier';
ORG_REGAIN: 'org_regain';
POLITICAL_REFORM_DESIRE: 'political_reform_desire';
RESEARCH_POINTS_MODIFIER: 'research_points_modifier';
RGO_OUTPUT: 'rgo_output';
RGO_THROUGHPUT: 'rgo_throughput';
RULING_PARTY_SUPPORT: 'ruling_party_support';
SOCIAL_REFORM_DESIRE: 'social_reform_desire';
SUPPRESSION_POINTS_MODIFIER: 'suppression_points_modifier';
SUPPLY_CONSUMPTION: 'supply_consumption';
//(STRATA)_VOTE: '(strata)_vote';
TAX_EFFICIENCY: 'tax_efficiency';
//(CATEGORY)_TECH_RESEARCH_BONUS: '(category)_tech_research_bonus';
UNIT_START_EXPERIENCE: 'unit_start_experience';
ASSIMILATION_RATE: 'assimilation_rate';
IMMIGRANT_ATTRACT: 'immigrant_attract';
IMMIGRANT_PUSH: 'immigrant_push';
LOCAL_ARTISAN_OUTPUT: 'local_artisan_output';
LOCAL_FACTORY_INPUT: 'local_factory_input';
LOCAL_FACTORY_OUTPUT: 'local_factory_output';
LOCAL_FACTORY_THROUGHPUT: 'local_factory_throughput';
LOCAL_REPAIR: 'local_repair';
LOCAL_RGO_OUTPUT: 'local_RGO_output';
LOCAL_RGO_THROUGHPUT: 'local_RGO_throughput';
LOCAL_RULING_PARTY_SUPPORT: 'local_ruling_party_support';
LOCAL_SHIP_BUILD: 'local_ship_build';
//POP_(TRAIT)_MODIFIER: 'pop_(trait)_modifier';
POPULATION_GROWTH: 'population_growth';
//(TYPE)_RGO_EFF: '(type)_rgo_eff'; (TYPE)_RGO_SIZE: '(type)_rgo_size';
GOODS_DEMAND: 'goods_demand';
//(STRATA)_INCOME_MODIFIER: '(strata)_income_modifier'; (STRATA)_(LEVEL)_NEEDS:
// '(strata)_(level)_needs';
TECH_SCHOOL: 'tech_school';
