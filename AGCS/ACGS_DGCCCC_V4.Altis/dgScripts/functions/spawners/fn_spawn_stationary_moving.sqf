_LeftSide=[
	[getMarkerPos "RANGE_1_1",getMarkerPos "RANGE_2_1",1],   	
	[getMarkerPos "RANGE_1_3",getMarkerPos "RANGE_2_3",2],
	[getMarkerPos "RANGE_1_5",getMarkerPos "RANGE_2_5",3],
	[getMarkerPos "RANGE_1_7",getMarkerPos "RANGE_2_7",4],
	[getMarkerPos "RANGE_1_9",getMarkerPos "RANGE_2_9",5],
	[getMarkerPos "RANGE_1_11",getMarkerPos "RANGE_2_11",6],
	[getMarkerPos "RANGE_1_13",getMarkerPos "RANGE_2_13",7]
];

_RightSide=[
	[getMarkerPos "RANGE_1_2",getMarkerPos "RANGE_2_2",1],
	[getMarkerPos "RANGE_1_4",getMarkerPos "RANGE_2_4",2],
	[getMarkerPos "RANGE_1_6",getMarkerPos "RANGE_2_6",3],
	[getMarkerPos "RANGE_1_8",getMarkerPos "RANGE_2_8",4],
	[getMarkerPos "RANGE_1_10",getMarkerPos "RANGE_2_10",5],
	[getMarkerPos "RANGE_1_12",getMarkerPos "RANGE_2_12",6],
	[getMarkerPos "RANGE_1_14",getMarkerPos "RANGE_2_14",7]
];

_LeftSideNumber=0;
_RightSideNumber=0;

	_LeftSidePick=selectRandom _LeftSide;
	_RightSidePick=selectRandom _RightSide;
	_LeftSideNumber=_LeftSidePick select 2;
	_RightSideNumber=_RightSidePick select 2;

while {_LeftSideNumber==_RightSideNumber} do {
	_LeftSidePick=selectRandom _LeftSide;
	_RightSidePick=selectRandom _RightSide;
	_LeftSideNumber=_LeftSidePick select 2;
	_RightSideNumber=_RightSidePick select 2;
};

_randomNumber=round random 1.01;
_SpawnArray=[];
if (_randomNumber==0) then {
	_SpawnArray=[[_LeftSidePick select 0,_LeftSidePick select 1],[_RightSidePick select 0,_RightSidePick select 1]];
} else {
	_SpawnArray=[[_RightSidePick select 0,_RightSidePick select 1],[_LeftSidePick select 0,_LeftSidePick select 1]];
};

_civcars=["UK3CB_C_Skoda","UK3CB_C_Lada","UK3CB_C_Hatchback","UK3CB_C_Datsun_Open"];
_car=selectRandom _civcars;
_startPoint=_SpawnArray select 0;
_endPoint=_SpawnArray select 1;


{
	_vech=_car createVehicle _x;
	_grp=createGroup [civilian, true];
	_driver = _grp createUnit ["C_man_1",_vech,[],0,"NONE"];
	_driver moveInAny _vech; 
	_driver addEventHandler ["Killed",{
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        _str= format["%2 has killed %1",_unit,_instigator];
        [_str] remoteExec ["systemChat",-2];
    }];
    _driver addEventHandler ["GetOutMan",{
        params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
        _str= format["%1 has left %2",_unit,_vehicle];
        [_str] remoteExec ["systemChat",-2];
    }
    ];
	_waypointdestination=_endPoint select _forEachIndex;
	_dir=_x getDir _waypointdestination;
	_vech setDir _dir;
	_wp=_grp addWaypoint [_waypointdestination,0,-1,""];
	_wp setWaypointType "MOVE"; 
	_wp setWaypointCompletionRadius 0;
} forEach _startPoint;
