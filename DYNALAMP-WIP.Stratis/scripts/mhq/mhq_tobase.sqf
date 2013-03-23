_x = (random 10)+(random -10);
_y = (random 10)+(random -10);
_pos = getMarkerPos "respawn_west";
_newpos = [(_pos select 0) - _x, (_pos select 1) - _y, _pos select 2];

if (alive mhq) then {
	if (((speed mhq) == 0)) then {
		cutText ["Teleporting to Base","BLACK OUT",5];
		sleep 5;
		cutText ["","BLACK IN",1];
		player setPos _newpos;
	} else {
		hint 'MHQ is moving, please wait for it to stop';
	}
} else {
	hint 'MHQ';
}