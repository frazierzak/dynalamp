///////////////////////////////////////////////////////////
/////////        RSLO 3.0          ////////////////////////
/////////        By: Riouken       ////////////////////////
/////////                          ////////////////////////
/// http://forums.bistudio.com/member.php?64032-Riouken  //
///////////////////////////////////////////////////////////


#define IDC_RSLO_RSLO_HEADER		1200
#define IDC_RSLO_RSLO_EDITBOX	1400
#define IDC_RSLO_RSLO_LISTBOX	1500
#define IDC_RSLO_RSLO_USELO		1700
#define IDC_RSLO_RSLO_SAVELO		1701
#define IDC_RSLO_RSLO_RENAMELO	1702
#define IDC_RSLO_RSLO_DELETELO	1703
#define IDC_RSLO_RSLO_CANCEL		1704
#define IDC_RSLO_RSLO_FRAMETXTBOX	1800
#define IDC_RSLO_RSLO_BACKGROUND	2200

if (!(local player)) exitwith {};

_RSLO_namespace = profileNamespace;

_index = lbCurSel IDC_RSLO_RSLO_LISTBOX;

_varText = format ["RSLO_Lo_%1",_index + 1];

_loadout = _RSLO_namespace getVariable [_varText,[]];

if ((count _loadout) == 0) exitWith {hint "Something went wrong and RSLO cound not retrive your loadout.";};

_rslo_ammo = _loadout select 1;
_rslo_weapons = _loadout select 2;
_rslo_items = _loadout select 3;
_rslo_asgnItems = _loadout select 4;
_rslo_headgear = _loadout select 5;
_rslo_goggles = _loadout select 6;
_rslo_vest = _loadout select 7;
_rslo_vestitems = _loadout select 8;
_rslo_uniform = _loadout select 9;
_rslo_uniformitems = _loadout select 10;
_rslo_backpack = _loadout select 11;
_rslo_packitems = _loadout select 12;
_rslo_handgunitems = _loadout select 13;
_rslo_pgunitems = _loadout select 14;
_rslo_sgunitems = _loadout select 15;

removeAllWeapons player;
removeAllAssignedItems player;
removeAllItems player;
removebackpack player;

if (!( _rslo_uniform == "")) then 
{ 
	removeUniform player;
	player addUniform _rslo_uniform;
};



if (!(_rslo_vest == "")) then 
{ 
	removeVest player;
	player AddVest _rslo_vest;
};



if (!(_rslo_backpack == "")) then 
{ 

	player addbackpack _rslo_backpack;
	//clearAllItemsFromBackpack player;
	//clearMagazineCargoGlobal (unitBackpack player);
	//clearWeaponCargoGlobal (unitBackpack player);
};


if (!(_rslo_headgear == "")) then 
{ 
	removeheadgear player;
	player addheadgear _rslo_headgear;
	player assignItem _rslo_headgear;
};



if (!(_rslo_goggles == "")) then 
{ 
	removeGoggles player;
	player addGoggles _rslo_goggles;
	player assignItem _rslo_goggles;
};



{player addmagazine _x} forEach _rslo_ammo;
{player additem _x} forEach _rslo_items;
{player additem _x; player assignItem _x} forEach _rslo_asgnItems;
{player addweapon _x} forEach _rslo_weapons;


if ((count _rslo_sgunitems)>0) then 
{ 
//	{player removeItemFromSecondaryWeapon _x} forEach (secondaryWeaponItems player);
	{player addSecondaryWeaponItem _x} forEach _rslo_sgunitems;
};



if ((count _rslo_handgunitems)>0) then 
{ 
//	{player removeItemFromHandgun _x} forEach (handgunItems player);
	{player addHandgunItem _x} forEach _rslo_handgunitems;
};



if ((count _rslo_pgunitems)>0) then 
{ 
	//{player removeItemFromPrimaryWeapon _x} forEach (primaryWeaponItems player);
	{player addPrimaryWeaponItem _x} forEach _rslo_pgunitems;
};



// Muzzle Fix

firstmuz = {
   private "_ma";
   _ma = getArray (configFile >> "CfgWeapons" >> _this >> "muzzles");
   if (_ma select 0 != "this") exitWith {_ma select 0};
   _this
};

_primary = primaryWeapon player;
if (_primary != "") then
{
   player selectWeapon (_primary call firstmuz);

};



