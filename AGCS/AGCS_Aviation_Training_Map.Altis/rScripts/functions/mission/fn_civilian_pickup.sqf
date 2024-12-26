#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the spawning of units or groups at a specified location, with optional patrolling behavior.
 *
 * Arguments:
 * 0: _Location Position where the unit or group should be spawned
 * 1: _SpawnObject Object or group of objects to spawn
 * 2: _DoPatrol Boolean indicating whether the spawned unit or group should patrol
 * 
 * Return Value:
 * Nothing
 *
 * Example:
 * [TestTrg, 2,false] call rScripts_fnc_ga_spawnunit;
 *
 * Public: No
 */
 params [["_Location"],["_radius"]];
_opforUnits = allUnits select {side _x == east && !(_x isKindOf "AllVehicles")}; // Exclude vehicles
_pos = getPos _Location
_trg = createTrigger ["EmptyDetector",_pos];
_trg setTriggerArea [500,500,0,true,500];

_trgCondition= 'this && (thisList select 0) isKindOf "Air"'
_trgActivation=format['
_Location=getPos thisTrigger; 
_HeliArray=vehicles select { _x isKindOf "Air" } inAreaArray thisTrigger; 
_Heli=_HeliArray select 0; 
_radius=%2; 
_allHelipads = nearestObjects [_Location, ["Land_HelipadEmpty_F", "HeliHEmpty"], _radius]; 
_CivArray=%1; 
 
_crewCapacity = _Heli emptyPositions "Cargo"; 
_i=0; 
_grp = createGroup civilian; 
_HeliPOS = getPosASL _Heli;  
_waypoint=_grp addWaypoint [_HeliPOS, -1]; 
_waypoint setWaypointType "GETIN"; 
if (count _allHelipads ==0) then {_crewCapacity=0} 
else { 
while {_i<_crewCapacity} do { 
 
 	_civclass=selectRandom _CivArray; 
 	_spawnpick=selectRandom _allHelipads; 
 	_spawnPos = getPos _spawnpick;  
 	_civilian=_grp createUnit [_civclass,_spawnPos,[],0,"NONE"]; 
 	_civilian enableSimulation true; 
 	_civilian assignAsCargo _Heli; 
 	[_civilian] orderGetIn true; 
 	_i=_i+1;  
};};',_CivArray,_radius];
_trgDeactivation='deleteVehicle thisTrigger;'
_trg setTriggerStatements [_trgCondition,_trgActivation,_trgDeactivation];