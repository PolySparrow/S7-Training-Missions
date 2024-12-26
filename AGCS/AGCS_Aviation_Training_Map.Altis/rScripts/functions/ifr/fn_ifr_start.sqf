#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles when you select an option from the table how it behaves
 *
 * Arguments:
 * 
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_ifr_start;
 *
 * Public: No
 *
 */

 //Sets the time to 3am, overcast to 1 and fog to 30% with 200m height along with breaking all the lights around LZ blind
setTimeMultiplier 0.1;  

"NVG_TargetC" createVehicle ([17542.5,13240.2,0]);  
"NVG_TargetC" createVehicle ([17550.3,13248.3,5.72205e-006]);  
"NVG_TargetC" createVehicle ([17558.4,13240.6,0]);  
"NVG_TargetC" createVehicle ([17550.7,13232.5,0]); 
_hourstoskip=((3 - dayTime + 24) % 24);
_hourstoskip remoteExec ["skipTime", 2, false];

[0.95,200]call rScripts_fnc_turnofflights;
[1,0.30]call rScripts_fnc_ifr_weather_loop;
