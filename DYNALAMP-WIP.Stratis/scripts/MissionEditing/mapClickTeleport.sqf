//Force the map 
openMap true;

//Display text that the teleport action has been activated
titleText["Teleport Activated, click where you want to go!","PLAIN"];

//Whereever you click on the map you will be teleported
onMapSingleClick "player setPos _pos";
