private _object = _this;

private _holdActionMaxProgress = 24;
private _maxDuration = 10;

private _magsToPushParams = [_object, _holdActionMaxProgress, _maxDuration] call TM_fnc_allTurretMagazinesToAdd;
private _duration = _magsToPushParams select 1;

private _idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";
private _progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";

private _title = "REARM";

private _callbackFunction = TM_fnc_resourceAmmunitionAddAction;
private _resourceActionFunction = TM_fnc_setMagazines;

private _arguments = _magsToPushParams select 0;


_actionId =
[
	_object, _title, _duration, _arguments,
	[ _resourceActionFunction,  _callbackFunction],
	[_idleIcon, _progressIcon]
]  call TM_fnc_addResourceAction;

_actionId