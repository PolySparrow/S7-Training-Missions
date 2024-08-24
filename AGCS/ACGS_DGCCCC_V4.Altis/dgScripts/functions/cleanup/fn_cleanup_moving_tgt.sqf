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
{
    if (side _x == civilian && {(count crew _x) > 0}) then {
        deleteVehicle _x;
    };
} forEach vehicles;

// Find and delete all civilian units
{
    if (side _x == civilian) then {
        deleteVehicle _x;
    };
} forEach allUnits;
