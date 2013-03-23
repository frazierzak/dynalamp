_mhqAdd1 = 0;
_mhqAdd2 = mhq addAction ["<t color='#74E868'>Load Ammobox</t>","scripts\mhq\mhq_delete_box.sqf", "", 0, false];;
_mhqAdd3 = 0;

while {true} do {
	if (alive mhq && ((speed mhq)) == 0) then {
		_mhqAdd1 = mhq addAction ["<t color='#74E868'>Unload Ammobox</t>", "scripts\mhq\mhq_drop_ammo.sqf", "", 0, false]; 
		_mhqAdd3 = mhq addAction ["<t color='#74E868'>Teleport to Base</t>","scripts\mhq\mhq_tobase.sqf", "", 0, false];
		waitUntil {!alive mhq || ((speed mhq)) != 0};
	} else {
		mhq removeAction _mhqAdd1;
		mhq removeAction _mhqAdd3;
		waitUntil {alive mhq && ((speed mhq)) == 0};
	};
	
};