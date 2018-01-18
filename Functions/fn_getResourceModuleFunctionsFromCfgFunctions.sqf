private _moduleName = _this;
private _functions = [];

private _functionClasses = "true" configClasses (configFile >> "CfgFunctions" >> "TanksResourceBase" >> "ResourceFunctions");
{
	private _functionName =  configName _x;
	private _function = [_functionName, _moduleName] call TM_fnc_getModuleFunction;
	_functions pushBack _function;
} forEach _functionClasses;	
_functions
