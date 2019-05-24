grammar Technology;

/*
 * Read `common/technology.txt`. Not the same as the technologies folder.
 */

technology: (technologyFolders | technologySchools)* EOF;
technologyFolders:
	FOLDERS ASSIGN L_BRACE technologyBranch // army
	technologyBranch // navy
	technologyBranch // commerce
	technologyBranch // culture
	technologyBranch // industrial
	R_BRACE;

technologyBranch:
	IDENTIFIER ASSIGN L_BRACE IDENTIFIER // 1
	IDENTIFIER // 2
	IDENTIFIER // 3
	IDENTIFIER // 4
	IDENTIFIER // 5
	R_BRACE;

technologySchools:
	SCHOOLS ASSIGN L_BRACE technologySchool* R_BRACE;
technologySchool:
	IDENTIFIER ASSIGN L_BRACE researchModifier* R_BRACE;

researchModifier:
	armyResearchModifier
	| navyResearchModifier
	| commerceResearchModifier
	| cultureResearchModifier
	| industryResearchModifier
	| uncivEconomicModifier
	| uncivMilitaryModifier;

armyResearchModifier:
	ARMY_TECH_RESEARCH_BONUS ASSIGN (INT | FLOAT);
navyResearchModifier:
	NAVY_TECH_RESEARCH_BONUS ASSIGN (INT | FLOAT);
commerceResearchModifier:
	COMMERCE_TECH_RESEARCH_BONUS ASSIGN (INT | FLOAT);
cultureResearchModifier:
	CULTURE_TECH_RESEARCH_BONUS ASSIGN (INT | FLOAT);
industryResearchModifier:
	INDUSTRY_TECH_RESEARCH_BONUS ASSIGN (INT | FLOAT);
uncivEconomicModifier:
	UNCIV_ECONOMIC_MODIFIER ASSIGN (INT | FLOAT);
uncivMilitaryModifier:
	UNCIV_MILITARY_MODIFIER ASSIGN (INT | FLOAT);

ARMY_TECH_RESEARCH_BONUS: 'army_tech_research_bonus';
NAVY_TECH_RESEARCH_BONUS: 'navy_tech_research_bonus';
COMMERCE_TECH_RESEARCH_BONUS: 'commerce_tech_research_bonus';
CULTURE_TECH_RESEARCH_BONUS: 'culture_tech_research_bonus';
INDUSTRY_TECH_RESEARCH_BONUS: 'industry_tech_research_bonus';
UNCIV_ECONOMIC_MODIFIER: 'unciv_economic_modifier';
UNCIV_MILITARY_MODIFIER: 'unciv_military_modifier';

SCHOOLS: 'schools';
FOLDERS: 'folders';

IDENTIFIER: LETTERS (LETTERS | '0' .. '9')*;
fragment LETTERS: ('a' .. 'z' | 'A' .. 'Z' | '_');

FLOAT: INT? '.' DIGIT+;

INT: '-'? DIGIT+;
fragment DIGIT: ('0' .. '9');

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
