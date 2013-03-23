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

_RSLO_namespace = profileNamespace;
_index = lbCurSel IDC_RSLO_RSLO_LISTBOX;

_varText = format ["RSLO_Lo_%1",_index + 1];

_loadoutName = ctrlText IDC_RSLO_RSLO_EDITBOX;

if (_newloadoutName == "Type Loadout Name Here" || _newloadoutName == "" ) exitWith {hint "You must enter a name for your loadout.";};
//_loadout = rslo_loadouts select _index;

_rslo_ammo = (magazines player);
_rslo_weapons = (weapons player);
_rslo_weapons = _rslo_weapons +["Throw","Put"];
_rslo_items = (items player);
_rslo_asgnItems = (assignedItems player);	
_rslo_headgear = (headgear player);	
_rslo_goggles = (Goggles player);
_rslo_vest = (vest player);
_rslo_vestitems = (vestItems player);
_rslo_uniform = (uniform player);
_rslo_uniformitems = (uniformItems player);	


_rslo_backpack = (backpack player);
_rslo_packitems = (backpackItems player);

_rslo_handgunitems = (handgunItems player);

_rslo_pgunitems = (primaryWeaponItems player);

_rslo_sgunitems = (secondaryWeaponItems player);


_RSLO_namespace setVariable [_varText,[_loadoutName, _rslo_ammo, _rslo_weapons, _rslo_items, _rslo_asgnItems, _rslo_headgear, _rslo_goggles, _rslo_vest, _rslo_vestitems, _rslo_uniform, _rslo_uniformitems, _rslo_backpack, _rslo_packitems, _rslo_handgunitems, _rslo_pgunitems, _rslo_sgunitems]];

saveProfileNamespace;

_nul = [] execVM "scripts\rslo\gui_init.sqf";
