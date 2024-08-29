_tgt=[target_11,target_12,target_13,target_14,target_15,target_16];


{
	_initset=time;
	_x setVariable ["lastHitTime", _initset, true];
	_x addEventHandler ["HitPart",{
		(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
		_currentTime = time;
		_lastHitTime = _target getVariable ["lastHitTime", 0];
		if ((_currentTime - _lastHitTime) >= 5) then {
			_str=format["MS_%1 hit by %2", _target, _shooter];
			[_str] remoteExec ["systemChat",-2];
        // Update the last execution time
        _target setVariable ["lastHitTime", _currentTime, true];
		};
	}];
}
forEach _tgt;


