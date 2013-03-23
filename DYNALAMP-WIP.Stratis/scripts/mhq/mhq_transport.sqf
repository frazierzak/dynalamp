_x = (random 10)+(random -10);
_y = (random 10)+(random -10);
_pos = getMarkerPos "mhq_mark";
_newpos = [(_pos select 0) - _x, (_pos select 1) - _y, _pos select 2];

if (alive mhq) then { 
	if ((speed mhq) == 0) then {
		cutText ["Teleporting to MHQ","BLACK OUT",5];
		sleep 5;
		cutText ["Arrived at MHQ","BLACK IN",1];
		player setPos _newpos;
	} else {
		hint 'MHQ is Moving, Wait for it to Stop';
	}
} else {
	hint 'MHQ is Destroyed';
};