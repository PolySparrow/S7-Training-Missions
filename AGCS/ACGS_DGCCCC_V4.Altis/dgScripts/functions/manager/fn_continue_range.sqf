_move1=getMarkerPos "MOVE_2";
_move2=getMarkerPos "MOVE_3";
_move3=getMarkerPos "MOVE_4";
_move4=getMarkerPos "MOVE_5";
_move5=getMarkerPos "MOVE_6";
_move6=getMarkerPos "MOVE_7";
_move7=getMarkerPos "MOVE_8";
_move8=getMarkerPos "MOVE_9";
_move9=getMarkerPos "MOVE_10";

_move10=getMarkerPos "MOVE_11";
_move11=getMarkerPos "MOVE_12";
_move12=getMarkerPos "MOVE_13";
_move13=getMarkerPos "MOVE_14";
_move14=getMarkerPos "MOVE_15";
_move15=getMarkerPos "MOVE_16";
_move16=getMarkerPos "MOVE_17";
_move17=getMarkerPos "MOVE_19";



[TRG2,[ 
_move1,
_move2,
_move3,
_move4,
_move5,
_move6,
_move7,
_move8,
_move9
]] call dgScripts_fnc_add_waypoint_2;
[TRG1,[ 
_move10,
_move11,
_move12,
_move13,
_move14,
_move15,
_move16,
_move17
]] call dgScripts_fnc_add_waypoint_2;