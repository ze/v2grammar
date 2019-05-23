grammar Conditions;

limitBlock: LIMIT ASSIGN L_BRACE condition* R_BRACE;

condition:
	rel
	| booleanCondition
	| countryScopeCondition
	| provinceScopeCondition
	| popScopeCondition
	| stateScopeCondition;

rel:
	broadRel
	| countryRel // when used at the top level, use an implicit THIS.
	| stateRel
	| provinceRel
	| popRel
	| isCoreRel;

countryScopeCondition:
	allCoreCondition
	| anyCoreProvinceCondition
	| anyGreaterPowerCondition
	| anyNeighborCountryCondition
	| anyOwnedProvinceCondition
	| capitalScopeCondition
	| countryCondition
	| culturalUnionCondition
	| overlordCondition
	| regionCondition
	| sphereOwnerCondition
	| anySubstateCondition;

allCoreCondition:
	ALL_CORE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyCoreProvinceCondition:
	ANY_CORE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyGreaterPowerCondition:
	ANY_GREATER_POWER ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyNeighborCountryCondition:
	ANY_NEIGHBOR_COUNTRY ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyOwnedProvinceCondition:
	ANY_OWNED_PROVINCE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyPopCondition:
	ANY_POP ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

capitalScopeCondition:
	CAPITAL_SCOPE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

countryCondition: (THIS | FROM | COUNTRY_TAG) ASSIGN L_BRACE condition* R_BRACE;

culturalUnionCondition:
	CULTURAL_UNION ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

overlordCondition:
	OVERLORD ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

regionCondition: IDENTIFIER ASSIGN L_BRACE condition* R_BRACE;

sphereOwnerCondition:
	SPHERE_OWNER ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anySubstateCondition:
	ANY_SUBSTATE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

provinceScopeCondition:
	anyCoreCountryCondition
	| anyNeighborProvinceCondition
	| anyPopCondition
	| controllerCondition
	| ownerCondition
	| provinceIdCondition;

anyCoreCountryCondition:
	ANY_CORE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyNeighborProvinceCondition:
	ANY_NEIGHBOR_PROVINCE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

controllerCondition:
	CONTROLLER ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

ownerCondition:
	OWNER ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

provinceIdCondition: INT ASSIGN L_BRACE condition* R_BRACE;

stateScopeCondition:
	stateScopeBlockCondition
	| anyStateCondition;

stateScopeBlockCondition:
	STATE_SCOPE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

anyStateCondition:
	ANY_STATE ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

popScopeCondition:
	locationCondition
	| popCountryCondition
	| culturalUnionCondition
	| anyPopCondition;

locationCondition:
	LOCATION ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

// The wiki has this containing effects, but is held in the trigger section. What is this really?
popCountryCondition:
	COUNTRY ASSIGN L_BRACE (condition | limitBlock)* R_BRACE;

// broad conditions, rest not included are added in their respective files.
broadRel:
	yearExpr
	| monthExpr
	| checkVariableExpr
	| hasGlobalFlagExpr
	| isCanalEnabledExpr;

yearExpr: YEAR ASSIGN INT;
monthExpr: MONTH ASSIGN INT;
checkVariableExpr: CHECK_VARIABLE ASSIGN whichValueBlock;
hasGlobalFlagExpr:
	HAS_GLOBAL_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
isCanalEnabledExpr: IS_CANAL_ENABLED ASSIGN INT;

booleanCondition: andCondition | orCondition | notCondition;

andCondition: AND ASSIGN L_BRACE condition* R_BRACE;
orCondition: OR ASSIGN L_BRACE condition* R_BRACE;
notCondition: NOT ASSIGN L_BRACE condition* R_BRACE;

