//Add the text actions and the scripts being activated to the player
if (!isNull player) then {
player addAction ["Teleport","scripts\MissionEditing\mapClickTeleport.sqf"]; //Action for Teleport
player addAction ["Hide","scripts\MissionEditing\hidePerson.sqf"]; //Action for Hiding
player addAction ["Reveal","scripts\MissionEditing\revealPerson.sqf"]; //Action for Reveal
player addAction ["Join East","scripts\MissionEditing\setCaptive.sqf"]; //Action for Captive On
player addAction ["Leave East","scripts\MissionEditing\captiveOff.sqf"]; //Action for Captive Off
};