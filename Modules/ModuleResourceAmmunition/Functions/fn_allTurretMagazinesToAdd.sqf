params["_object", "_holdActionProgress", "_maxDuration"];

private _totalAmmoToAdd = 1;
private _maxAmmoToAdd = 1;

private _magsToPushPerTick = [];  //ammo, how much per tick
private _mags = magazinesAllTurrets _object;
{
	_x params["_className", "_turretPath","_ammoCount"];
	private _maxAmmoCount = getNumber(configFile >> "cfgMagazines" >> _className >> "count");
	_maxAmmoToAdd = _maxAmmoToAdd + _maxAmmoCount;
	private _ammoToAdd = _maxAmmoCount - _ammoCount;
	if (_ammoToAdd > 0) then {
		_totalAmmoToAdd = _totalAmmoToAdd + _ammoToAdd;	
		private _ammoPerTick = _ammoToAdd/_holdActionProgress; 
		_magsToPushPerTick pushBack ([_className, _turretPath, _ammoPerTick, _ammoCount]);
	};
} forEach _mags;

private _holdActionDuration = 0;
if (_maxAmmoToAdd > 0) then {
	_holdActionDuration = (_totalAmmoToAdd/_maxAmmoToAdd) *  _maxDuration;
};

[_magsToPushPerTick, _holdActionDuration]