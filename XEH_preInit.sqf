// Source
// https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#create-a-custom-setting-for-mission-or-mod

#define PLAYER_UNITS_ITEMS ["LIB_Sten_Mk5","LIB_32rnd_9x19_t","LIB_Colt_M1911","LIB_7Rnd_45ACP","U_LIB_GBR_NCO_ParaCamo02v02pSgtM1Tho","JMSSA_ita_VAmmoSMG","ACE_MapTools","LIB_US_M18","LIB_US_M18_Green","LIB_US_M18_Red","B_LIB_UK_HSack_Blanco","ACE_elasticBandage","ACE_packingBandage","ACE_EntrenchingTool","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_Flashlight_MX991","H_LIB_US_HelmetKaki0F_WOWhiteWO","ItemMap","ItemRadioAcreFlagged","LIB_GER_ItemCompass_deg","LIB_GER_ItemWatch","LIB_M1_Garand","LIB_8Rnd_762x63_t","LIB_FLARE_PISTOL","LIB_1Rnd_flare_white","U_LIB_GBR_EnlMan_ParaCamo03v01pPvtSmLE","JMSSA_ita_VAmmoBelt","LIB_US_Mk_2","LIB_1Rnd_flare_green","B_LIB_SOV_RA_Radio","ACRE_PRC152","H_LIB_US_HelmetKaki0C_NxNx","LIB_8Rnd_762x63","U_LIB_GBR_EnlMan_ParaCamo02v03pPvtMedSmLE","B_LIB_SOV_RA_MedicalBag_Empty","ACE_bloodIV","ACE_bloodIV_500","ACE_adenosine","ACE_surgicalKit","H_LIB_US_Helmetos_MedCRRB1234","LIB_M1919A6","LIB_50Rnd_762x63","JMSSA_ita_VAmmoStrip","LIB_M1A1_Bazooka","LIB_1Rnd_60mm_M6","JMSSA_ita_VCrewStrip","B_LIB_US_RocketBag_Empty","LIB_32Rnd_9x19_Sten"]
#define FORGOTTEN_CUP_ITEMS ["ACRE_PRC152","ACRE_PRC343","ACE_elasticBandage","ACE_packingBandage","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_CableTie","ACE_bodyBag","ACE_DefusalKit","ACE_EntrenchingTool","ACE_epinephrine","ACE_Fortify","ACE_Flashlight_MX991","ACE_Clacker","ACE_MapTools","ACE_morphine","ACE_personalAidKit","ACE_SpareBarrel_Item","ACE_splint","ACE_SpottingScope","ACE_SpraypaintBlack","ACE_SpraypaintBlue","ACE_SpraypaintGreen","ACE_SpraypaintRed","ACE_surgicalKit","ACE_tourniquet","ACE_wirecutter","ACE_Chemlight_HiGreen","B_IR_Grenade","ACE_HandFlare_Green","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","HandGrenade","DemoCharge_Remote_Mag","ACE_artilleryTable","ACE_rope12","Old_Camera_Color_HUD","Old_Camera_Color","Old_Camera_HUD","Old_Camera","Nikon_DSLR_HUD","Nikon_DSLR","immersion_pops_poppack","murshun_cigs_lighter","murshun_cigs_matches","murshun_cigs_cigpack","immersion_cigs_cigar0","murshun_cigs_cig0","immersion_pops_pop0","immersion_cigs_cigar0_nv","murshun_cigs_cig0_nv","ACE_VMM3"]
#define FORGOTTEN_WW2_ITEMS ["ACRE_PRC152","ACE_elasticBandage","ACE_packingBandage","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_CableTie","ACE_bodyBag","ACE_DefusalKit","ACE_EntrenchingTool","ACE_epinephrine","ACE_Fortify","ACE_Flashlight_MX991","ACE_LIB_LadungPM","ACE_LIB_FireCord","ACE_MapTools","ACE_morphine","ACE_personalAidKit","ACE_SpareBarrel_Item","ACE_splint","ACE_surgicalKit","ACE_tourniquet","ACE_wirecutter","ACE_HandFlare_Green","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellPurple","HandGrenade","ACE_artilleryTable","ACE_rope12","Old_Camera_Color_HUD","Old_Camera_Color","Old_Camera_HUD","Old_Camera","immersion_pops_poppack","murshun_cigs_lighter","murshun_cigs_matches","murshun_cigs_cigpack","immersion_cigs_cigar0","murshun_cigs_cig0","immersion_pops_pop0","immersion_cigs_cigar0_nv","murshun_cigs_cig0_nv","ACE_VMM3"]


