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

_newloadoutName = ctrlText IDC_RSLO_RSLO_EDITBOX;

if (_newloadoutName == "Type Loadout Name Here" || _newloadoutName == "" ) exitWith {hint "You must enter a name for your loadout.";};

_varText = format ["RSLO_Lo_%1",_index + 1];

_loadout = _RSLO_namespace getVariable [_varText,[]];

_loadout set [0,_newloadoutName];

_RSLO_namespace setVariable [_varText,_loadout];

saveProfileNamespace;

_nul = [] execVM "scripts\rslo\gui_init.sqf";