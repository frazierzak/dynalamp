_boxType = "B_supplyCrate_F";  // the type of ammobox used.
_timer = 600;  // time in seconds until box is deleted

_magazines = []; _items = [];
 
// load available to standard players only.
if (!isNull player) then {
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
                ["SmokeShell",15],
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



if (isNil "truck_box") then {
    deleteVehicle truck_box;
    hint 'Unloading Ammobox...';
    sleep 10;
    truck_box = nil;
    truck_box = _boxType createVehicleLocal (getPos mhq);
    hint 'Ammobox Unloaded!';
    truck_box allowDamage false;
    truck_box addAction ["<t color='#74E868'>Save loadout</t>", "scripts\fnc_get_loadout.sqf", "", 0, false];
    truck_box addAction ["<t color='#ff0000'>Load loadout</t>", "scripts\fnc_set_loadout.sqf", "", 0, false];
    truck_box addAction ["<t color='#f91483'>Loadout Selector</t>","scripts\rslo\gui_start.sqf", "", 0, false];
    truck_box addAction ["<t color='#74E868'>Load Ammobox</t>","scripts\mhq\mhq_delete_box.sqf", "", 1, false];
} else {
    hint 'Ammobox Already Unloaded!';  
};


while {true} do {
         // empty it.
         clearMagazineCargo truck_box;
         clearWeaponCargo truck_box;
         clearItemCargo truck_box;
         clearBackpackCargo truck_box;
         
         // add in all items.
         {truck_box addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;

         // add in all magazines.
         {truck_box additemCargo [(_x select 0),(_x select 1)]} foreach _items;    

         // How long the box will stay before refilling.
         sleep _timer;
};