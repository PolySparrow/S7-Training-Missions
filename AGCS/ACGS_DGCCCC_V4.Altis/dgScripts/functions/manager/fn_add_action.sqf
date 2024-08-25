 params ["_caller"];

//_zeusSlots=[S3,S3_1,S3_2];
	_caller addAction ["Continue Range",{call dgScripts_fnc_continue_range;}];
	_caller addAction ["Spawn Moving Targets",{call dgScripts_fnc_spawn_moving_tgt;}];
	_caller addAction ["Spawn Helicopter",{call dgScripts_fnc_spawn_helicopters;}];
