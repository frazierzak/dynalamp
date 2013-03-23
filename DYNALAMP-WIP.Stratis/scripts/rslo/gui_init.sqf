///////////////////////////////////////////////////////////
/////////        RSLO 3.0          ////////////////////////
/////////        By: Riouken       ////////////////////////
/////////                          ////////////////////////
/// http://forums.bistudio.com/member.php?64032-Riouken  //
///////////////////////////////////////////////////////////


if (! local player) exitWith {hint "Not Local to Script";};
#define IDC_RSLO_RSLO_NAME		1000
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

RSLO_Lo_1 = _RSLO_namespace getVariable ["RSLO_Lo_1",[]];
if ((count RSLO_Lo_1) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_1",["Empty Loadout 1"]];RSLO_Lo_1 = _RSLO_namespace getVariable ["RSLO_Lo_1",[]]; };

RSLO_Lo_2 = _RSLO_namespace getVariable ["RSLO_Lo_2",[]];
if ((count RSLO_Lo_2) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_2",["Empty Loadout 2"]];RSLO_Lo_2 = _RSLO_namespace getVariable ["RSLO_Lo_2",[]]; };

RSLO_Lo_3 = _RSLO_namespace getVariable ["RSLO_Lo_3",[]];
if ((count RSLO_Lo_3) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_3",["Empty Loadout 3"]];RSLO_Lo_3 = _RSLO_namespace getVariable ["RSLO_Lo_3",[]]; };

RSLO_Lo_4 = _RSLO_namespace getVariable ["RSLO_Lo_4",[]];
if ((count RSLO_Lo_4) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_4",["Empty Loadout 4"]];RSLO_Lo_4 = _RSLO_namespace getVariable ["RSLO_Lo_4",[]]; };

RSLO_Lo_5 = _RSLO_namespace getVariable ["RSLO_Lo_5",[]];
if ((count RSLO_Lo_5) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_5",["Empty Loadout 5"]];RSLO_Lo_5 = _RSLO_namespace getVariable ["RSLO_Lo_5",[]]; };

RSLO_Lo_6 = _RSLO_namespace getVariable ["RSLO_Lo_6",[]];
if ((count RSLO_Lo_6) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_6",["Empty Loadout 6"]];RSLO_Lo_6 = _RSLO_namespace getVariable ["RSLO_Lo_6",[]]; };
 
RSLO_Lo_7 = _RSLO_namespace getVariable ["RSLO_Lo_7",[]];
if ((count RSLO_Lo_7) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_7",["Empty Loadout 7"]];RSLO_Lo_7 = _RSLO_namespace getVariable ["RSLO_Lo_7",[]]; };

RSLO_Lo_8 = _RSLO_namespace getVariable ["RSLO_Lo_8",[]];
if ((count RSLO_Lo_8) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_8",["Empty Loadout 8"]];RSLO_Lo_8 = _RSLO_namespace getVariable ["RSLO_Lo_8",[]]; };

RSLO_Lo_9 = _RSLO_namespace getVariable ["RSLO_Lo_9",[]];
if ((count RSLO_Lo_9) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_9",["Empty Loadout 9"]];RSLO_Lo_9 = _RSLO_namespace getVariable ["RSLO_Lo_9",[]]; };

RSLO_Lo_10 = _RSLO_namespace getVariable ["RSLO_Lo_10",[]];
if ((count RSLO_Lo_10) == 0) then {_RSLO_namespace setVariable ["RSLO_Lo_10",["Empty Loadout 10"]];RSLO_Lo_10 = _RSLO_namespace getVariable ["RSLO_Lo_10",[]]; };


lbClear IDC_RSLO_RSLO_LISTBOX;
rslo_loadouts = [RSLO_Lo_1,RSLO_Lo_2,RSLO_Lo_3,RSLO_Lo_4,RSLO_Lo_5,RSLO_Lo_6,RSLO_Lo_7,RSLO_Lo_8,RSLO_Lo_9,RSLO_Lo_10];

{
    _nul = lbAdd[IDC_RSLO_RSLO_LISTBOX,(_x select 0)];

} forEach rslo_loadouts;



