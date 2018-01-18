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

private _resourceSpecificFunctions = _moduleName call TM_fnc_getResourceModuleFunctionsFromCfgFunctions;	

[
	_pos, _radius,
	[
		_title,
		[_maxDuration, _holdActionMaxProgress],
		_resourceSpecificFunctions,
		[_idleIcon, _progressIcon]
	]
]
 