countryRel:
	administrationSpendingRel
	| aiRel
	| allianceWithRel
	| averageConsciousnessRel
	| averageMilitancyRel
	| badboyRel
	| bigProducerRel
	| blockadeRel
	| brigadesCompareRel
	| canNationalizeRel
	| canCreateVassalsRel
	| capitalRel
	| casusBelliRel
	| citizenshipPolicyRel
	| civilizationProgressRel
	| civilizedRel
	| colonialNationRel
	| constructingCbProgressRel
	| constructingCbTypeRel
	| controlsRel
	| crimeFightingRel
	| crisisExistRel
	| economicPolicyRel // economic reform is dynamic
	| educationSpendingRel
	| electionRel
	| existsRel
	| governmentRel
	| greatWarsEnabledRel
	| haveCoreInRel
	| hasCountryFlagRel
	| hasCountryModifierRel
	| hasCulturalSphereRel
	| hasLeaderRel
	| hasRecentlyLostWarRel
	| hasUnclaimedCoresRel
	| ideologyRel
	| ideologyValueRel
	| industrialScoreRel
	| inDefaultExpr // what does this do either?
	| inSphereRel
	| inventionRel
	| involvedInCrisisRel
	| isClaimCrisisRel
	| isCulturalUnionRel
	| isCultureGroupRel
	| isDisarmedRel
	| isGreaterPowerRel
	| isIdeologyEnabledRel
	| isIndependantRel
	| isLiberationCrisisRel
	| isMobilisedRel
	| isOurVassalRel
	| isPossibleVassalRel
	| isReleasableVassalRel
	| isSecondaryPowerRel
	| isSphereLeaderOfRel
	| isVassalRel
	| isSubstateRel
	| literacyRel
	| lostNationalRel
	| middleStrataEverydayNeedsRel
	| middleStrataLifeNeedsRel
	| middleStrataLuxuryNeedsRel
	| middleTaxRel
	| militaryAccessRel
	| militaryReformRel
	| militaryScoreRel
	| militarySpendingRel
	| moneyRel
	| nationalvalueRel
	| nationalProvincesOccupiedRel
	| neighbourRel
	| numOfAlliesRel
	| numOfCitiesRel
	| numOfPortsRel
	| numOfRevoltsRel
	| numberOfStatesRel
	| numOfSubstatesRel
	| numOfVassalsRel
	| numOfVassalsNoSubstatesRel
	| ownsRel
	| partOfSphereRel
	| partyOrPoptypeRel
	| politicalMovementStrengthRel
	| politicalReformRel
	| politicalReformWantRel
	| poorStrataEverydayNeedsRel
	| poorStrataLifeNeedsRel
	| poorStrataLuxuryNeedsRel
	| poorTaxRel
	| popMajorityCultureRel
	| popMajorityIdeologyRel
	| popMajorityReligionRel
	| popMilitancyRel
	| prestigeRel
	| primaryCultureRel
	| acceptedCultureRel
	| producesRel
	| rankRel
	| relationExpr // used in effects
	| religiousPolicyRel
	| revoltPercentageRel
	| richStrataEverydayNeedsRel
	| richStrataLifeNeedsRel
	| richStrataLuxuryNeedsRel
	| richTaxRel
	| rulingPartyRel
	| rulingPartyIdeologyRel
	| slaveryRel
	| socialMovementStrengthRel
	| socialReformWantRel
	| socialSpendingRel
	| strongerArmyThanRel
	| substateOfRel
	| tagRel
	| technologyRel
	| thisCultureUnionRel
	| totalAmountOfDivisionsRel
	| totalAmountOfShipsRel
	| totalDefensivesRel
	| totalNumOfPortsRel
	| totalOffensivesRel
	| totalOfOursSunkRel
	| totalPopsRel
	| totalSeaBattlesRel
	| totalSunkByUsRel
	| tradePolicyRel
	| truceWithRel
	| unemploymentRel
	| unitHasLeaderRel
	| unitInBattleRel
	| upperHouseRel
	| vassalOfRel
	| warRel
	| warExhaustionRel
	| warPolicyRel
	| warWithRel
	| techSchoolRel // only use so far is in technologies.g4
	| cultureHasUnionTagRel;

administrationSpendingRel:
	ADMINISTRATION_SPENDING ASSIGN (INT | FLOAT);
aiRel: AI ASSIGN affirmative;
allianceWithRel:
	ALLIANCE_WITH ASSIGN (THIS | FROM | COUNTRY_TAG);
averageConsciousnessRel:
	AVERAGE_CONSCIOUSNESS ASSIGN (INT | FLOAT);
averageMilitancyRel: AVERAGE_MILITANCY ASSIGN (INT | FLOAT);
badboyRel: BADBOY ASSIGN (INT | FLOAT);
bigProducerRel: BIG_PRODUCER ASSIGN IDENTIFIER;
blockadeRel: BLOCKADE ASSIGN (INT | FLOAT);
brigadesCompareRel: BRIGADES_COMPARE ASSIGN INT;
canNationalizeRel: CAN_NATIONALIZE ASSIGN affirmative;
canCreateVassalsRel: CAN_CREATE_VASSALS ASSIGN affirmative;
capitalRel: CAPITAL ASSIGN INT;
casusBelliRel: CASUS_BELLI ASSIGN (THIS | FROM | COUNTRY_TAG);
citizenshipPolicyRel: CITIZENSHIP_POLICY ASSIGN IDENTIFIER;
civilizationProgressRel: CIVILIZATION_PROGRESS ASSIGN FLOAT;
civilizedRel: CIVILIZED ASSIGN affirmative;
colonialNationRel: COLONIAL_NATION ASSIGN affirmative;
constructingCbProgressRel:
	CONSTRUCTING_CB_PROGRESS ASSIGN FLOAT;
constructingCbTypeRel: CONSTRUCTING_CB_TYPE ASSIGN IDENTIFIER;
controlsRel: CONTROLS ASSIGN INT;
crimeFightingRel: CRIME_FIGHTING ASSIGN INT;
crisisExistRel: CRISIS_EXIST ASSIGN affirmative;
economicPolicyRel: ECONOMIC_POLICY ASSIGN IDENTIFIER;
educationSpendingRel: EDUCATION_SPENDING ASSIGN (INT | FLOAT);
electionRel: ELECTION ASSIGN affirmative;
existsRel: EXISTS ASSIGN (COUNTRY_TAG | affirmative);
governmentRel: GOVERNMENT ASSIGN IDENTIFIER;
greatWarsEnabledRel: GREAT_WARS_ENABLED ASSIGN affirmative;
haveCoreInRel: HAVE_CORE_IN ASSIGN COUNTRY_TAG;
hasCountryFlagRel:
	HAS_COUNTRY_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
hasCountryModifierRel:
	HAS_COUNTRY_MODIFIER ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
