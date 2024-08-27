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
_filter=["UK3CB_C_Skoda","UK3CB_C_Lada","UK3CB_C_Hatchback","UK3CB_C_Datsun_Open"];
{
    if (side _x == civilian && ({(typeOf _x in _filter)})) then { 
        deleteVehicle _x;
    };
} forEach vehicles;

// Find and delete all civilian units
{
    if (side _x == civilian) then {
        deleteVehicle _x;
    };
} forEach allUnits;
