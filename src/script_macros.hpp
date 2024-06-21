#define PREFIX SESO
#include "\x\cba\addons\main\script_macros_mission.hpp"

#define COMMA_2(var) var,var
#define COMMA_3(var) COMMA_2(var),var
#define COMMA_4(var) COMMA_3(var),var
#define COMMA_5(var) COMMA_4(var),var
#define COMMA_6(var) COMMA_5(var),var
#define COMMA_7(var) COMMA_6(var),var
#define COMMA_8(var) COMMA_7(var),var
#define COMMA_9(var) COMMA_8(var),var
#define COMMA_10(var) COMMA_9(var),var

#define PLAYER_UNITS_ITEMS ["LIB_Sten_Mk5","LIB_32rnd_9x19_t","LIB_Colt_M1911","LIB_7Rnd_45ACP","U_LIB_GBR_NCO_ParaCamo02v02pSgtM1Tho","JMSSA_ita_VAmmoSMG","ACE_MapTools","LIB_US_M18","LIB_US_M18_Green","LIB_US_M18_Red","B_LIB_UK_HSack_Blanco","ACE_elasticBandage","ACE_packingBandage","ACE_EntrenchingTool","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_Flashlight_MX991","H_LIB_US_HelmetKaki0F_WOWhiteWO","ItemMap","ItemRadioAcreFlagged","LIB_GER_ItemCompass_deg","LIB_GER_ItemWatch","LIB_M1_Garand","LIB_8Rnd_762x63_t","LIB_FLARE_PISTOL","LIB_1Rnd_flare_white","U_LIB_GBR_EnlMan_ParaCamo03v01pPvtSmLE","JMSSA_ita_VAmmoBelt","LIB_US_Mk_2","LIB_1Rnd_flare_green","B_LIB_SOV_RA_Radio","ACRE_PRC152","H_LIB_US_HelmetKaki0C_NxNx","LIB_8Rnd_762x63","U_LIB_GBR_EnlMan_ParaCamo02v03pPvtMedSmLE","B_LIB_SOV_RA_MedicalBag_Empty","ACE_bloodIV","ACE_bloodIV_500","ACE_adenosine","ACE_surgicalKit","H_LIB_US_Helmetos_MedCRRB1234","LIB_M1919A6","LIB_50Rnd_762x63","JMSSA_ita_VAmmoStrip","LIB_M1A1_Bazooka","LIB_1Rnd_60mm_M6","JMSSA_ita_VCrewStrip","B_LIB_US_RocketBag_Empty","LIB_32Rnd_9x19_Sten"]
#define FORGOTTEN_CUP_ITEMS ["ACRE_PRC152","ACRE_PRC343","ACE_elasticBandage","ACE_packingBandage","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_CableTie","ACE_bodyBag","ACE_DefusalKit","ACE_EntrenchingTool","ACE_epinephrine","ACE_Fortify","ACE_Flashlight_MX991","ACE_Clacker","ACE_MapTools","ACE_morphine","ACE_personalAidKit","ACE_SpareBarrel_Item","ACE_splint","ACE_SpottingScope","ACE_SpraypaintBlack","ACE_SpraypaintBlue","ACE_SpraypaintGreen","ACE_SpraypaintRed","ACE_SpraypaintWhite","ACE_SpraypaintYellow","ACE_surgicalKit","ACE_tourniquet","ACE_wirecutter","ACE_Chemlight_HiGreen","B_IR_Grenade","ACE_HandFlare_Green","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","HandGrenade","DemoCharge_Remote_Mag","ACE_rope12","Old_Camera_Color_HUD","Old_Camera_Color","Old_Camera_HUD","Old_Camera","Nikon_DSLR_HUD","Nikon_DSLR","immersion_pops_poppack","murshun_cigs_lighter","murshun_cigs_matches","murshun_cigs_cigpack","immersion_cigs_cigar0","murshun_cigs_cig0","immersion_pops_pop0","immersion_cigs_cigar0_nv","murshun_cigs_cig0_nv","ACE_VMM3", "ACE_painkillers", "acex_intelitems_notepad", "WBK_HeadLampItem", "ACE_Sandbag_empty"]
#define FORGOTTEN_WW2_ITEMS ["ACRE_PRC152","ACE_elasticBandage","ACE_packingBandage","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_CableTie","ACE_bodyBag","ACE_DefusalKit","ACE_EntrenchingTool","ACE_epinephrine","ACE_Fortify","ACE_Flashlight_MX991","ACE_LIB_LadungPM","ACE_LIB_FireCord","ACE_MapTools","ACE_morphine","ACE_personalAidKit","ACE_SpareBarrel_Item","ACE_splint","ACE_surgicalKit","ACE_tourniquet","ACE_wirecutter","ACE_HandFlare_Green","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellPurple","HandGrenade","ACE_rope12","Old_Camera_Color_HUD","Old_Camera_Color","Old_Camera_HUD","Old_Camera","immersion_pops_poppack","murshun_cigs_lighter","murshun_cigs_matches","murshun_cigs_cigpack","immersion_cigs_cigar0","murshun_cigs_cig0","immersion_pops_pop0","immersion_cigs_cigar0_nv","murshun_cigs_cig0_nv","ACE_VMM3","ACE_painkillers", "acex_intelitems_notepad", "WBK_HeadLampItem", "ACE_Sandbag_empty"]

#define MAT_CHECK (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa")
#define LAT_CHECK (getArray (configfile >> "CBA_DisposableLaunchers" >> (currentWeapon player)) isNotEqualTo [])
#define AA_CHECK (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_aa_ca.paa")
#define MG_CHECK (getText(configFile >> "CfgWeapons" >> (primaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa")

#define ARSENAL_MEDICAL ["ACE_elasticBandage","ACE_packingBandage","ACE_bodyBag","ACE_epinephrine","ACE_tourniquet","ACE_bloodIV","ACE_adenosine","ACE_morphine","ACE_bloodIV_500","ACE_bloodIV_250","ACE_splint","ACE_surgicalKit","ACE_personalAidKit"]
#define ARSENAL_TOOLS ["ACE_LIB_LadungPM","LIB_ToolKit","ACE_LIB_FireCord","ACE_Clacker","ToolKit","ACE_wirecutter","ACE_Fortify","ACE_DefusalKit","ACE_Kestrel4500","ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope3","ACE_rope36","ACE_rope6"]