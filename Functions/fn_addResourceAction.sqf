private _object = _this select 0;
private _actionFncParams = _this select 1;

_actionFncParams params["_title", "_maxDuration","_holdActionMaxProgress", "_functionParams", "_iconParams"];
_functionParams params["_resourceActionFunctionName", "_initActionFunctionnName"];
_iconParams params["_idleIcon", "_progressIcon"];

private _actionId = -1;

private _initActionFunction = missionNamespace getVariable _initActionFunctionnName;
private _durationParams = [_object, _holdActionMaxProgress, _maxDuration] call _initActionFunction;
_durationParams params["_args", "_duration"];

//if (_missingFuel == 0) exitWith {-1;};

private _resourceActionFunction = missionNamespace getVariable _resourceActionFunctionName;

_actionId = [
	_object,             // Object the action is attached to
	_title,              // Title of the action
	_idleIcon,            // Idleicon shown on screen
	_progressIcon,       // Progress icon shown on screen
	"true",  			 // Condition for the action to be shown
	"true", 			 // Condition for the action to progress  	//_caller = _this select 1;  
	{},					 // Code executed when action starts
	{[_target, _arguments select 1, _this select 4] call (_arguments select 0)}, 
	{}, // Code executed on completion
	{[_target, _target getVariable "actionId"] call BIS_fnc_holdActionRemove; _actionId = [_target, _arguments select 2] call TM_fnc_addResourceAction; _target setVariable ["actionId", _actionId]},                                                                                  // Code executed on interrupted
	[_resourceActionFunction, _args, _actionFncParams],                                 // Arguments passed to the scripts as _this select 3
	_duration,                                                                           // Action duration [s]
	0,                                                                                   // Priority
	true,                                                                                // Remove on completion
	false                                                                  	             // Show in unconscious state 
] call BIS_fnc_holdActionAdd;
_actionId