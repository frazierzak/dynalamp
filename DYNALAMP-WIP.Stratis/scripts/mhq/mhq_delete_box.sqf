if (!isNil "truck_box") then {
	hint 'Loading Ammobox into Truck...';
	sleep 5;
	deleteVehicle truck_box;
	truck_box = nil;
	hint 'Ammobox Loaded!';
	} else {
	hint 'Ammobox Already Loaded';
};