hasCulturalSphereRel: HAS_CULTURAL_SPHERE ASSIGN affirmative;
hasLeaderRel: HAS_LEADER ASSIGN IDENTIFIER;
hasRecentlyLostWarRel: HAS_RECENTLY_LOST_WAR ASSIGN affirmative;
hasUnclaimedCoresRel: HAS_UNCLAIMED_CORES ASSIGN affirmative;
ideologyRel: IDEOLOGY ASSIGN IDENTIFIER;
ideologyValueRel: IDENTIFIER ASSIGN (INT | FLOAT);
industrialScoreRel: INDUSTRIAL_SCORE ASSIGN INT;
inDefaultExpr: IN_DEFAULT ASSIGN (THIS | FROM | COUNTRY_TAG);
inSphereRel: IN_SPHERE ASSIGN (THIS | FROM | COUNTRY_TAG);
inventionRel: INVENTION ASSIGN IDENTIFIER;
involvedInCrisisRel: INVOLVED_IN_CRISIS ASSIGN affirmative;
isClaimCrisisRel: IS_CLAIM_CRISIS ASSIGN affirmative;
isCoreRel: IS_CORE ASSIGN (INT | THIS | FROM | COUNTRY_TAG);
isCulturalUnionRel:
	IS_CULTURAL_UNION ASSIGN (
		THIS
		| FROM
		| COUNTRY_TAG
		| affirmative
	);
isCultureGroupRel:
	IS_CULTURE_GROUP ASSIGN (
		THIS
		| FROM
		| COUNTRY_TAG
		| IDENTIFIER
	);
isDisarmedRel: IS_DISARMED ASSIGN affirmative;
isGreaterPowerRel: IS_GREATER_POWER ASSIGN affirmative;
isIdeologyEnabledRel: IS_IDEOLOGY_ENABLED ASSIGN IDENTIFIER;
isIndependantRel: IS_INDEPENDANT ASSIGN affirmative;
isLiberationCrisisRel: IS_LIBERATION_CRISIS ASSIGN affirmative;
isMobilisedRel: IS_MOBILISED ASSIGN affirmative;
isOurVassalRel:
	IS_OUR_VASSAL ASSIGN (THIS | FROM | COUNTRY_TAG);
isPossibleVassalRel: IS_POSSIBLE_VASSAL ASSIGN COUNTRY_TAG;
isReleasableVassalRel:
	IS_RELEASABLE_VASSAL ASSIGN (THIS | FROM | COUNTRY_TAG);
isSecondaryPowerRel: IS_SECONDARY_POWER ASSIGN affirmative;
isSphereLeaderOfRel:
	IS_SPHERE_LEADER_OF ASSIGN (THIS | FROM | COUNTRY_TAG);
isVassalRel: IS_VASSAL ASSIGN affirmative;
isSubstateRel: IS_SUBSTATE ASSIGN affirmative;
literacyRel: LITERACY ASSIGN (INT | FLOAT);
lostNationalRel: LOST_NATIONAL ASSIGN INT;
middleStrataEverydayNeedsRel:
	MIDDLE_STRATA_EVERYDAY_NEEDS ASSIGN FLOAT;
middleStrataLifeNeedsRel: MIDDLE_STRATA_LIFE_NEEDS ASSIGN FLOAT;
middleStrataLuxuryNeedsRel:
	MIDDLE_STRATA_LUXURY_NEEDS ASSIGN FLOAT;
middleTaxRel: MIDDLE_TAX ASSIGN (INT | FLOAT);
militaryAccessRel: MILITARY_ACCESS ASSIGN COUNTRY_TAG;
militaryReformRel: MILITARY_REFORM ASSIGN IDENTIFIER;
militaryScoreRel: MILITARY_SCORE ASSIGN (INT | THIS);
militarySpendingRel:
	MILITARY_SPENDING ASSIGN (
		INT
		| FLOAT
		| THIS
		| FROM
		| COUNTRY_TAG
	);
moneyRel: MONEY ASSIGN INT;
nationalvalueRel: NATIONALVALUE ASSIGN IDENTIFIER;
nationalProvincesOccupiedRel:
	NATIONAL_PROVINCES_OCCUPIED ASSIGN (INT | FLOAT);
neighbourRel: NEIGHBOUR ASSIGN (THIS | FROM | COUNTRY_TAG);
numOfAlliesRel: NUM_OF_ALLIES ASSIGN INT;
numOfCitiesRel: NUM_OF_CITIES ASSIGN INT;
numOfPortsRel: NUM_OF_PORTS ASSIGN INT;
numOfRevoltsRel: NUM_OF_REVOLTS ASSIGN INT;
numberOfStatesRel: NUMBER_OF_STATES ASSIGN INT;
numOfSubstatesRel: NUM_OF_SUBSTATES ASSIGN INT;
numOfVassalsRel: NUM_OF_VASSALS ASSIGN INT;
numOfVassalsNoSubstatesRel:
	NUM_OF_VASSALS_NO_SUBSTATES ASSIGN INT;
ownsRel: OWNS ASSIGN INT;
partOfSphereRel: PART_OF_SPHERE ASSIGN affirmative;
partyOrPoptypeRel: IDENTIFIER ASSIGN (INT | FLOAT);
politicalMovementStrengthRel:
	POLITICAL_MOVEMENT_STRENGTH ASSIGN (INT | FLOAT);
politicalReformRel:
	IDENTIFIER ASSIGN IDENTIFIER; // both political and social reforms.
politicalReformWantRel: POLITICAL_REFORM_WANT ASSIGN FLOAT;
poorStrataEverydayNeedsRel:
	POOR_STRATA_EVERYDAY_NEEDS ASSIGN FLOAT;
