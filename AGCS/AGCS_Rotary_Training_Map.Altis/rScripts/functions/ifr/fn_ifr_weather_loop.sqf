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
params [["_OvercastValue",1],["_FogPercentage",0.30]];

 //Sets the time to 3am, overcast to 1 and fog to 30% with 200m height along with breaking all the lights around LZ blind
while {!(triggerActivated IFR_FINISH)} do
{
	0 setOvercast _OvercastValue;  
	forceWeatherChange;
	0 setFog [_FogPercentage,.01,200]; 
	forceWeatherChange;
};

//skipTime ((3 - dayTime + 24) % 24); 