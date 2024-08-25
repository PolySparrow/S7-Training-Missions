_tgt=[target_11,target_12,target_13,target_14,target_15,target_16];


{
	_x addEventHandler ["HitPart",{
		(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
		if (_target getHit "terc"  == 0) then {
		[[west,"HQ"], format["MS_%1 hit by %2", _target, _shooter]] remoteExec ["sideChat", 2];
		};
	}];
}
forEach _tgt;


