//if (!isServer) exitwith {}; // NOTE: in multiplayer, only server should create random numbers.
timeSkip = (paramsArray select 0); // True or False for timeSkip
tasksToComplete = (paramsArray select 1); // Set amount of Tasks to Complete to win mission here
unitsMin = (paramsArray select 2); // Set min amount of units here
unitsMax = (paramsArray select 3); // Set max amount of units here
unitsLeft = (paramsArray select 4); // Units that can be left at objective before being considered completed

vehOn = (paramsArray select 5); // True or False for Enemy Vehicles
vehCount = (paramsArray select 6); // How many vehicles you'd like at each objective
//hint format['timeSkip is %1,tasksToComplete is %2, unitsMin is %3, unitsMax is %4, unitsLeft is %5, vehOn is %6, vehCount is %7',timeSkip, tasksToComplete, unitsMin, unitsMax,unitsLeft, vehOn, vehCount];
//sleep 20;
SideHQ = createCenter east;

taskscompletedcount = 0; 

firstmark = false;
secondmark = false;
thirdmark = false;
fourthmark = false;
fifthmark = false;
sixthmark = false;
sevenththmark = false;

locationPicked = false;
taskNumber = 1;
firsttask = false;

m1 = 0;
timeSkipped= 0;

// Pick Location ///////////////////////////////////////////////////////////////////////
while {taskscompletedcount < tasksToComplete} do {
if (isServer) then {
  //n1 = round ((random tasksToComplete) + 0.5); // generates random number
  if (timeSkip == 1) then {
    timeSkipped = round ((random 6) + 6);// generates random number from 6-12
    publicVariable "timeSkipped";
  };
};

hint format['timeSkipped is %1', timeSkipped];



if (!firsttask) then
{
    firsttask = true;
    newgroup = createGroup east;
    newTask = player createSimpleTask [format ["Assault Units %1", taskNumber]];
    skipTime (timeSkipped);
    while {!locationPicked} do {
		  if (isServer) then {
        m1 = round ((random 6) + 1);
        publicVariable "m1";
      };
   		if (m1 == 1 && !firstmark) then {
   			locationPicked = true;
        publicVariable "locationPicked";
   			newTask setSimpleTaskDestination (getMarkerPos "m1");
        publicVariable "newTask";   			
   			createUnits = ["m1","airfield", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";
        sleep 5;
   			firstmark = true;
   			secondmark = false;
        thirdmark = false;
        fourthmark = false;
        fifthmark = false;
        sixthmark = false;
        sevenththmark = false;
   		};
   		if (m1 == 2 && !secondmark) then {  
   			locationPicked = true; 			
        publicVariable "locationPicked";
   			newTask setSimpleTaskDestination (getMarkerPos "m2");   	
        publicVariable "newTask";		
   			createUnits = ["m2","agia", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";
        sleep 5;
   			firstmark = false;
   			secondmark = true;
			  thirdmark = false;
		  	fourthmark = false;
        fifthmark = false;
        sixthmark = false;
        sevenththmark = false;
   		};
   		if (m1 == 3 && !thirdmark) then {
   			locationPicked = true;			
        publicVariable "locationPicked";
   			newTask setSimpleTaskDestination (getMarkerPos "m3");	
        publicVariable "newTask";	
   			createUnits = ["m3","kamino", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";   	
        sleep 5;
   			firstmark = false;
		  	secondmark = false;
		    thirdmark = true;
		    fourthmark = false;
        fifthmark = false;
        sixthmark = false;
        sevenththmark = false;
   		};
   		if (m1 == 4 && !fourthmark) then {
   			locationPicked = true;
        publicVariable "locationPicked";
   			newTask setSimpleTaskDestination (getMarkerPos "m4");	
        publicVariable "newTask";
   			createUnits = ["m4","mike26", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";
        sleep 5;
   			firstmark = false;
			  secondmark = false;
			  thirdmark = false;
        fourthmark = true;
        fifthmark = false;
        sixthmark = false;
        sevenththmark = false;
   		};
      if (m1 == 5 && !fifthmark) then {
        locationPicked = true;
        publicVariable "locationPicked";
        newTask setSimpleTaskDestination (getMarkerPos "m5");  
        publicVariable "newTask";
        createUnits = ["m5","maxwell", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";
        sleep 5;
        firstmark = false;
        secondmark = false;
        thirdmark = false;
        fourthmark = false;
        fifthmark = true;
        sixthmark = false;
        sevenththmark = false;
      };
      if (m1 == 6 && !sixthmark) then {
        locationPicked = true;
        publicVariable "locationPicked";
        newTask setSimpleTaskDestination (getMarkerPos "m6");  
        publicVariable "newTask";
        createUnits = ["m6","tempest", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";
        sleep 5;
        firstmark = false;
        secondmark = false;
        thirdmark = false;
        fourthmark = false;
        fifthmark = false;
        sixthmark = true;
        sevenththmark = false;
      };
      if (m1 == 7 && !seventhmark) then {
        locationPicked = true;
        publicVariable "locationPicked";
        newTask setSimpleTaskDestination (getMarkerPos "m7");  
        publicVariable "newTask";
        createUnits = ["m7","girna", unitsMin, unitsMax, vehOn, vehCount] execVM "scripts\tasks\createUnits.sqf";
        sleep 5;
        firstmark = false;
        secondmark = false;
        thirdmark = false;
        fourthmark = false;
        fifthmark = false;
        sixthmark = false;
        sevenththmark = true;
      };
    };
        locationPicked = false;
        publicVariable "locationPicked";
        newTask setTaskState "Assigned";
        publicVariable "newTask";
        player setCurrentTask newTask;
        waitUntil {({alive _x} count units newgroup) == 0 || ({alive _x} count units newgroup) <= unitsLeft};
        deleteGroup newgroup;
        newTask setTaskState "Succeeded";
        publicVariable "newTask";
        hint format["Objective %1 Complete",taskNumber];
        taskNumber = taskNumber + 1;
        publicVariable "taskNumber";
        taskscompletedcount = taskscompletedcount + 1;
        publicVariable "taskscompletedcount";
        firsttask = false;
        publicVariable "firsttask";
        sleep 5;
    
  };
};

hint "All done";