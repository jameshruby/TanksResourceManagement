/*
Author: Hrubyjak

Description:
Forms resource action parameters
Some of these are taken from the module itself, others are loaded from the ResourcesModuleParams
subclass of given module

The parameteres are passed to trigger, and subsequently to hold action itself

Parameter(s):
_this: OBJECT - module for which you want to load the parameters 
	
Returns:
ARRAY - the resource function parameters

*/

private _module = _this;

private _moduleName = typeof _module;
private _pos = getPos _module;
private _area = _module getVariable "objectArea";	
private _radius = (_area select 0) max (_area select 1);

private _maxDuration = _module getVariable "#MaxDuration";
private _resourcesModuleParams =  (configFile >> "CfgVehicles" >> _moduleName >> "ResourcesModuleParams");

private _title = getText(_resourcesModuleParams >> "title");
private _holdActionMaxProgress = getNumber(_resourcesModuleParams >> "holdActionMaxProgress");

private _idleIcon = getText(_resourcesModuleParams >> "idleIcon");
private _progressIcon = getText(_resourcesModuleParams >> "progressIcon");

private _resourceSpecificFunctions = _moduleName call TM_fnc_getResourceModuleFunctions;	

[
	_pos, _radius,
	[
		_title,
		[_maxDuration, _holdActionMaxProgress],
		_resourceSpecificFunctions,
		[_idleIcon, _progressIcon]
	]
]