enableSaving [false, false];

waitUntil { !isNull player }; // Wait for player to initialize

sleep 1;

//Ammo Box Scripts
_null = player execVM "scripts\ammo_boxes\weapon_box.sqf";
_null = player execVM "scripts\ammo_boxes\backpack_box.sqf";
_null = player execVM "scripts\ammo_boxes\item_box.sqf";

//MHQ Scripts
_null = player execVM "scripts\mhq\mhq_marker.sqf";

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'scripts\fnc_get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'scripts\fnc_set_loadout.sqf';

//Changeroom Script
call compile preprocessFileLineNumbers "dsl_gear_get_lists.sqf";

//Mission Maker Teleport Function
// use // to comment out [] execVM "MissionEditing\missionEditing.sqf"; to deactive the use of the hide/unhide features and teleport before releasing the map.
[] execVM "scripts\MissionEditing\missionEditing.sqf";

//TPWCAS AI Suppression
null = [3] execvm "scripts\tpwcas\tpwcas_script_init.sqf";

// Save default loadout
loadout = [player] call getLoadout;
                                                     
// Load saved loadout on respawn
player addEventHandler ["Respawn", {
    [player,loadout] spawn setLoadout;
  }
];

//Create Tasks
//[(paramsarray select 2),(paramsArray select 3), (paramsArray select 4), (paramsArray select 5), (paramsArray select 6),(paramsArray select 7),(paramsArray select 8)] execVM "scripts\tasks\tasks.sqf";

[] execVM "scripts\tasks\tasks.sqf";

//Clean Dead Body Script
[] execVM "scripts\clearCorpses.sqf";