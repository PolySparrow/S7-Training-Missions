/*
 * Author: SGT.Brostrom.A
 * This function applies abilities to a player based on unit loadout or classname
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Config <CONFIG>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, (missionConfigFile >> "CfgLoadouts" >> "Cav_B_B_Atlas_Medic_TeamLeader_F")] call cScripts_fnc_gear_applyAbilities
 *
 */

    params ["_plane", "_spawnMarker","_player","_respawnCooldown","_spawnDir",["_pylonLoadout",[]]];   
    if (NextTime<=time) then {
    private _planeClass = _plane;   
   

 
    _adjustment=time random 30720;
    _randomPos=[_spawnMarker select 0,_adjustment,500];

    
   
    private _plane = createVehicle [_planeClass, _randomPos, [], 0, "FLY"];  
  
    waitUntil {!isNull _plane};  
  
    _plane setDir _spawnDir;   
   
    _plane setVelocityModelSpace [0, 400, 0];   
   
        if (!isNull vehicle _player) then {  
        moveOut _player;  
        };  

    [_plane,"custom",_pylonLoadout] call cScripts_fnc_vehicle_applyLoadout;
    
    
    
    _player moveInDriver _plane;    
   
    _plane engineOn true;   
    _plane setFuel 1;   
    _plane flyInHeight 500; 
    
    NextTime=time+_respawnCooldown; 
    } else {
        _hintTime=NextTime-time;
        _stringThing = format ["Time Remaining in Seconds: %1", _hintTime]; 
        titleText [_stringThing,"PLAIN",0.3];
    };