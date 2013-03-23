///////////////////////////////////////////////////////////
/////////        RSLO 3.0          ////////////////////////
/////////        By: Riouken       ////////////////////////
/////////                          ////////////////////////
/// http://forums.bistudio.com/member.php?64032-Riouken  //
///////////////////////////////////////////////////////////


----------README-----------

RSLO 3.0 is a user configurable load out set of scripts that allows the user to save up to 10 loadouts and have them persist even after you shut down the game.
[Disclaimer] This addon writes to your profile var. file. Please make a back up before using. I am not responsible for any damage/errors/corruption that may occur. 
License - You may use this work in any Arma 3 mission/addon. But you must provide credit back to me. You may not use this work for any (for-profit) product. Any derivative must be non-profit based work.

------Installation--------
•	Place the [rslo] folder into your mission.
•	Copy these lines from the description.ext file into your description.ext file

#include <rslo\gui.hpp>

•	Place this line of text into your ammo box init field.

this addAction ["RSLO","rslo\gui_start.sqf"];


	
I have included my other projects in this release as well, My ammo box script as well as my Rio Gear Menu. 
For more information about these projects please see these links:

http://forums.bistudio.com/showthread.php?147892-Riouken-s-Gear-Menu-Alpha

http://forums.bistudio.com/showthread.php?147962-Working-MP-ammo-box-script



-------RSLO Use-------

Once you have your gear the way you would like open the rslo gui from the ammo box. Select and empty loadout from the list box. Then type a new name into the Loadout name box. Then hit save loadout.

Then you will be able to retrieve this loadout even after you leave the game and re-connect.

If you wish to delete a load out just select it from the box on the left and hit the delete loadout button.

If you wish to re-name a loadout select it from the left and type the new name into the text box and hit the re-name button.





----------Beta----------

This is a beta 1.0 version and as such there may be bugs. If you find one please make a post in the RSLO 3.0 thread on the BI forums.


My user profile on BI forums.
http://forums.bistudio.com/member.php?64032-Riouken

