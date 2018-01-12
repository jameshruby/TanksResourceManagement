private _object = _this;

private _maxFuel = 1.01;
private _missingFuel = _maxFuel - fuel _object;

private _actionId = -1;
if (_missingFuel >= 0) then {
	private _holdActionMaxProgress = 24;

	private _actionFuelFraction = (_missingFuel/_holdActionMaxProgress);
	private _maxDuration = 30;
	private _duration = _missingFuel * _maxDuration;

	private _idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";
	private _progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";
	private _title = "REFUEL";

	private _callbackFunction = TM_fnc_resourceRefuelAddAction;
	private _resourceActionFunction = TM_fnc_refuel;

	private _arguments = _actionFuelFraction;

	_actionId =
	[
		_object, _title, _duration, _arguments,
		[ _resourceActionFunction,  _callbackFunction],
		[_idleIcon, _progressIcon]
	]  call TM_fnc_addResourceAction;

};
_actionId