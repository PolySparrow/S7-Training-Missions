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
 * call dgScripts_fnc_cleanup_moving_tgt
 *
 * Public: No
 *
 */
// Find and delete all civilian vehicles that have crew members
_filter=["rhsusf_M978A4_usarmy_d","rhsusf_M977A4_AMMO_usarmy_d","vtx_MH60M","TF373_SOAR_MH47G_EasyActions","Land_CampingChair_V2_F","Land_TripodScreen_01_large_F","Flag_Red_F","Land_PortableLight_single_F","B_supplyCrate_F"];
{
    if (side _x == civilian && ({!(typeOf _x in _filter)})) then { 
        deleteVehicle _x;
    };
} forEach vehicles;

// Find and delete all civilian units
{
    if (side _x == civilian) then {
        deleteVehicle _x;
    };
} forEach allUnits;