poorStrataLifeNeedsRel: POOR_STRATA_LIFE_NEEDS ASSIGN FLOAT;
poorStrataLuxuryNeedsRel: POOR_STRATA_LUXURY_NEEDS ASSIGN FLOAT;
poorTaxRel:
	POOR_TAX ASSIGN (INT | FLOAT); // maybe better off a FLOAT?
popMajorityCultureRel: POP_MAJORITY_CULTURE ASSIGN IDENTIFIER;
popMajorityIdeologyRel: POP_MAJORITY_IDEOLOGY ASSIGN IDENTIFIER;
popMajorityReligionRel: POP_MAJORITY_RELIGION ASSIGN IDENTIFIER;
popMilitancyRel: POP_MILITANCY ASSIGN (INT | FLOAT);
//[poptype]Rel: [POPTYPE] ASSIGN ;
prestigeRel: PRESTIGE ASSIGN (INT | FLOAT);
primaryCultureRel: PRIMARY_CULTURE ASSIGN (THIS | IDENTIFIER);
acceptedCultureRel: ACCEPTED_CULTURE ASSIGN IDENTIFIER;
producesRel: PRODUCES ASSIGN IDENTIFIER;
rankRel: RANK ASSIGN INT;
religiousPolicyRel: RELIGIOUS_POLICY ASSIGN IDENTIFIER;
revoltPercentageRel: REVOLT_PERCENTAGE ASSIGN (INT | FLOAT);
richStrataEverydayNeedsRel:
	RICH_STRATA_EVERYDAY_NEEDS ASSIGN FLOAT;
richStrataLifeNeedsRel: RICH_STRATA_LIFE_NEEDS ASSIGN FLOAT;
richStrataLuxuryNeedsRel: RICH_STRATA_LUXURY_NEEDS ASSIGN FLOAT;
richTaxRel: RICH_TAX ASSIGN (INT | FLOAT);
rulingPartyRel: RULING_PARTY ASSIGN COUNTRY_TAG;
rulingPartyIdeologyRel: RULING_PARTY_IDEOLOGY ASSIGN IDENTIFIER;
slaveryRel: SLAVERY ASSIGN IDENTIFIER;
socialMovementStrengthRel:
	SOCIAL_MOVEMENT_STRENGTH ASSIGN FLOAT;
socialReformWantRel: SOCIAL_REFORM_WANT ASSIGN FLOAT;
socialSpendingRel: SOCIAL_SPENDING ASSIGN (INT | FLOAT);
strongerArmyThanRel:
	STRONGER_ARMY_THAN ASSIGN (THIS | FROM | COUNTRY_TAG);
substateOfRel: SUBSTATE_OF ASSIGN (THIS | FROM | COUNTRY_TAG);
tagRel: TAG ASSIGN (THIS | FROM | COUNTRY_TAG);
thisCultureUnionRel:
	THIS_CULTURE_UNION ASSIGN (
		THIS
		| FROM
		| COUNTRY_TAG
		| 'this_union'
	);
totalAmountOfDivisionsRel: TOTAL_AMOUNT_OF_DIVISIONS ASSIGN INT;
totalAmountOfShipsRel: TOTAL_AMOUNT_OF_SHIPS ASSIGN INT;
totalDefensivesRel: TOTAL_DEFENSIVES ASSIGN INT;
totalNumOfPortsRel: TOTAL_NUM_OF_PORTS ASSIGN INT;
totalOffensivesRel: TOTAL_OFFENSIVES ASSIGN INT;
totalOfOursSunkRel: TOTAL_OF_OURS_SUNK ASSIGN INT;
totalPopsRel: TOTAL_POPS ASSIGN INT;
totalSeaBattlesRel: TOTAL_SEA_BATTLES ASSIGN INT;
totalSunkByUsRel: TOTAL_SUNK_BY_US ASSIGN INT;
tradePolicyRel: TRADE_POLICY ASSIGN IDENTIFIER;
truceWithRel: TRUCE_WITH ASSIGN (THIS | FROM | COUNTRY_TAG);
unemploymentRel: UNEMPLOYMENT ASSIGN (INT | FLOAT);
unitHasLeaderRel: UNIT_HAS_LEADER ASSIGN affirmative;
unitInBattleRel: UNIT_IN_BATTLE ASSIGN affirmative;
upperHouseRel:
	UPPER_HOUSE ASSIGN L_BRACE (ideologyRel | valueExpr)* R_BRACE;
vassalOfRel: VASSAL_OF ASSIGN (THIS | FROM | COUNTRY_TAG);
warRel: WAR ASSIGN affirmative;
warExhaustionRel: WAR_EXHAUSTION ASSIGN (INT | FLOAT);
warPolicyRel: WAR_POLICY ASSIGN IDENTIFIER;
warWithRel: WAR_WITH ASSIGN (THIS | FROM | COUNTRY_TAG);
techSchoolRel: TECH_SCHOOL ASSIGN IDENTIFIER;
technologyRel: IDENTIFIER ASSIGN INT;
cultureHasUnionTagRel: CULTURE_HAS_UNION_TAG ASSIGN affirmative;

stateRel: isSlaveRel;

isSlaveRel: IS_SLAVE ASSIGN affirmative;

