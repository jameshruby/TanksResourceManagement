/*
Author: Hrubyjak

Description:
Loads module functions

Parameter(s):
_this: STRING - module name

Returns:
ARRAY of functions 
*/
private _moduleName = _this;

private _functionNames = 
[
	"getResourceFractionAndDuration",
	"addResourceFraction"
];

_path = "\A3\TanksResourceManagement\Modules\" + _moduleName + "\Functions\";
[
	_path,
	_moduleName + "_fnc_",
	_functionNames
] call bis_fnc_loadFunctions;

private _functions = [];
{
	private _function = [_x, _moduleName] call TM_fnc_getModuleFunction;
	_functions pushBack _function;
} forEach _functionNames;	
_functions