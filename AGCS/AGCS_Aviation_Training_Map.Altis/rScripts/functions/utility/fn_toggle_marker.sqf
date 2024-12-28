#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function sets up actions for managing ground attacks.
 *
 * Summary:
 * This function sets up actions to manage ground attacks, such as spawning units and cleaning up after attacks.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_ga_placer
 *
 * Public: No
 * RW_T1
 */
params ["_PrefixOfMarker"];
//_PrefixOfMarker="RW_BRE_DOR_";
_Markers=[];
_LengthofMarker = count _PrefixOfMarker;

// Gets a list of all triggers named _PrefixOfMarker
{ 
    private _markerName = _x;
    private _markerName = [_markerName, 0, _LengthofMarker-1] call BIS_fnc_trimString;

    if (toUpper _markerName==_PrefixOfMarker) then 
    {
        _Markers pushBack _x;
    };   
} forEach allMapMarkers ; 
//Toggle Alpha
{
	if (markerAlpha _x==1) then {
		_x setMarkerAlpha 0;
	}
	else {
		_x setMarkerAlpha 1;
	}
} forEach _Markers;