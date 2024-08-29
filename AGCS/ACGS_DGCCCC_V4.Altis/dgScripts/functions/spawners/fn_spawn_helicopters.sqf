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
_spawnPosition1 = [23514.7,18072.5, _flyHeight]; // 150m above the player
_spawnPosition2=[25844.6,20301.6,_flyHeight];
_spawnPosition3=[22703.7,18402.1,_flyHeight];
_spawnPosition4=[22859.8,18518.1,_flyHeight];
// Spawn the helicopter
_helicopter1 = createVehicle [_helicopterClass, _spawnPosition1, [], 0, "FLY"];
_helicopter2 = createVehicle [_helicopterClass, _spawnPosition2, [], 0, "FLY"];
_helicopter3 = createVehicle [_helicopterClass, _spawnPosition3, [], 0, "FLY"];
_helicopter4 = createVehicle [_helicopterClass, _spawnPosition4, [], 0, "FLY"];
_helicopters = [_helicopter1,_helicopter2];
_helicopters2 = [_helicopter3,_helicopter4];

_helicrew1=createGroup resistance;
_helicrew2=createGroup resistance;
_helicrew3=createGroup resistance;
_helicrew4=createGroup resistance;

_pilot1 = _helicrew1 createUnit ["I_helipilot_F",_helicopter1,[],0,"NONE"];
_pilot1 moveInAny _helicopter1;

_copilot1 = _helicrew1 createUnit ["I_helipilot_F",_helicopter1,[],0,"NONE"];
_copilot1 moveInAny _helicopter1;

_pilot2 = _helicrew2 createUnit ["I_helipilot_F",_helicopter2,[],0,"NONE"];
_pilot2 moveInAny _helicopter2;

_copilot2 = _helicrew2 createUnit ["I_helipilot_F",_helicopter2,[],0,"NONE"];
_copilot2 moveInAny _helicopter2;

_pilot3 = _helicrew3 createUnit ["I_helipilot_F",_helicopter3,[],0,"NONE"];
_pilot3 moveInAny _helicopter3;

_copilot3 = _helicrew3 createUnit ["I_helipilot_F",_helicopter3,[],0,"NONE"];
_copilot3 moveInAny _helicopter3;

_pilot4 = _helicrew4 createUnit ["I_helipilot_F",_helicopter4,[],0,"NONE"];
_pilot4 moveInAny _helicopter4;


_copilot4 = _helicrew4 createUnit ["I_helipilot_F",_helicopter4,[],0,"NONE"];
_copilot4 moveInAny _helicopter4;

// Set AI pilot to prevent the helicopter from immediately landing
	_helicopter3 setDir 54.430;
	_helicopter4 setDir 54.430;
{
    _x flyInHeight _flyHeight; // Set flying height to 150m
	_x limitSpeed 120;
} forEach _helicopters;

{
	_x flyInHeight _flyHeight; // Set flying height to 150m
	_x limitSpeed 0;
}forEach _helicopters2;
