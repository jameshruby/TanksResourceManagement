/*
Author: Hrubyjak

Description:
Loads module functions

Parameter(s):
_this: STRING - module name

Returns:
ARRAY of functions 
*/
private _moduleName = _this select 0;
private _customModuleFunctions = _this select 1;

private _functionNames = 
[
	"init",
	"getResourceFractionAndDuration",
	"addResourceFraction"
];

_functionNames append _customModuleFunctions;

_path = "\A3\TanksResourceManagement\Modules\" + _moduleName + "\Functions\";
[
	_path,
	_moduleName + "_fnc_",
	_functionNames
] call bis_fnc_loadFunctions;