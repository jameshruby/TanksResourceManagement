params["_object", "_resourceLevel"];

//private _distAction = _this select 1;
private _actionId = -1;

//[_target, _target getVariable "actionId"] call BIS_fnc_holdActionRemove;_target setVariable ["actionId",_target call TM_fnc_resourceRefuelAddAction]

private _maxFuel = 0;
private _missingFuel = damage _object;
if (_missingFuel > 0) then {
	private _holdActionMaxProgress = 24;
	private _actionFuelFraction = _missingFuel/_holdActionMaxProgress;
	private _maxDuration = 30;
	private _duration = _missingFuel * _maxDuration;
	_actionId = [
		_object,                                                                           // Object the action is attached to
		"REPAIR",                                                                       // Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idleicon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
		"true",  			 // Condition for the action to be shown
		"true", 			//format["_caller distance _target < %1", _distAction]        // Condition for the action to progress
		{},				//_caller = _this select 1;  // Code executed when action starts
		{ _target setDamage (damage _target - (_arguments select 0))}, //      _target setFuel (fuel _target + )         {},                                                            // Code executed on every progress tick
		{},//TitleText ["	"..VTOL refueled" ", "PLAIN DOWN",0.5];	 //_this call MY_fnc_hackingCompleted                                                // Code executed on completion
		{[_target, _target getVariable "actionId"] call BIS_fnc_holdActionRemove;_actionId = _target call TM_fnc_resourceRepairAddAction;  _target setVariable ["actionId", _actionId]}, //  Code executed on interrupted
		[_actionFuelFraction],                                                                                  // Arguments passed to the scripts as _this select 3
		_duration,                                                                                  // Action duration [s]
		0,                                                                                   // Priority
		true,                                                                               // Remove on completion
		false                                                                  	             // Show in unconscious state 
	] call BIS_fnc_holdActionAdd;     
};
_actionId
