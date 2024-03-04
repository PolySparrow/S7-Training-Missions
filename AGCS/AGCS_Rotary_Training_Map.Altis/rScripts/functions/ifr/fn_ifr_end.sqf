#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function sets the time to noon, overcast to 0, and fog to 0. It also turns off all lights around a specific location.
 *
 * Arguments:
 * 0: thisTrigger
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_ifr_placer;
 *
 * Public: No
 */

//Sets the time to noon, overcast to 0 and fog to 0 along with fixing all the lights around LZ blind
setTimeMultiplier 1;  
_hourstoskip = ((12 - dayTime + 24) % 24); 
_hourstoskip remoteExec ["skipTime", 2, false];
[0.5,0]call rScripts_fnc_ifr_weather_loop;
[0.0,200]call rScripts_fnc_turnofflights;
_objectArray=nearestObjects [getPos IFR_FINISH,[ 
 "NVG_TargetC"
] ,10];
{
    //systemChat format["%1",_x];
    deleteVehicle _x;
}forEach _objectArray;


