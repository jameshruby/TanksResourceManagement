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
params["_callerUnit", "_trigger", "_actionFncParams"];

private _building = _trigger getVariable "#building";

_actionFncParams params["_title", "_durationParams", "_moduleName", "_iconParams"];
_durationParams params ["_maxDuration","_holdActionMaxProgress"];

_iconParams params["_idleIcon", "_progressIcon"];

private _actionId = -1;
private _firstTriggerVehicle = objNull;
{
	scopename "triggerUnits";
	if (_x isKindOf "LandVehicle") then {
		_firstTriggerVehicle = _x;		
		breakout "triggerUnits";
	};
} forEach list _trigger;

private _durationParams = [];
if (isNull _firstTriggerVehicle) then {
	_firstTriggerVehicle = vehicle player;
	_durationParams = [0, 0];
} else {
	 _durationParams = [_firstTriggerVehicle, _holdActionMaxProgress, _maxDuration] call (missionNamespace getVariable (_moduleName +"_fnc_getResourceFractionAndDuration"));
}; 

_trigger setvariable [ "#firstVehicle", _firstTriggerVehicle];
_durationParams params["_resourceFraction", "_holdActionDuration"];

private _titleTex = {
	titleText [format["<t size='2'>%1</t>", _this], "PLAIN DOWN", -1, true, true];
};

_actionId = [
	_firstTriggerVehicle,             // Object the action is attached to
	_title,              // Title of the action
	_idleIcon,            // Idleicon shown on screen
	_progressIcon,       // Progress icon shown on screen
	"true",  			 // Condition for the action to be shown 
	"
		private _val = false;
		if(_target  == _caller) then {
			titleText [localize 'STR_TM_HoldActionMessage_noVehicle', 'PLAIN DOWN', -1, true, false];
			_val = false;
		} else {
			if(vehicle player == player) then {
				_val = true;
			} else {
				titleText [localize 'STR_TM_HoldActionMessage_inVehicle', 'PLAIN DOWN', -1, true, false];
				_val = false;
			};
		};
		_val
	", 			 // Condition for the action to progress 
	{},			 // Code executed when action starts
	{
		_arguments params["_moduleName", "_resourceFraction", "_actionFncParams"];
		_actionFncParams params["_title"];
		private _currentProgress = _this select 4;
		titleText [format[".. %1 %2 ..", _title, localize "STR_TM_HoldActionMessage_inProgress"], 'PLAIN DOWN', 0.3, true, true];	
		[_target,_resourceFraction , _currentProgress] call (missionNamespace getVariable (_moduleName +"_fnc_addResourceFraction"))
	}, 
	{}, // Code executed on completion
	{
		private _trigger = _arguments select 3; 
		private _actionFncParams = _arguments select 2; 
		[_target, _trigger getVariable "actionId"] call BIS_fnc_holdActionRemove; 
		private _actionId = [_target, _trigger, _actionFncParams] call TM_fnc_addResourceAction; 
		_trigger setVariable ["actionId", _actionId]
	},                                                                   // Code executed on interrupted
	[_moduleName, _resourceFraction, _actionFncParams, _trigger],        // Arguments passed to the scripts as _this select 3
	_holdActionDuration,                                                 // Action duration [s] 
	0,                                                                   // Priority
	true,                                                                // Remove on completion
	false                                                                // Show in unconscious state 
] call BIS_fnc_holdActionAdd;
_actionId