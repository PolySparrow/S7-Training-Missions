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
 params ["_Trg","_waypointArray"];
 _independentGroups = (allGroups select {side _x == resistance}) select {leader _x inArea _Trg};

_HeliPilotGroup= _independentGroups select 0;
_Height=150;
/*_waypointArray=[
[26929.4,20093,_heliHeight],
[25781.3,19121.7,_heliHeight],
[25401.4,18799.3,_heliHeight],
[25100.4,18552.3,_heliHeight],
[24799.4,18301.8,_heliHeight],
[24499.7,18043.2,_heliHeight],
[24102.3,17700.6,_heliHeight],
[23124.8,17021.1,_heliHeight],
[22754.3,17721.1,_heliHeight]
];*/
/*[
	[22420.8,18395.1,150],
[23293.4,18897.6,150],
[23561.2,19107.9,150],
[23828.9,19336.4,150],
[24162.6,19616.8,150],
[24520.1,19918.2,150],
[24793.5,20148.1,150],
[25121.5,20414.5,150],
[26168.4,21295.7,150],
[26484,20661.6,150]
]*/
{
	_addHeight = [_x select 0,_x select 1, _Height];
	_HeliPilotGroup addWaypoint [_addHeight,-1];

} forEach _waypointArray;