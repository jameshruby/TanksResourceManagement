private _logics = get3DENSelected "logic";
private _module = _logics select 0;
private _moduleName = typeOf _module;

private _configCondition =  getText (configFile >> "CfgVehicles" >> _moduleName >> "ResourcesModuleParams" >> "cfgVehiclesQuery");
_configCondition call TM_fnc_getAllCfgVehiclesAttributes