provinceRel:
	averageConsciousnessRel
	| averageMilitancyRel
	| canBuildFactoryRel
	| continentRel
	| controlledByRel
	| controlledByRebelsRel
	| countryUnitsInProvinceRel
	| crimeFightingRel
	| educationSpendingRel
	| emptyRel
	| flashpointTensionRel
	| hasBuildingRel
	| hasCultureCoreRel
	| hasEmptyAdjacentProvinceRel
	| hasEmptyAdjacentStateRel
	| hasFactoriesRel
	| hasNationalMinorityRel
	| hasPopTypeRel
	| hasProvinceFlagRel
	| hasProvinceModifierRel
	| hasRecentImigrationRel
	| isAcceptedCultureRel
	| isBlockadedRel
	| isCapitalRel
	| isCoastalRel
	| isColonialRel
	| isCoreRel
	| isIdeologyEnabledRel
	| isOverseasRel
	| isPrimaryCultureRel
	| isStateCapitalRel
	| isStateReligionRel
	| lifeRatingRel
	| literacyRel
	| militarySpendingRel
	| minoritiesRel
	| ownedByRel
	| popMilitancyRel
	| portRel
	| provinceControlDaysRel
	| provinceIdRel
	| regionRel
	| stateIdRel
	| terrainRel
	| tradeGoodsRel
	| totalPopsRel
	| unemploymentRel
	| unemploymentByTypeRel
	| unitsInProvinceRel
	| workAvailableRel;

canBuildFactoryRel: CAN_BUILD_FACTORY ASSIGN affirmative;
continentRel: CONTINENT ASSIGN IDENTIFIER;
controlledByRel:
	CONTROLLED_BY ASSIGN (THIS | FROM | COUNTRY_TAG);
// even REB works in this case, because rebels are their own tag.
controlledByRebelsRel: CONTROLLED_BY_REBELS ASSIGN affirmative;
countryUnitsInProvinceRel:
	COUNTRY_UNITS_IN_PROVINCE ASSIGN (INT | FLOAT | COUNTRY_TAG);
emptyRel: EMPTY ASSIGN affirmative;
flashpointTensionRel: FLASHPOINT_TENSION ASSIGN INT;
hasBuildingRel:
	HAS_BUILDING ASSIGN (
		IDENTIFIER
		| FORT
		| NAVAL_BASE
		| INFRASTRUCTURE
	);
hasCultureCoreRel: HAS_CULTURE_CORE ASSIGN affirmative;
hasEmptyAdjacentProvinceRel:
	HAS_EMPTY_ADJACENT_PROVINCE ASSIGN affirmative;
hasEmptyAdjacentStateRel:
	HAS_EMPTY_ADJACENT_STATE ASSIGN affirmative;
hasFactoriesRel: HAS_FACTORIES ASSIGN affirmative;
hasNationalMinorityRel:
	HAS_NATIONAL_MINORITY ASSIGN affirmative;
hasPopTypeRel: HAS_POP_TYPE ASSIGN IDENTIFIER;
hasProvinceFlagRel:
	HAS_PROVINCE_FLAG ASSIGN (
		IDENTIFIER
		| NEUTRALITY
		| GREAT_WARS_ENABLED
	);
hasProvinceModifierRel: HAS_PROVINCE_MODIFIER ASSIGN IDENTIFIER;
hasRecentImigrationRel: HAS_RECENT_IMIGRATION ASSIGN INT;
isAcceptedCultureRel:
	IS_ACCEPTED_CULTURE ASSIGN (
		affirmative
		| THIS
		| FROM
		| COUNTRY_TAG
	);
isBlockadedRel: IS_BLOCKADED ASSIGN affirmative;
isCapitalRel: IS_CAPITAL ASSIGN affirmative;
isCoastalRel: IS_COASTAL ASSIGN affirmative;
isColonialRel: IS_COLONIAL ASSIGN affirmative;
isOverseasRel: IS_OVERSEAS ASSIGN affirmative;
isPrimaryCultureRel:
	IS_PRIMARY_CULTURE ASSIGN (
		affirmative
		| THIS
		| FROM
		| COUNTRY_TAG
	);
isStateCapitalRel: IS_STATE_CAPITAL ASSIGN affirmative;
isStateReligionRel: IS_STATE_RELIGION ASSIGN affirmative;
lifeRatingRel: LIFE_RATING ASSIGN INT;
minoritiesRel: MINORITIES ASSIGN affirmative;
ownedByRel: OWNED_BY ASSIGN (THIS | FROM | COUNTRY_TAG);
portRel: PORT ASSIGN affirmative;
provinceControlDaysRel: PROVINCE_CONTROL_DAYS ASSIGN INT;
provinceIdRel: PROVINCE_ID ASSIGN INT;
regionRel: REGION ASSIGN IDENTIFIER;
stateIdRel: STATE_ID ASSIGN INT;
terrainRel: TERRAIN ASSIGN IDENTIFIER;
tradeGoodsRel: TRADE_GOODS ASSIGN (INT | IDENTIFIER);
unemploymentByTypeRel:
	UNEMPLOYMENT_BY_TYPE ASSIGN L_BRACE (typeRel | valueExpr)* R_BRACE;
unitsInProvinceRel: UNITS_IN_PROVINCE ASSIGN INT;
workAvailableRel:
	WORK_AVAILABLE ASSIGN L_BRACE workerExpr* R_BRACE;
workerExpr: 'worker' ASSIGN IDENTIFIER;

