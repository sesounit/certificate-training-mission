/*
* Author: Dildo Sagbag
*
* Description:
* Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items
*
* Arguments:
* 0: Array of classes of items to add to the arsenal <ARRAY>
*
* Return Value:
* None
*
*
* Public: Yes
*/

#include "..\script_component.hpp"

#define PLAYER_UNITS_ITEMS []
params ["_entityLayerName",["_allPlayerUnitsItems",[]]];

if !(isServer) exitWith {};

//systemChat str _allPlayerUnitsItems;

//private _allPlayerUnitsItems = PLAYER_UNITS_ITEMS;

// Get list of Arsenals
SESO_var_arsenals = (getMissionLayerEntities _entityLayerName) select 0;
publicVariable "SESO_var_arsenals";

// Add optionalItems to arsenals
{
	nul = [_x,_allPlayerUnitsItems] spawn {
		params ["_selectedArsenal","_allPlayerUnitsItems"];

		// Check to make sure arsenal has items in it before adding new items. Or wait 200 seconds.
		//waitUntil { sleep 1; (count ([_selectedArsenal] call ace_arsenal_fnc_getVirtualItems)  > 1 ) or (time > 200)};

		// Determine

		// If arsenal is not initialized,
		if (count ([_selectedArsenal] call ace_arsenal_fnc_getVirtualItems) > 0) then {
			[_selectedArsenal,_allPlayerUnitsItems, true] call ace_arsenal_fnc_addVirtualItems;
		} else {
			[_selectedArsenal,_allPlayerUnitsItems, true] call ace_arsenal_fnc_initBox;
		};

		[
			_selectedArsenal,
			[
			"<img size='2' image='src\img\icon_arsenal_ca.paa' />Arsenal",	// title
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller] call ace_arsenal_fnc_openBox;
			},
			nil,		// arguments
			9999,		// priority
			true,		// showWindow
			false,		// hideOnUse
			"",			// shortcut
			"true",		// condition
			4,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
			]
		] remoteExec ["addAction", 0, _selectedArsenal];
	};
}forEach SESO_var_arsenals;

// Define Diwako's Unknown Weapon Punish whitelist
private _first_SESO_var_arsenal = keys ([SESO_var_arsenals select 0] call ace_arsenal_fnc_getVirtualItems);
systemChat (str first_SESO_var_arsenal);
diwako_unknownwp_local_weapons = [];
{
    diwako_unknownwp_local_weapons pushBackUnique (toUpper _x);
}forEach (_allPlayerUnitsItems + PLAYER_UNITS_ITEMS + (flatten _first_SESO_var_arsenal));

[diwako_unknownwp_local_weapons] remoteExec ["SESO_fnc_addAllowedWeapons", 2, false];

[] remoteExecCall ["SESO_fnc_initArsenalPlayer",0,true];