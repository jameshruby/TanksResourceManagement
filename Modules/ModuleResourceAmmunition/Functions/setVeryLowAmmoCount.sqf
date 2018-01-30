private _percentage = _this;

private _object = vehicle player;
private _mags = magazinesAllTurrets _object;
if (count _mags == 0) exitWith {};
{
	_x params["_className", "_turretPath","_ammoCount"];
	private _maxAmmoCount = getNumber(configFile >> "cfgMagazines" >> _className >> "count");
	private _ammoToAdd = (_maxAmmoCount/100) * _percentage;
	_object setMagazineTurretAmmo [_className, _ammoToAdd, _turretPath];
} forEach _mags;

//_object addMagazineTurret ["SmokeLauncherMag",[0,0]];