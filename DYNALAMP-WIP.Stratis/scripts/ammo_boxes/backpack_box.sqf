_marker = "backpack_box";  // marker used to spawn.
_boxType = "B_supplyCrate_F";  // the type of ammobox used.
_timer = 600;  // time in seconds until box is refilled.
 
if (_this != player) exitWith {};  // exit all other clients.
_backpacks = [];
 
// load available to standard players only.
if (!isNull player) then {
                 _backpacks =
         [
                ["B_AssaultPack_khk", 1],
                ["B_AssaultPack_dgtl",1],
                ["B_AssaultPack_rgr",1],
                ["B_AssaultPack_sgg",1],
                ["B_AssaultPack_blk",1],
                ["B_AssaultPack_cbr",1],
                ["B_AssaultPack_mcamo",1],
                ["B_AssaultPack_ocamo",1],
                ["B_Kitbag_mcamo",1],
                ["B_Kitbag_sgg",1],
                ["B_Kitbag_cbr",1],
                ["B_FieldPack_blk",1],
                ["B_FieldPack_ocamo",1],
                ["B_FieldPack_cbr",1],
                ["B_Carryall_ocamo",1],
                ["B_Carryall_oucamo",1]
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
         
        // add in all backpacks.
        {_box addBackpackCargo [(_x select 0),(_x select 1)]} foreach _backpacks;

        // wait x amount of seconds then refill box.
        sleep _timer;
};