popRel:
	cashReservesRel
	| consciousnessRel
	| cultureRel
	| everydayNeedsRel
	| hasPopCultureRel
	| hasPopReligionRel
	| isPrimaryCultureRel
	| isAcceptedCultureRel
	| isCultureGroupRel
	| isStateReligionRel
	| lifeNeedsRel
	| literacyRel
	| luxuryNeedsRel
	| militancyRel
	| moneyRel
	| politicalMovementRel
	| politicalReformWantRel
	| popMajorityCultureRel
	| popMajorityIdeologyRel
	| popMajorityReligionRel
	| religionRel
	| socialMovementRel
	| socialReformWantRel
	| strataRel
	| typeRel
	| unemploymentRel;

cashReservesRel: CASH_RESERVES ASSIGN (INT | FLOAT);
consciousnessRel: CONSCIOUSNESS ASSIGN (INT | FLOAT);
cultureRel: CULTURE ASSIGN IDENTIFIER;
everydayNeedsRel: EVERYDAY_NEEDS ASSIGN (INT | FLOAT);
hasPopCultureRel: HAS_POP_CULTURE ASSIGN (THIS | IDENTIFIER);
hasPopReligionRel: HAS_POP_RELIGION ASSIGN (THIS | IDENTIFIER);
lifeNeedsRel: LIFE_NEEDS ASSIGN (INT | FLOAT);
luxuryNeedsRel: LUXURY_NEEDS ASSIGN (INT | FLOAT);
militancyRel: MILITANCY ASSIGN (INT | FLOAT);
politicalMovementRel: POLITICAL_MOVEMENT ASSIGN affirmative;
religionRel: RELIGION ASSIGN IDENTIFIER;
socialMovementRel: SOCIAL_MOVEMENT ASSIGN affirmative;
strataRel: STRATA ASSIGN ('poor' | 'middle' | 'rich');
typeRel: TYPE ASSIGN IDENTIFIER;

relationExpr: 'relation' ASSIGN whoValueBlock;
whoValueBlock: L_BRACE (whoExpr | valueExpr)* R_BRACE;
whoExpr: 'who' ASSIGN (THIS | FROM | COUNTRY_TAG);
valueExpr: 'value' ASSIGN (INT | FLOAT | IDENTIFIER);

whichValueBlock: L_BRACE (whichRel | valueExpr)* R_BRACE;
whichRel: 'which' ASSIGN IDENTIFIER;

