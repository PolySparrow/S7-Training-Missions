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
 params [["_Location"],["_numOfFireTeams"],["_radius",500]];
_opforUnits = allUnits select {side _x == east && !(_x isKindOf "AllVehicles")}; // Exclude vehicles
_pos = getPos _Location
_trg = createTrigger ["EmptyDetector",_pos];
_trg setTriggerArea [_radius,_radius,0,true,500];
_trg setTriggerActivation["ANYPLAYER","PRESENT",true];
_trgCondition= 'this && (thisList select 0) isKindOf "Air"'
for 
//_trgActivation=format['
_Location=getPos thisTrigger; 
_HeliArray=vehicles select { _x isKindOf "Air" } inAreaArray thisTrigger; 
_Heli=_HeliArray select 0; 
_radius=%2; 


_teamsize=4; 
_j=0;
while {_j<_numOfFireTeams} do {
	_i=0;
	_grp = createGroup east; 
	while {_i<_teamsize} do { 
 
 		_opforclass=selectRandom _opforUnits; 
 		_spawnPos = [thisTrigger, 150, 200] call BIS_fnc_findSafePos;  
 		_opfor=_grp createUnit [_opforclass,_spawnPos,[],0,"NONE"]; 
 		_opfor enableSimulation true; 
		[_grp,_spawnPos,75] call BIS_fnc_taskPatrol;
 		_i=_i+1;  
	};
	_j=_j+1;
};//',_CivArray,_radius]
;
_trgDeactivation='deleteVehicle thisTrigger;'
_trg setTriggerStatements [_trgCondition,_trgActivation,_trgDeactivation];