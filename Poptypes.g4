grammar Poptypes;

/*
 * Handles all files in `poptypes`.
 */

import Conditions;

popType: popData* EOF;
popData:
	spriteExpr
	| colorExpr
	| strataExpr
	| stateCapitalExpr
	| demoteMigrantExpr
	| adminEfficiencyExpr
	| taxEffExpr;

spriteExpr: SPRITE ASSIGN INT;
colorExpr: COLOR ASSIGN L_BRACE INT INT INT R_BRACE;
strataExpr: STRATA ASSIGN IDENTIFIER;
stateCapitalExpr: STATE_CAPITAL_ONLY ASSIGN affirmative;
demoteMigrantExpr: DEMOTE_MIGRANT ASSIGN affirmative;
adminEfficiencyExpr:
	ADMINISTRATIVE_EFFICIENCY ASSIGN affirmative;
taxEffExpr: TAX_EFF ASSIGN (INT | FLOAT);

SPRITE: 'sprite';
COLOR: 'color';
STATE_CAPITAL_ONLY: 'state_capital_only';
DEMOTE_MIGRANT: 'demote_migrant';
ADMINISTRATIVE_EFFICIENCY: 'administrative_efficiency';
TAX_EFF: 'tax_eff';