ADMINISTRATION_SPENDING: 'administration_spending';
AI: 'ai';
ALLIANCE_WITH: 'alliance_with';
AVERAGE_CONSCIOUSNESS: 'average_consciousness';
AVERAGE_MILITANCY: 'average_militancy';
BADBOY: 'badboy';
BIG_PRODUCER: 'big_producer';
BLOCKADE: 'blockade';
BRIGADES_COMPARE: 'brigades_compare';
CAN_NATIONALIZE: 'can_nationalize';
CAN_CREATE_VASSALS: 'can_create_vassals';
CAPITAL: 'capital';
CASUS_BELLI: 'casus_belli';
CITIZENSHIP_POLICY: 'citizenship_policy';
CIVILIZATION_PROGRESS: 'civilization_progress';
CIVILIZED: 'civilized';
COLONIAL_NATION: 'colonial_nation';
CONSTRUCTING_CB_PROGRESS: 'constructing_cb_progress';
CONSTRUCTING_CB_TYPE: 'constructing_cb_type';
CONTROLS: 'controls';
CRIME_FIGHTING: 'crime_fighting';
CRISIS_EXIST: 'crisis_exist';
ECONOMIC_POLICY: 'economic_policy';
EDUCATION_SPENDING: 'education_spending';
ELECTION: 'election';
EXISTS: 'exists';
GOVERNMENT: 'government';
GREAT_WARS_ENABLED: 'great_wars_enabled';
HAVE_CORE_IN: 'have_core_in';
HAS_COUNTRY_FLAG: 'has_country_flag';
HAS_COUNTRY_MODIFIER: 'has_country_modifier';
HAS_CULTURAL_SPHERE: 'has_cultural_sphere';
HAS_LEADER: 'has_leader';
HAS_RECENTLY_LOST_WAR: 'has_recently_lost_war';
HAS_UNCLAIMED_CORES: 'has_unclaimed_cores';
IDEOLOGY: 'ideology';
ISSUE: 'issue';
INDUSTRIAL_SCORE: 'industrial_score';
IN_DEFAULT: 'in_default';
IN_SPHERE: 'in_sphere';
INVENTION: 'invention';
INVOLVED_IN_CRISIS: 'involved_in_crisis';
IS_CLAIM_CRISIS: 'is_claim_crisis';
IS_CORE: 'is_core';
IS_CULTURAL_UNION: 'is_cultural_union';
IS_CULTURE_GROUP: 'is_culture_group';
IS_DISARMED: 'is_disarmed';
IS_GREATER_POWER: 'is_greater_power';
IS_IDEOLOGY_ENABLED: 'is_ideology_enabled';
IS_INDEPENDANT: 'is_independant';
IS_LIBERATION_CRISIS: 'is_liberation_crisis';
IS_MOBILISED: 'is_mobilised';
IS_OUR_VASSAL: 'is_our_vassal';
IS_POSSIBLE_VASSAL: 'is_possible_vassal';
IS_RELEASABLE_VASSAL: 'is_releasable_vassal';
IS_SECONDARY_POWER: 'is_secondary_power';
IS_SPHERE_LEADER_OF: 'is_sphere_leader_of';
IS_VASSAL: 'is_vassal';
IS_SUBSTATE: 'is_substate';
LITERACY: 'literacy';
LOST_NATIONAL: 'lost_national';
MIDDLE_STRATA_EVERYDAY_NEEDS: 'middle_strata_everyday_needs';
MIDDLE_STRATA_LIFE_NEEDS: 'middle_strata_life_needs';
MIDDLE_STRATA_LUXURY_NEEDS: 'middle_strata_luxury_needs';
MIDDLE_TAX: 'middle_tax';
MILITARY_ACCESS: 'military_access';
MILITARY_REFORM: 'military_reform';
MILITARY_SCORE: 'military_score';
MILITARY_SPENDING: 'military_spending';
MONEY: 'money';
NATIONALVALUE: 'nationalvalue';
NATIONAL_PROVINCES_OCCUPIED: 'national_provinces_occupied';
NEIGHBOUR: 'neighbour';
NUM_OF_ALLIES: 'num_of_allies';
NUM_OF_CITIES: 'num_of_cities';
NUM_OF_PORTS: 'num_of_ports';
NUM_OF_REVOLTS: 'num_of_revolts';
NUMBER_OF_STATES: 'number_of_states';
NUM_OF_SUBSTATES: 'num_of_substates';
NUM_OF_VASSALS: 'num_of_vassals';
NUM_OF_VASSALS_NO_SUBSTATES: 'num_of_vassals_no_substates';
OWNS: 'owns';
PART_OF_SPHERE: 'part_of_sphere';
POLITICAL_MOVEMENT_STRENGTH: 'political_movement_strength';
POLITICAL_REFORM: 'political_reform';
POLITICAL_REFORM_WANT: 'political_reform_want';
POOR_STRATA_EVERYDAY_NEEDS: 'poor_strata_everyday_needs';
POOR_STRATA_LIFE_NEEDS: 'poor_strata_life_needs';
POOR_STRATA_LUXURY_NEEDS: 'poor_strata_luxury_needs';
POOR_TAX: 'poor_tax';
POP_MAJORITY_CULTURE: 'pop_majority_culture';
POP_MAJORITY_IDEOLOGY: 'pop_majority_ideology';
POP_MAJORITY_RELIGION: 'pop_majority_religion';
POP_MILITANCY: 'pop_militancy';
PRESTIGE: 'prestige';
PRIMARY_CULTURE: 'primary_culture';
ACCEPTED_CULTURE: 'accepted_culture';
PRODUCES: 'produces';
RANK: 'rank';
RELATION: 'relation';
RELIGIOUS_POLICY: 'religious_policy';
REVOLT_PERCENTAGE: 'revolt_percentage';
RICH_STRATA_EVERYDAY_NEEDS: 'rich_strata_everyday_needs';
RICH_STRATA_LIFE_NEEDS: 'rich_strata_life_needs';
RICH_STRATA_LUXURY_NEEDS: 'rich_strata_luxury_needs';
RICH_TAX: 'rich_tax';
RULING_PARTY: 'ruling_party';
RULING_PARTY_IDEOLOGY: 'ruling_party_ideology';
SLAVERY: 'slavery';
SOCIAL_MOVEMENT_STRENGTH: 'social_movement_strength';
SOCIAL_REFORM_WANT: 'social_reform_want';
SOCIAL_SPENDING: 'social_spending';
STRONGER_ARMY_THAN: 'stronger_army_than';
SUBSTATE_OF: 'substate_of';
TAG: 'tag';
TECH_SCHOOL: 'tech_school';
THIS_CULTURE_UNION: 'this_culture_union';
TOTAL_AMOUNT_OF_DIVISIONS: 'total_amount_of_divisions';
TOTAL_AMOUNT_OF_SHIPS: 'total_amount_of_ships';
TOTAL_DEFENSIVES: 'total_defensives';
TOTAL_NUM_OF_PORTS: 'total_num_of_ports';
TOTAL_OFFENSIVES: 'total_offensives';
TOTAL_OF_OURS_SUNK: 'total_of_ours_sunk';
TOTAL_POPS: 'total_pops';
TOTAL_SEA_BATTLES: 'total_sea_battles';
TOTAL_SUNK_BY_US: 'total_sunk_by_us';
TRADE_POLICY: 'trade_policy';
TRUCE_WITH: 'truce_with';
UNEMPLOYMENT: 'unemployment';
UNIT_HAS_LEADER: 'unit_has_leader';
UNIT_IN_BATTLE: 'unit_in_battle';
UPPER_HOUSE: 'upper_house';
VASSAL_OF: 'vassal_of';
WAR: 'war';
WAR_EXHAUSTION: 'war_exhaustion';
WAR_POLICY: 'war_policy';
WAR_WITH: 'war_with';
CAN_BUILD_FACTORY: 'can_build_factory';
CONTINENT: 'continent';
CONTROLLED_BY: 'controlled_by';
CONTROLLED_BY_REBELS: 'controlled_by_rebels';
COUNTRY_UNITS_IN_PROVINCE: 'country_units_in_province';
EMPTY: 'empty';
FLASHPOINT_TENSION: 'flashpoint_tension';
HAS_BUILDING: 'has_building';
HAS_CULTURE_CORE: 'has_culture_core';
HAS_EMPTY_ADJACENT_PROVINCE: 'has_empty_adjacent_province';
HAS_EMPTY_ADJACENT_STATE: 'has_empty_adjacent_state';
HAS_FACTORIES: 'has_factories';
HAS_NATIONAL_MINORITY: 'has_national_minority';
HAS_POP_TYPE: 'has_pop_type';
HAS_PROVINCE_FLAG: 'has_province_flag';
HAS_PROVINCE_MODIFIER: 'has_province_modifier';
HAS_RECENT_IMIGRATION: 'has_recent_imigration';
IS_ACCEPTED_CULTURE: 'is_accepted_culture';
IS_BLOCKADED: 'is_blockaded';
IS_CAPITAL: 'is_capital';
IS_COASTAL: 'is_coastal';
IS_COLONIAL: 'is_colonial';
IS_OVERSEAS: 'is_overseas';
IS_PRIMARY_CULTURE: 'is_primary_culture';
IS_SLAVE: 'is_slave';
IS_STATE_CAPITAL: 'is_state_capital';
IS_STATE_RELIGION: 'is_state_religion';
LIFE_RATING: 'life_rating';
MINORITIES: 'minorities';
OWNED_BY: 'owned_by';
PORT: 'port';
PROVINCE_CONTROL_DAYS: 'province_control_days';
PROVINCE_ID: 'province_id';
REGION: 'region';
STATE_ID: 'state_id';
TERRAIN: 'terrain';
TRADE_GOODS: 'trade_goods';
UNEMPLOYMENT_BY_TYPE: 'unemployment_by_type';
UNITS_IN_PROVINCE: 'units_in_province';
WORK_AVAILABLE: 'work_available';
CASH_RESERVES: 'cash_reserves';
CONSCIOUSNESS: 'consciousness';
CULTURE: 'culture';
EVERYDAY_NEEDS: 'everyday_needs';
HAS_POP_CULTURE: 'has_pop_culture';
HAS_POP_RELIGION: 'has_pop_religion';
LIFE_NEEDS: 'life_needs';
LUXURY_NEEDS: 'luxury_needs';
MILITANCY: 'militancy';
POLITICAL_MOVEMENT: 'political_movement';
RELIGION: 'religion';
SOCIAL_MOVEMENT: 'social_movement';
STRATA: 'strata';
TYPE: 'type';
// stuff I notice that aren't mentioned in the wiki
NEUTRALITY: 'neutrality';
CULTURE_HAS_UNION_TAG: 'culture_has_union_tag';
FORT: 'fort';
NAVAL_BASE: 'naval_base';
INFRASTRUCTURE: 'infrastructure';

