 params ["_caller"];

//_zeusSlots=[S3,S3_1,S3_2];
	_caller addAction ["Continue Range",{call dgScripts_fnc_continue_range;},nil,1,true,true,"","triggerActivated TRG1 && triggerActivated TRG2"];
	_caller addAction ["Spawn Stationary Moving Targets",{call dgScripts_fnc_spawn_stationary_moving;}];
	_caller addAction ["Spawn Moving Targets",{call dgScripts_fnc_spawn_moving_tgt;}];
	_caller addAction ["Spawn Helicopter",{call dgScripts_fnc_spawn_helicopters;}];
	
1