if (!isServer) exitwith {}; // NOTE: in multiplayer, only server should create random numbers.
//hint 'CreateUnits is Working';
_marker = _this select 0;
_patrolMarker = _this select 1;
_unitsMin = _this select 2;
_unitsMax = _this select 3;
_vehOn = _this select 4;
_vehCount = _this select 5;

_unitsDif = 0;
_unitsDif = (_unitsMax - _unitsMin);
_unitsTotal = 0;
_unitsTotal = round ((random _unitsDif) + unitsMin);
//hint format["Units Total is %1", _unitsTotal];
//hint format["Vehicles are %1", _vehOn];
_counter = 0;
_vehCounter = 0;

while {_counter < _unitsTotal} do {
	"O_Soldier_F" createUnit [getMarkerPos _marker, newgroup, "nul =[this, _patrolMarker, ""random"",""nofollow"",""showmarker""] execvm ""scripts\ups.sqf"""];
	if (_vehOn == 1) then {
		while {_vehCount > _vehCounter} do {

			_dist = random 45;// this chooses a random distance from 0-45
			_dir = random 360;// this selects a random direction from 360 degrees rotation
			_pos = getMarkerPos _marker;
			_positions = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];
			_vehGroup = createGroup east;
			_veh = "O_Galkin_MG_F" createVehicle (_positions);
			_vehDriver = _vehGroup createUnit ["O_Soldier_F", _positions, [], 0, "FORM"];
			_vehGunner = _vehGroup createUnit ["O_Soldier_F", _positions, [], 0, "FORM"];
			_vehDriver assignAsDriver _veh;
			_vehDriver moveInDriver _veh;
			_vehGunner assignAsGunner _veh;
			_vehGunner moveInGunner _veh;
			_veh = nil;
			_vehDriver = nil;
			_vehGunner = nil;
			_vehCounter = _vehCounter + 1;
		};
	};
	_counter = _counter + 1;
};