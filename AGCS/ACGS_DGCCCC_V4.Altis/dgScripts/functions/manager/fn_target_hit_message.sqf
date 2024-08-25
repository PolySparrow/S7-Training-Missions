param["_target", "_shooter"];


/*_target="A";
_shooter="B";
_stg=format["MS_%1 hit by %2", _target, _shooter];*/
[[west,"HQ"], format["MS_%1 hit by %2", _target, _shooter]] remoteExec ["sideChat", 2];
