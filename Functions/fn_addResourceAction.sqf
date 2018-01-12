params ["_object", "_title", "_duration", "_args", "_functionsParams", "_iconParams"];
_functionsParams params["_resourceActionFunction", "_callbackFunction"];
_iconParams params["_idleIcon", "_progressIcon"];

_object setVariable ["#resourceActionFunction", _resourceActionFunction];
_object setVariable ["#callbackFunction", _callbackFunction];

private _actionId = -1;
private _actionId = [
	_object,             // Object the action is attached to
	_title,              // Title of the action
	_idleIcon,           // Idleicon shown on screen
	_progressIcon,       // Progress icon shown on screen
	"true",  			 // Condition for the action to be shown
	"true", 			 // Condition for the action to progress  	//_caller = _this select 1;  
	{},					 // Code executed when action starts
	{[_target, _arguments, _this select 4] call (_target getVariable "#resourceActionFunction")}, 
	{}, // Code executed on completion
	{[_target, _target getVariable "actionId"] call BIS_fnc_holdActionRemove; _actionId = _target call (_target getVariable "#callbackFunction"); _target setVariable ["actionId", _actionId]},                                                                                  // Code executed on interrupted
	[_args],                                                                // Arguments passed to the scripts as _this select 3
	_duration,                                                                           // Action duration [s]
	0,                                                                                   // Priority
	true,                                                                                // Remove on completion
	false                                                                  	             // Show in unconscious state 
] call BIS_fnc_holdActionAdd;
_actionId