////////////////////////////////////////////////////////////////
// ACE3 Auto Arsenal
////////////////////////////////////////////////////////////////

[
    "SESO_setting_AutoArsenalManualList",
    "EDITBOX",
    ["List of Player Equipment", "Run [] call SESO_fnc_getPlayerUnitsItems in your Debug Console then paste the output here. These items will be added to the arsenals on top of their existing items. "],
	["SESO Mission Framework", "ACE3 Auto Arsenal"],
	str PLAYER_UNITS_ITEMS,
    true, // _isGlobal
    {
		params ["_value"];
		//missionNamespace setVariable ["SESO_var_AutoArsenalManualList",parseSimpleArray _value];

    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_AutoArsenalForgottenList",
    "LIST",
    ["List of Forgotten Equipment", "Select a theme of forgotten items to add on the arsenal. Choose None to add no items. These items will be added to the arsenals on top of their existing items."],
	["SESO Mission Framework", "ACE3 Auto Arsenal"],
	[
		[str FORGOTTEN_CUP_ITEMS, str FORGOTTEN_WW2_ITEMS, str []],
		["Forgotten CUP Items", "Forgotten WW2 Items", "None"],
		0
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_AutoArsenalEntityLayerName",
    "EDITBOX",
    ["Auto Arsenals Entity Layer Name", "CASE SENSITIVE name of entity layer with objects that will become ACE3 arsenals. The entity layer must match this exact name. Only objects in this layer will be affected."],
	["SESO Mission Framework", "ACE3 Auto Arsenal"],
    "Arsenals",
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		private _fullListOfEquipment = (parseSimpleArray (missionNamespace getVariable "SESO_setting_AutoArsenalManualList"));
		_fullListOfEquipment append (parseSimpleArray (missionNamespace getVariable "SESO_setting_AutoArsenalForgottenList"));
		[_value, _fullListOfEquipment] call SESO_fnc_initArsenalServer;

    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Setup System
////////////////////////////////////////////////////////////////

[
    "SESO_setting_SetupSystemEnable",
    "CHECKBOX",
    ["Enable Setup System", "Enable Setup System. Disable if using other ticket system."],
	["SESO Mission Framework", "Setup"],
    true,
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_SetupStartingTickets",
    "SLIDER",
    ["Starting Tickets", "Define respawn tickets at mission start. Set to less than 0 to disable."],
	["SESO Mission Framework", "Setup"],
    [-1,100,2,0],
    true, // _isGlobal
    {  
		if !(missionNamespace getVariable "SESO_setting_SetupSystemEnable") exitWith {};
        params ["_value"];
		if (_value < 0) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
		[player, _value] call BIS_fnc_respawnTickets;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_SetupTimer",
    "SLIDER",
    ["Setup Timer (seconds)", "Set amount of setup at mission start. Timer is in seconds. Default is 25 mins (1500 seconds). Set to less than 0 to disable."],
	["SESO Mission Framework", "Setup"],
    [-1,3600,1500,0],
    true, // _isGlobal
    {
		if !(missionNamespace getVariable "SESO_setting_SetupSystemEnable") exitWith {};
		params ["_value"];
		if (_value < 0) exitWith {};
        // Global
		[_value] spawn {
			waitUntil {cba_missiontime > 0};
			params ["_value"];
			[_value] call SESO_fnc_setupTimer;
		};
    }
] call CBA_fnc_addSetting;
/*
////////////////////////////////////////////////////////////////
// Custom Map Locations
////////////////////////////////////////////////////////////////
[
    "SESO_setting_CustomMapLocationsNameVillageColorSelect",
    "LIST",
    ["Marker Color for Village Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		5
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsNameCityColor",
    "LIST",
    ["Marker Color for City Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		10
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsNameCityCapitalColor",
    "LIST",
    ["Marker Color for City Capital Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		3
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsNameLocalColor",
    "LIST",
    ["Marker Color for Local Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		7
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsHillColor",
    "LIST",
    ["Marker Color for Hill Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		1
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsVegetationFirColor",
    "LIST",
    ["Marker Color for Temperate Forest Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		8
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsVegetationPalmColor",
    "LIST",
    ["Marker Color for Tropical Forest Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		6
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsNameMarineColor",
    "LIST",
    ["Marker Color for Marine Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		9
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsRockAreaColor",
    "LIST",
    ["Marker Color for Rock Location", "Set the color of marker to represent this location. MUST BE UNIQUE COLOR."],
	["SESO Mission Framework", "Custom Map Locations"],
    [
		["Default","ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"],
		["Default","Black","Grey","Red","Brown","Orange","Yellow","Khaki","Green","Blue","Pink","White"],
		2
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomMapLocationsEntityLayerName",
    "EDITBOX",
    ["Custom Map Locations Entity Layer Name", "CASE SENSITIVE name of the entity layer or folder that defines custom map locations. If not found, no map locations will be defined. Only objects in this layer will be affected."],
	["SESO Mission Framework", "Custom Map Locations"],
    "Map Locations",
    true, // _isGlobal
    {
		params ["_value"];

        // Server only
		if !(isServer) exitWith {};
		// Check if layer is exists
		if (count (getMissionLayerEntities _value) <= 0) exitWith {};
		private _entityLayerName = (getMissionLayerEntities _value) select 1;
		// Check if layer has entities
		if ((count _entityLayerName) == 0) exitWith {};

		[_value] call SESO_fnc_defineMapLocationsServer;
    }
] call CBA_fnc_addSetting;
*/
////////////////////////////////////////////////////////////////
// ZBE AI Caching
////////////////////////////////////////////////////////////////

// BUG: AI Units tend to teleport whether they are cached or not.
[
    "SESO_setting_CacheEnable",
    "CHECKBOX",
    ["Enable ZBE AI Caching", "Enable or disable caching of AI and vehicles."],
    ["SESO Mission Framework","ZBE AI Caching"],
    true,
    true // _isGlobal
] call CBA_fnc_addSetting;


[
    "SESO_setting_CacheExceptionEntityLayerName",
    "EDITBOX",
    ["Cache Exceptions Entity Layer Name", "CASE SENSITIVE name of entity layer of vehicles and AI that will be exempt from being cached."],
    ["SESO Mission Framework","ZBE AI Caching"],
    "Cache Exceptions",
    true, // _isGlobal
    {  
		if !(missionNamespace getVariable "SESO_setting_CacheEnable") exitWith {};
        params ["_value"];
        // Server only
        if !(isServer) exitWith {};
        [_value] spawn {
			params ["_value"];
			{
				_x setVariable ["zbe_cacheDisabled",true];

			}forEach ((getMissionLayerEntities _value) select 0);
		};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_CacheDistance",
    "SLIDER",
    ["Caching Distance", "The minimum distance between AI and a player until caching begins. For example, 600 meters means AI further away than 600 meters will be cached."],
    ["SESO Mission Framework","ZBE AI Caching"],
    [100, 15000, 600, 0],
    true, // _isGlobal
    {  
		if !(missionNamespace getVariable "SESO_setting_CacheEnable") exitWith {};
        params ["_value"];
        // Server only
        if !(isServer) exitWith {};
        [_value] spawn {
            params ["_value"];
            [_value,-1,false,100,_value,_value] execVM "src\zbe_cache\main.sqf";
        };
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Advanced ACE3 Fortify
////////////////////////////////////////////////////////////////

[
    "SESO_setting_FortifyAdvancedEnable",
    "CHECKBOX",
    ["Enable ACE3 Advanced Fortify", "Check to enable additional options and blueprints for the Fortify Tool and Engineers. Uncheck to leave it unchanged."],
	["SESO Mission Framework", "ACE3 Advanced Fortify"],
    true,
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_FortifyAdvancedSwitcher",
    "EDITBOX",
    ["Set Object to be Blueprint Switcher", "Variable name of object that would be used by engineers to switch blueprints. Traditionally, a respawn vehicle but can be anything."],
	["SESO Mission Framework", "ACE3 Advanced Fortify"],
    "logi_truck",
    true, // _isGlobal
    {
        params ["_value"];
		if !(missionNamespace getVariable "SESO_setting_FortifyAdvancedEnable") exitWith {};
        // Global
        [missionNamespace getVariable _value] call SESO_fnc_fortifyInit;
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Misc.
////////////////////////////////////////////////////////////////

[
    "SESO_setting_DisableFallDamage",
    "CHECKBOX",
    ["Disable Fall Damage", "Disable fall damage for players."],
	["SESO Mission Framework"],
    false,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
        [] spawn {
            while {true} do {
                player allowDamage true;
                waitUntil{!isTouchingGround player};
                player allowDamage false;
                waitUntil{isTouchingGround player};
            };
        };
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_DynamicGroupManagerEnable",
    "CHECKBOX",
    ["Enable Dynamic Group Manager", "Enable Dynamic Group Manager, to let players view and join player groups. Accessible by pressing U."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Server only
		if (isServer) then {
			["Initialize", [true]] call BIS_fnc_dynamicGroups;
		};
        // Player only
		if (hasInterface) then {
			["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
		};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_StaminaDisable",
    "CHECKBOX",
    ["Disable Player Stamina", "Check to disable players' stamina. Uncheck to re-enable it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
        player enableStamina false;
        private _STAMINA_DISABLER_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            _unit enableStamina false;
        }];
    }
] call CBA_fnc_addSetting;

// BUG: Doesnt work, exploit works
// TEST
[
    "SESO_setting_GlobalChatDisableWhenUncon",
    "CHECKBOX",
    ["Disable Global Chat when Unconscious", "Check to disable players' access to global chat when unconscious. Uncheck to re-enable it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
        0 enableChannel true;
        private _GLOBAL_DISABLER_ID = [] call SESO_fnc_hideGlobalChatWhenUncon;
        private _GLOBAL_DISABLER_RESPAWN_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            0 enableChannel true;
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_PlayerCamoCoef",
    "EDITBOX",
    ["Player Camouflage Coefficient", "Set player's camo Coef. 1 is default and less is more camoflauged. Set less than 0 to leave camo on automatic."],
	["SESO Mission Framework"],
    "0.05",
    true, // _isGlobal
    {  
        params ["_value"];
		_value = parseNumber _value;
		if (_value < 0) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        player setUnitTrait ["camouflageCoef",_value];
        private _CAMO_COEF_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};
            _value = parseNumber (missionNamespace getVariable "SESO_setting_PlayerCamoCoef");

            _unit setUnitTrait ["camouflageCoef", _value];
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_PlayMusicOnDeath",
    "EDITBOX",
    ["Music On Death", "Set music to play when player dies. Empty for no music on death."],
	["SESO Mission Framework"],
    "CUP_A1_Arma_Magna",
    true, // _isGlobal
    {  
        params ["_value"];
		if ((count _value) == 0) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};

        private _DEATH_MUSIC_ID = player addEventHandler ["Killed", {
            params ["_unit"];
            if !(_unit == player) exitWith {};

            playMusic "CUP_A1_Arma_Magna";
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_AutoEndMission",
    "CHECKBOX",
    ["Auto End Mission on 0 Tickets", "Check to end the mission on a failure if there are 0 tickets and there are 0 living players, not counting the Zeus(es). Uncheck to continue the mission after tickets and players are 0."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        private _AUTO_END_ID = player addEventHandler ["Killed", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            [] call SESO_fnc_autoEndMission;
        }];
    }
] call CBA_fnc_addSetting;


[
    "SESO_setting_LoadLastKitOnRespawn",
    "CHECKBOX",
    ["Load Last Used Arsenal Kit on Respawn", "Check to load players' last used loadout after exiting. Uncheck to disable this."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        //[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
        private _LOAD_LAST_KIT_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            [_unit, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_ShowRespawnTicketsEnable",
    "CHECKBOX",
    ["Show Respawn Tickets", "Check to show how many respawn tickets are available to players. Uncheck to leave it hidden."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[] call BIS_fnc_showMissionStatus;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_WarCrimeDetectorEnable",
    "CHECKBOX",
    ["Enable War Crime Detector", "Whether to keep track and reduce tickets for every civilian death, friendly kill, and detainee kill."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
        // Global
		[] call SESO_fnc_detectWarCrime;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_MarkedBuildingsEntityLayerName",
    "EDITBOX",
    ["Marked Buildings Custom Entity Layer Name", "CASE SENSITIVE name of layer of buildings and props to mark as grey rectangles on the map. Objects must be in this layer to be marked."],
	["SESO Mission Framework"],
    "Marked Buildings",
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		// Check if layer is exists
		if (count (getMissionLayerEntities _value) <= 0) exitWith {};
		private _entityLayerName = (getMissionLayerEntities _value) select 0;
		// Check if layer has entities
		if ((count _entityLayerName) == 0) exitWith {};

		// Mark buildings in layer
		{
			[_x, true] call zen_building_markers_fnc_set;

		}forEach ((getMissionLayerEntities _value) select 0);
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_AmmoGeneratorEntityLayerName",
    "EDITBOX",
    ["Ammo Generator Custom Entity Layer Name", "CASE SENSITIVE name of layer of containers and vehicles to fill with player and nearby AI equipment and ammo. Objects must be in this layer to be filled with ammo."],
	["SESO Mission Framework"],
    "Ammo",
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		// Check if layer is exists
		if (count (getMissionLayerEntities _value) <= 0) exitWith {};
		private _entityLayerName = (getMissionLayerEntities _value) select 0;
		// Check if layer has entities
		if ((count _entityLayerName) == 0) exitWith {};

		// Add ammos in layer
		[_value] spawn {
			params ["_entityLayerName"];
			{
				[_x, (SESO_var_arsenals select 0)] call SESO_fnc_generateAmmo;

			}forEach ((getMissionLayerEntities _entityLayerName) select 0);
		};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_MedicalNotifierEnable",
    "CHECKBOX",
    ["Enable Medical Notifier", "Check to notify players when they are being treated by other players. Uncheck to remove this notification."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		private _MEDICAL_NOTIFIER_ID = [] call SESO_fnc_aceMedicalNotifier;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomColorCorrection",
    "EDITBOX",
    ["Custom Color Correction", "Set custom color correction for players. Default is vanilla color correction"],
	["SESO Mission Framework"],
    str [1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0.299, 0.587, 0.114, 0],[-1, -1, 0, 0, 0, 0, 0]],
    true, // _isGlobal
    {
        params ["_value"];
		if (_value == "[1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0.299, 0.587, 0.114, 0],[-1, -1, 0, 0, 0, 0, 0]]") exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        'ColorCorrections' ppEffectEnable true; 
        'ColorCorrections' ppEffectAdjust (parseSimpleArray _value); 
        'ColorCorrections' ppEffectCommit 0;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_WhistlingEnable",
    "CHECKBOX",
    ["Enable Whistling", "Check to add whistles to all players under ACE3 Self-Interact >> Equipment. Uncheck to remove it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[] call SESO_fnc_whistleInit;
    }
] call CBA_fnc_addSetting;

// BUG: Does not actually change swimming speed
[
    "SESO_setting_SwimSpeedMultiplier",
    "EDITBOX",
    ["Set Swimming Speed Multiplier", "Set multiplier for swimming faster. Set to 1 for vanilla speed."],
	["SESO Mission Framework"],
    "2.5",
    true, // _isGlobal
    {
        params ["_value"];
		_value = parseNumber _value;
		if (_value <= 1) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		private _SWIM_FASTER_ID = [] call SESO_fnc_swimFaster;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_GroupRespawnEnable",
    "CHECKBOX",
    ["Enable Respawn on Group", "Check to players allow players respawn on their group/team. Uncheck to leave it unchanged."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[group player, group player, groupId (group player)] call BIS_fnc_addRespawnPosition;
    }
] call CBA_fnc_addSetting;

// BUG: Cedric cant see the snow particles except inside buildings
[
    "SESO_setting_SnowEnable",
    "CHECKBOX",
    ["Enable Snow", "Check to enable visual snow effects. Uncheck to have no snow."],
	["SESO Mission Framework"],
    false,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
        // Global
        [] spawn {
            [] call SESO_fnc_snow;
        };
		
    }
] call CBA_fnc_addSetting;