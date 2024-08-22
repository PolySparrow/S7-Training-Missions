/*
 * Author: 7th Cav Dev Team, Sparrow
 * [Description of Function]
 *
 * Arguments:
 * [List of Arguements]
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_tightlz_startaction
 *
 * Public: No
 *
 */
// Define the helicopter's class name and starting position
_helicopterClass = "vtx_MH60M"; // Example: AH-99 Blackfoot
_flyHeight=150;
_spawnPosition1 = [23483.8,19045, _flyHeight]; // 150m above the player
_spawnPosition2=[25928.7,19239.9,_flyHeight];
// Spawn the helicopter
_helicopter1 = createVehicle [_helicopterClass, _spawnPosition1, [], 0, "FLY"];
_helicopter2 = createVehicle [_helicopterClass, _spawnPosition2, [], 0, "FLY"];
_helicopters = [_helicopter1,_helicopter2];
_helicrew1=createGroup west;
_helicrew2=createGroup west;


_pilot1 = _helicrew1 createUnit ["B_Helipilot_F",_helicopter1,[],0,"NONE"];
_pilot1 moveInDriver _helicopter1;

_pilot2 = _helicrew2 createUnit ["B_Helipilot_F",_helicopter2,[],0,"NONE"];
_pilot2 moveInDriver _helicopter2;

// Set AI pilot to prevent the helicopter from immediately landing

{
    _x flyInHeight _flyHeight; // Set flying height to 150m
	_x limitSpeed 120;
} forEach _helicopters;
