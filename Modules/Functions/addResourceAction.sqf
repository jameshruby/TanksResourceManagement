/*
Author: Hrubyjak

Description:
Adds the resource action which is specilized form of hold action

Parameter(s):
_this select 0: OBJECT - the target on which the hold action is added
_this select 1: ARRAY - the hold action parameters
	
Returns:
NUMBER - action ID
*/

private _object = _this select 0;
private _actionFncParams = _this select 1;

_actionFncParams params["_title", "_durationParams", "_moduleName", "_iconParams"];
_durationParams params ["_maxDuration","_holdActionMaxProgress"];

_iconParams params["_idleIcon", "_progressIcon"];

// private _path = "\A3\TanksResourceManagement\Modules\" + _moduleName + "\Functions\";
// [
// 	_path,
// 	_moduleName + "_fnc_",
// 	[
// 	"init",
// 	"getResourceFractionAndDuration",
// 	"addResourceFraction"
// 	]
// ] call bis_fnc_loadFunctions;

private _actionId = -1;
private _durationParams = [_object, _holdActionMaxProgress, _maxDuration] call (missionNamespace getVariable (_moduleName +"_fnc_getResourceFractionAndDuration"));

_durationParams params["_resourceFraction", "_holdActionDuration"];

_actionId = [
	_object,             // Object the action is attached to
	_title,              // Title of the action
	_idleIcon,            // Idleicon shown on screen
	_progressIcon,       // Progress icon shown on screen
	"true",  			 // Condition for the action to be shown
	"true", 			 // Condition for the action to progress  	//_caller = _this select 1;  
	{},					 // Code executed when action starts
	{[_target, _arguments select 1, _this select 4] call (missionNamespace getVariable ((_arguments select 0) +"_fnc_addResourceFraction"))}, 
	{}, // Code executed on completion
	{[_target, _target getVariable "actionId"] call BIS_fnc_holdActionRemove; _actionId = [_target, _arguments select 2] call TM_fnc_addResourceAction; _target setVariable ["actionId", _actionId]},                                                                                  // Code executed on interrupted
	[_moduleName, _resourceFraction, _actionFncParams],                                 // Arguments passed to the scripts as _this select 3
	_holdActionDuration,                                                                           // Action duration [s]
	0,                                                                                   // Priority
	true,                                                                                // Remove on completion
	false                                                                  	             // Show in unconscious state 
] call BIS_fnc_holdActionAdd;
_actionId