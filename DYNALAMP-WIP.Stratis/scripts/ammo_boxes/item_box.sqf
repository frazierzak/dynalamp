_marker = "item_box";  // marker used to spawn.
_boxType = "B_supplyCrate_F";  // the type of ammobox used.
_timer = 600;  // time in seconds until box is refilled.
 
if (_this != player) exitWith {};  // exit all other clients.
_magazines = []; _items = [];
 
// load available to standard players only.
if (!isNull player) then {

        _magazines =
        [
                
                ["APERSMine_Range_Mag",15],
                ["APERSBoundingMine_Range_Mag",15],
                ["SLAMDirectionalMine_Wire_Mag",15],
                ["APERSTripMine_Wire_Mag",15],
                ["ClaymoreDirectionalMine_Remote_Mag",15],
                ["SatchelCharge_Remote_Mag",15],
                ["DemoCharge_Remote_Mag",15]
        ];
        _items =
        [
                ["FirstAidKit",15],
                ["Medikit",15],
                ["ToolKit",15],
                ["optic_Arco",15],
                ["optic_Aco",15],
                ["optic_Hamr",15],
                ["optic_Holosight",15],
                ["acc_flashlight",15],
                ["acc_pointer_IR",15],
                ["muzzle_snds_H",15],
                ["muzzle_snds_L",15],
                ["muzzle_snds_B",15],
                ["muzzle_snds_H_MG",15],
                ["Binocular",15],
                ["ItemWatch",15],
                ["ItemCompass",15],
                ["ItemRadio",15],
                ["ItemGPS",15],
                ["NVGoggles",15],
                ["ItemMap",15]
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

         // add in all magazines.
         {_box additemCargo [(_x select 0),(_x select 1)]} foreach _items;

         // add in all items.
         {_box addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;
        
         // wait x amount of seconds then refill box.
         sleep _timer;
};