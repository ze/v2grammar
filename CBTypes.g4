grammar CBTypes;

import Effects;

cbTypes: (peaceOrderBlock | casusBelli)* EOF;
peaceOrderBlock: PEACE_ORDER ASSIGN L_BRACE IDENTIFIER* R_BRACE;

casusBelli: IDENTIFIER ASSIGN L_BRACE casusBelliExpr* R_BRACE;
casusBelliExpr:
	spriteIndexExpr
	| constructingCBExpr
	| isTriggeredOnlyExpr
	| mutualExpr
	| monthsExpr
	| prerequisitesExpr
	| badboyFactorExpr
	| prestigeFactorExpr
	| peaceCostFactorExpr
	| penaltyFactorExpr
	| breakTrucePrestigeFactor
	| breakTruceInfamyFactor
	| breakTruceMilitancyFactor
	| truceMonthsExpr
	| goodRelationPrestigeFactor
	| goodRelationInfamyFactor
	| goodRelationMilitancyFactor
	| poOptionExpr
	| allowedCountriesBlock
	| allowedStatesBlock
	| canUseBlock
	| onAddBlock
	| constructionSpeedExpr
	| greatWarObligatoryExpr
	| poRemoveCoresExpr
	| crisisExpr
	| warNameExpr
	| alwaysExpr
	| onPoAcceptedBlock
	| allAllowedStatesExpr
	| twsBattleFactorExpr // what is this?
	| allowedStatesInCrisisBlock
	| allowedSubstateRegionsBlock;
spriteIndexExpr: SPRITE_INDEX ASSIGN INT;
constructingCBExpr: CONSTRUCTING_CB ASSIGN affirmative;
isTriggeredOnlyExpr: IS_TRIGGERED_ONLY ASSIGN affirmative;
mutualExpr:
	MUTUAL ASSIGN affirmative; // I've never seen this used anywhere.
monthsExpr: MONTHS ASSIGN INT;
prerequisitesExpr:
	PREREQUISITES ASSIGN IDENTIFIER; // I've never seen any usage of this anywhere.
badboyFactorExpr: BADBOY_FACTOR ASSIGN (INT | FLOAT);
prestigeFactorExpr: PRESTIGE_FACTOR ASSIGN (INT | FLOAT);
peaceCostFactorExpr: PEACE_COST_FACTOR ASSIGN (INT | FLOAT);
penaltyFactorExpr: PENALTY_FACTOR ASSIGN (INT | FLOAT);
breakTrucePrestigeFactor:
	BREAK_TRUCE_PRESTIGE_FACTOR ASSIGN (INT | FLOAT);
breakTruceInfamyFactor:
	BREAK_TRUCE_INFAMY_FACTOR ASSIGN (INT | FLOAT);
breakTruceMilitancyFactor:
	BREAK_TRUCE_MILITANCY_FACTOR ASSIGN (INT | FLOAT);
truceMonthsExpr: TRUCE_MONTHS ASSIGN INT;
goodRelationPrestigeFactor:
	GOOD_RELATION_PRESTIGE_FACTOR ASSIGN (INT | FLOAT);
goodRelationInfamyFactor:
	GOOD_RELATION_INFAMY_FACTOR ASSIGN (INT | FLOAT);
goodRelationMilitancyFactor:
	GOOD_RELATION_MILITANCY_FACTOR ASSIGN (INT | FLOAT);
poOptionExpr: PO_OPTION ASSIGN affirmative;
allowedCountriesBlock:
	ALLOWED_COUNTRIES ASSIGN L_BRACE condition* R_BRACE;
allowedStatesBlock:
	ALLOWED_STATES ASSIGN L_BRACE condition* R_BRACE;
canUseBlock:
	CAN_USE ASSIGN L_BRACE (condition | alwaysExpr)* R_BRACE;
onAddBlock:
	ON_ADD ASSIGN L_BRACE (effect | addWarGoalBlock)* R_BRACE;
