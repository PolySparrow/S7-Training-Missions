#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles placement of smoke for different tasks
 *
 * Arguments:
 * 0: Location <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [_Vic_Array] call rScripts_fnc_vic_display
 *
 * Public: No
 */
/* _VIC_Array=[["UK3CB_AAF_O_2S6M_Tunguska","Tunguska","Radar Guided Gun with Radar Guided Missiles. Radar Range is about 8km"] 
,["UK3CB_AAF_O_MTLB_ZU23","MTLB with ZU-23","MTLB with a ZU-23 Turret on top. Effective Range is 1.5km"] 
,["UK3CB_AAF_O_ZsuTank","Shilka","Radar Guided Gun with Quad 23mm barrels. Uses a shotgun like spread to hit targets. Radar Range is about 2km"]
,["UK3CB_AAF_O_Igla_AA_pod","Djigit (Igla Turret)","Turret that uses the igla launcher to lock onto the IR signature of aircraft. Range is about 2km" ]
,["UK3CB_AAF_O_ZU23","ZU-23 Turret","23mm anti-aircraft gun with twin barrels. This has been taken and slapped on every manner of vehicle"]
,["UK3CB_CHD_O_Fishing_Boat_Zu23_front","Fishing Boat with ZU-23","Fishing boat with a ZU-23 Turret on top. Effective Range is 1.5km" ]
,["UK3CB_ADA_O_Pickup_ZU23","Pickup with ZU-23","Pickup with a ZU-23 Turret on top. Effective Range is 1.5km" ]
,["PRACS_SLA_S60","S-60 Cannon","57mm Anti-Aircraft Cannon" ]
,["PRACS_SLA_ZPU4","ZPU-4 Turret","Quad .50 Cal Anti-Aircraft Turret"] 
,["PRACS_SLA_SA9","SA-9", "BRDM with Anti-Air Missile system on top." ]
,["PRACS_SLA_SA8","SA-8","Radar Guided Missile Launcher wit radar Range of 16kms" ]
,["PRACS_SLA_SA17","SA-17","SA-17 Snowdrift with radar range of 20km. Will kill you about you see it."] 
]; */
params ["_VIC_Array"];

// Initialize variables
//systemChat "Delete Started";
_location = position Vec_ID_Station;  
_vehicles = nearestObjects [_location, ["LandVehicle","Air","StaticWeapon","Ship","Tank"], 100]; 
{ 
    if (count crew _x == 0) then { 
        deleteVehicle _x; 

    } 
} forEach _vehicles; 
//systemChat "Delete Ended";

 [{
//systemChat "Spawn Started";
_VIC_Array=_this select 0;
//_str=format["%1",_VIC_Array];
//systemChat _str;
_Position_Array=[ 
SPAWN_PAD_1 
,SPAWN_PAD_2 
,SPAWN_PAD_3 
,SPAWN_PAD_4 
,SPAWN_PAD_5 
,SPAWN_PAD_6 
,SPAWN_PAD_7 
,SPAWN_PAD_8 
,SPAWN_PAD_9 
,SPAWN_PAD_10 
,SPAWN_PAD_11 
,SPAWN_PAD_12 
]; 

_POS_LOC_ITER=0; 

{ 
    //systemChat "Loop Started"; 

 _Vec=_x select 0;
 _Vec_Name=_x select 1;
 _Vec_Description=_x select 2;
 _POS_LOC_SEL=_Position_Array select _POS_LOC_ITER; 
 _LOC=getPOS _POS_LOC_SEL; 
 _a = _LOC select 0; 
 _y = _LOC select 1; 
 _z = _LOC select 2; 
 _z = _z+0.25; 
 _POSLOC = [_a,_y,_z]; 
 _Rotation = switch (_POS_LOC_ITER) do 
 { 
  case 0: {90}; 
  case 1: {90}; 
  case 2: {90}; 
  case 3: {180}; 
  case 4: {180}; 
  case 5: {180}; 
  case 6: {270}; 
  case 7: {270}; 
  case 8: {270}; 
  case 9: {0}; 
  case 10:{0}; 
  case 11:{0}; 
 }; 
 //if (isServer) then { 
  _vehicle = createVehicle [_Vec,_POSLOC]; 
  _vehicle setDir _Rotation; 
  _title=format["%1 Description",_Vec_Name];
  _vehicle allowDamage false;
  _vehicle addAction [_title,{ 
    _description=_this select 3;
    [_description] call BIS_fnc_guiMessage;
    },_Vec_Description];
 //}; 
 _POS_LOC_ITER=_POS_LOC_ITER+1; 
//systemChat "Loop Ended";
}forEach _VIC_Array;
  //systemChat "Spawn Ended";
},[_VIC_Array],2] call CBA_fnc_waitAndExecute;
