params["_target", "_arguments", "_currentProgress"];
_arguments params["_magsToPushPerTick"];
if (count _magsToPushPerTick > 0) then 	{
	{
		_x params["_className", "_turretPath", "_ammoPerTick", "_ammoCount"];
		_target setMagazineTurretAmmo [_className, _ammoCount + (_currentProgress * _ammoPerTick), _turretPath];
	} forEach _magsToPushPerTick;
};	