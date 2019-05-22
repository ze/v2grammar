grammar ModApi;

import Effects;

/*
 * Handles every file in `events` and `decisions`.
 */

decisions:
	POLITICAL_DECISIONS ASSIGN L_BRACE decision* R_BRACE EOF;

decision: IDENTIFIER ASSIGN L_BRACE decisionData* R_BRACE;

decisionData:
	pictureDecisionExpr
	| potentialBlock
	| alertExpr
	| allowBlock
	| effectBlock
	| aiWillDoBlock;

pictureDecisionExpr: PICTURE ASSIGN IDENTIFIER;
potentialBlock: POTENTIAL ASSIGN L_BRACE condition* R_BRACE;
alertExpr: ALERT ASSIGN affirmative;
allowBlock: ALLOW ASSIGN L_BRACE condition* R_BRACE;
effectBlock: EFFECT ASSIGN L_BRACE effect* R_BRACE;
aiWillDoBlock:
	AI_WILL_DO ASSIGN L_BRACE (factorExpr | modifierBlock)* R_BRACE;

POLITICAL_DECISIONS: 'political_decisions';
PICTURE: 'picture';
POTENTIAL: 'potential';
ALERT: 'alert';
ALLOW: 'allow';
EFFECT: 'effect';
AI_WILL_DO: 'ai_will_do';

events: (countryEvent | provinceEvent)* EOF;

countryEvent: COUNTRY_EVENT ASSIGN L_BRACE eventData* R_BRACE;
provinceEvent: PROVINCE_EVENT ASSIGN L_BRACE eventData* R_BRACE;

eventData:
	idExpr
	| titleExpr
	| descExpr
	| newsExpr
	| newsTitleExpr
	| shortNewsDescExpr
	| mediumNewsDescExpr
	| longNewsDescExpr
	| pictureEventExpr
	| isTriggeredOnlyExpr
	| majorExpr
	| fireOnlyOnceExpr
	| allowMultipleInstancesExpr
	| triggerBlock
	| mtthBlock
	| optionBlock
	| immediateBlock;

idExpr: ID ASSIGN INT;
titleExpr: TITLE ASSIGN STRING;
descExpr: DESC ASSIGN STRING;

newsExpr: NEWS ASSIGN affirmative;
newsTitleExpr: NEWS_TITLE ASSIGN STRING;
shortNewsDescExpr: NEWS_DESC_SHORT ASSIGN STRING;
mediumNewsDescExpr: NEWS_DESC_MEDIUM ASSIGN STRING;
longNewsDescExpr: NEWS_DESC_LONG ASSIGN STRING;

pictureEventExpr: PICTURE ASSIGN STRING;
isTriggeredOnlyExpr: IS_TRIGGERED_ONLY ASSIGN affirmative;
majorExpr: MAJOR ASSIGN affirmative;
fireOnlyOnceExpr: FIRE_ONLY_ONCE ASSIGN affirmative;
allowMultipleInstancesExpr:
	ALLOW_MULTIPLE_INSTANCES ASSIGN affirmative;

triggerBlock: TRIGGER ASSIGN L_BRACE condition* R_BRACE;

mtthBlock:
	MTTH ASSIGN L_BRACE (modifierBlock | meanTimeExpr)* R_BRACE;

meanTimeExpr: yearsExpr | monthsExpr | daysExpr;
yearsExpr: 'years' ASSIGN INT;
daysExpr: 'days' ASSIGN INT;

modifierBlock:
	MODIFIER ASSIGN L_BRACE (factorExpr | condition)* R_BRACE;

optionBlock:
	OPTION ASSIGN L_BRACE (effect | optionName | aiChanceBlock)* R_BRACE;

optionName: NAME ASSIGN STRING;

immediateBlock: IMMEDIATE ASSIGN L_BRACE effect* R_BRACE;

aiChanceBlock:
	AI_CHANCE ASSIGN L_BRACE (factorExpr | modifierBlock)* R_BRACE;

// event modifiers
ID: 'id';
TITLE: 'title';
DESC: 'desc';

NEWS: 'news';
NEWS_TITLE: 'news_title';
NEWS_DESC_SHORT: 'news_desc_short';
NEWS_DESC_MEDIUM: 'news_desc_medium';
NEWS_DESC_LONG: 'news_desc_long';

TRIGGER: 'trigger';
MTTH: 'mean_time_to_happen';
OPTION: 'option';
NAME: 'name';
AI_CHANCE: 'ai_chance';

ALLOW_MULTIPLE_INSTANCES: 'allow_multiple_instances';
FIRE_ONLY_ONCE: 'fire_only_once';
IS_TRIGGERED_ONLY: 'is_triggered_only';
MAJOR: 'major';
