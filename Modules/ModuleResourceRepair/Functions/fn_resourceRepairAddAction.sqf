params["_object", "_resourceLevel"];

private _actionId = -1;
private _maxFuel = 0;
private _missingFuel = damage _object;
if (_missingFuel > 0) then {
	private _holdActionMaxProgress = 24;
	private _actionFuelFraction = _missingFuel/_holdActionMaxProgress;
	private _maxDuration = 30;
	private _duration = _missingFuel * _maxDuration;

	private _idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";
	private _progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";

	private _title = "REPAIR";

	private _callbackFunction = TM_fnc_resourceRepairAddAction;
	private _resourceActionFunction = TM_fnc_repair;

	private _arguments = _actionFuelFraction;

	_actionId =
	[
		_object, _title, _duration, _arguments,
		[ _resourceActionFunction,  _callbackFunction],
		[_idleIcon, _progressIcon]
	]  call TM_fnc_addResourceAction;

};
_actionId