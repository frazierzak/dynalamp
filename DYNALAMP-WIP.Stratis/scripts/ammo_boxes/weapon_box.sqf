_marker = "weapon_box";  // marker used to spawn.
_boxType = "B_supplyCrate_F";  // the type of ammobox used.
_timer = 600;  // time in seconds until box is refilled.
 
if (_this != player) exitWith {};  // exit all other clients.
_weapons = []; _magazines = [];
 
// load available to standard players only.
if (!isNull player) then {
         _weapons =
         [
                ["srifle_EBR_F",1],
                ["LMG_Mk200_F",1],
                ["arifle_Khaybar_F",1],
                ["arifle_Khaybar_C_F",1],
                ["arifle_Khaybar_GL_F",1],
                ["arifle_MXC_F",1],
                ["arifle_MX_F",1],
                ["arifle_MX_GL_F",1],
                ["arifle_MX_SW_F",1],
                ["arifle_MXM_F",1],
                ["arifle_SDAR_F",1],
                ["arifle_TRG21_F",1],
                ["arifle_TRG20_F",1],
                ["arifle_TRG21_GL_F",1],
                ["launch_NLAW_F",1],
                ["launch_RPG32_F",1]
         ];
         _magazines =
         [
                ["30Rnd_556x45_Stanag",15],
                ["30Rnd_65x39_caseless_mag",15],
                ["30Rnd_65x39_caseless_green",15],
                ["200Rnd_65x39_cased_Box",15],
                ["100Rnd_65x39_caseless_mag",15],
                ["5Rnd_65x39_Mag",15],
                ["30Rnd_65x39_case_mag",15],
                ["20Rnd_762x45_Mag",15],
                ["16Rnd_9x21_Mag",15],
                ["20Rnd_556x45_UW_mag",15],
                ["NLAW_F",15],
                ["RPG32_F",15],
                ["RPG32_AA_F",15],
                ["1Rnd_HE_Grenade_shell",15],
                ["1Rnd_Smoke_Grenade_shell",15],
                ["HandGrenade",15],
                ["SmokeShell",15]
         ];
};

// create and fill the box.
_box = _boxType createVehicleLocal (getMarkerPos _marker);
_box allowDamage false;
_box addAction ["<t color='#74E868'>Save loadout</t>", "scripts\fnc_get_loadout.sqf", "", 0, false];
_box addAction ["<t color='#ff0000'>Load loadout</t>", "scripts\fnc_set_loadout.sqf", "", 0, false];
_box addAction ["<t color='#f91483'>Loadout Selector</t>","scripts\rslo\gui_start.sqf", "", 1, false];
 
while {true} do {
         // empty it.
         clearMagazineCargo _box;
         clearWeaponCargo _box;
         clearItemCargo _box;
         clearBackpackCargo _box;
         
         // add in all weapons.
         {_box addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;
        
         // add in all magazines.
         {_box addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;
        
         // wait x amount of seconds then refill box.
         sleep _timer;
};