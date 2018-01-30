params["_configName", "_displayNameParam", "_iconParam"];

private _logics = get3DENSelected "logic";
private _module = _logics select 0;
private _moduleName = typeOf _module;

private _configCondition =  getText (configFile >> "CfgVehicles" >> _moduleName  >> "cfgGroupsComboCondition");
private _subConfigs =  getArray (configFile >> "CfgVehicles" >> _moduleName  >> "subConfigs");

[_configName, _configCondition, _displayNameParam, _iconParam, _subConfigs] call TM_fnc_getClassAtributes