YEAR: 'year';
MONTH: 'month';
IMMEDIATE: 'immediate';
CHECK_VARIABLE: 'check_variable';
HAS_GLOBAL_FLAG: 'has_global_flag';
IS_CANAL_ENABLED: 'is_canal_enabled';

// scopes
ANY_CORE: 'any_core';
ANY_GREATER_POWER: 'any_greater_power';
ANY_NEIGHBOR_COUNTRY: 'any_neighbor_country';
ANY_OWNED_PROVINCE: 'any_owned_province';
ANY_POP: 'any_pop';
CAPITAL_SCOPE: 'capital_scope';
CULTURAL_UNION: 'cultural_union';
OVERLORD: 'overlord';
SPHERE_OWNER: 'sphere_owner';
ANY_SUBSTATE: 'any_substate';
ANY_NEIGHBOR_PROVINCE: 'any_neighbor_province';
CONTROLLER: 'controller';
OWNER: 'owner';
STATE_SCOPE: 'state_scope';
LOCATION: 'location';
COUNTRY: 'country';
ALL_CORE: 'all_core';
ANY_COUNTRY: 'any_country';
ANY_OWNED: 'any_owned';
ANY_STATE: 'any_state';
RANDOM_COUNTRY: 'random_country';
RANDOM_STATE: 'random_state';
RANDOM_OWNED: 'random_owned';
RANDOM_POP: 'random_pop';
RANDOM_NEIGHBOR_PROVINCE: 'random_neighbor_province';
RANDOM_EMPTY_NEIGHBOR_PROVINCE:
	'random_empty_neighbor_province';

affirmative: YES | NO;
YES: 'yes';
NO: 'no';

LIMIT: 'limit';

THIS: 'THIS';
FROM: 'FROM';
LOWER_FROM: 'from';
LOWER_TO: 'to';

COUNTRY_TAG: CAP_LETTER CAP_OR_DIGIT CAP_OR_DIGIT;
fragment CAP_OR_DIGIT: CAP_LETTER | DIGIT;

// boolean operators
AND: 'AND';
OR: 'OR';
NOT: 'NOT';

ASSIGN: '=';
L_BRACE: '{';
R_BRACE: '}';

STRING: '"' (~'"' | '\\"')* '"';

FLOAT: INT? '.' DIGIT+;

INT: '-'? DIGIT+;

IDENTIFIER: LETTER (LETTER | DIGIT | '.')*;
fragment DIGIT: ('0' ..'9');
fragment LETTER: ('a' ..'z' | CAP_LETTER | '_');
fragment CAP_LETTER: ('A' ..'Z');

COMMENT: '#' ~('\r' | '\n')* -> skip;
WS: [ \t\r\n] -> skip;