addWarGoalBlock:
	ADD_WAR_GOAL ASSIGN L_BRACE casusBelliWarGoalExpr R_BRACE;
casusBelliWarGoalExpr: CASUS_BELLI ASSIGN IDENTIFIER;
constructionSpeedExpr: CONSTRUCTION_SPEED ASSIGN (INT | FLOAT);
greatWarObligatoryExpr: GREAT_WAR_OBLIGATORY ASSIGN affirmative;
poRemoveCoresExpr: PO_REMOVE_CORES ASSIGN affirmative;
crisisExpr: CRISIS ASSIGN affirmative;
warNameExpr: WAR_NAME ASSIGN IDENTIFIER;
alwaysExpr: ALWAYS ASSIGN affirmative;
onPoAcceptedBlock:
	ON_PO_ACCEPTED ASSIGN L_BRACE effect* R_BRACE;
allAllowedStatesExpr: ALL_ALLOWED_STATES ASSIGN affirmative;
twsBattleFactorExpr: TWS_BATTLE_FACTOR ASSIGN (INT | FLOAT);
allowedStatesInCrisisBlock:
	ALLOWED_STATES_IN_CRISIS ASSIGN L_BRACE condition* R_BRACE;
allowedSubstateRegionsBlock:
	ALLOWED_SUBSTATE_REGIONS ASSIGN L_BRACE condition* R_BRACE;

PEACE_ORDER: 'peace_order';
SPRITE_INDEX: 'sprite_index';
CONSTRUCTING_CB: 'constructing_cb';
IS_TRIGGERED_ONLY: 'is_triggered_only';
MUTUAL: 'mutual';
MONTHS: 'months';
PREREQUISITES: 'prerequisites';
BADBOY_FACTOR: 'badboy_factor';
PRESTIGE_FACTOR: 'prestige_factor';
PEACE_COST_FACTOR: 'peace_cost_factor';
PENALTY_FACTOR: 'penalty_factor';
BREAK_TRUCE_PRESTIGE_FACTOR: 'break_truce_prestige_factor';
BREAK_TRUCE_INFAMY_FACTOR: 'break_truce_infamy_factor';
BREAK_TRUCE_MILITANCY_FACTOR: 'break_truce_militancy_factor';
TRUCE_MONTHS: 'truce_months';
GOOD_RELATION_PRESTIGE_FACTOR: 'good_relation_prestige_factor';
GOOD_RELATION_INFAMY_FACTOR: 'good_relation_infamy_factor';
GOOD_RELATION_MILITANCY_FACTOR:
	'good_relation_militancy_factor';
PO_OPTION:
	'po_' (
		'annex'
		| 'demand_state'
		| 'add_to_sphere'
		| 'disarmament'
		| 'reparations'
		| 'transfer_provinces'
		| 'remove_prestige'
		| 'make_puppet'
		| 'release_puppet'
		| 'install_communist_gov_type'
		| 'uninstall_communist_gov_type'
		| 'remove_core'
		| 'colony'
		| 'clear_union_sphere'
		| 'gunboat'
		| 'status_quo'
		| 'destroy_forts'
		| 'destroy_naval_bases'
	);
ALLOWED_STATES: 'allowed_states';
CAN_USE: 'can_use';
ON_ADD: 'on_add';
CONSTRUCTION_SPEED: 'construction_speed';
GREAT_WAR_OBLIGATORY: 'great_war_obligatory';
PO_REMOVE_CORES: 'po_remove_cores';
CRISIS: 'crisis';
ALWAYS: 'always';
WAR_NAME: 'war_name';
ON_PO_ACCEPTED: 'on_po_accepted';
ALLOWED_COUNTRIES: 'allowed_countries';
ALL_ALLOWED_STATES: 'all_allowed_states';
ALLOWED_STATES_IN_CRISIS: 'allowed_states_in_crisis';
ALLOWED_SUBSTATE_REGIONS: 'allowed_substate_regions';
TWS_BATTLE_FACTOR: 'tws_battle_factor';
ADD_WAR_GOAL: 'add_war_goal';
