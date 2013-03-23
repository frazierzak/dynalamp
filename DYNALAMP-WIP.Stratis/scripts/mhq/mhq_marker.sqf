while {TRUE} do {
	if (alive mhq) then { 
		_mhqMark = createMarkerLocal ["mhq_mark", position vehicle mhq];
		"mhq_mark" setMarkerTypeLocal "o_hq";
		"mhq_mark" setMarkerPosLocal position vehicle mhq;

		if (((speed mhq)) == 0) then {
			"mhq_mark" setMarkerTextLocal "MHQ Deployed";
			"mhq_mark" setMarkerColorLocal "ColorBLUFOR";
			//"respawn_west" setMarkerPos position vehicle mhq;

		} else {
			"mhq_mark" setMarkerTextLocal "MHQ Moving";
			"mhq_mark" setMarkerColorLocal "ColorYellow";
			//"respawn_west" setMarkerPos markerPos "home_base";
		}

	} else {
		"mhq_mark" setMarkerTextLocal "MHQ Destroyed";
		"mhq_mark" setMarkerColorLocal "ColorRed";
		//"respawn_west" setMarkerPos markerPos "home_base";
		//hint 'MHQ Destroyed';
	};
	sleep 3;
};