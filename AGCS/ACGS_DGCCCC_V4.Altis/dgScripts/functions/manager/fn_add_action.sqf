_zeusSlots=[S3,S3_1,S3_2];

{
	_x addAction ["Spawn Helicopter",{call dgScripts_fnc_spawn_helicopters;}];
	_x addAction ["Continue Range",{call dgScripts_fnc_continue_range;}];
	_x addAction ["Spawn Moving Targets",{call dgScripts_fnc_spawn_moving_tgt;}];
} forEach _zeusSlots;