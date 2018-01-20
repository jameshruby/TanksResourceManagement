/*
Author: Hrubyjak

Description:
Gets module specific function
The function contains name, and the classname of the module is used instead of the prefix
eq. for ResourceFuelModule, the addResourceFraction function will be named as ResourceFuelModule_addResourceFraction
In this way, we can simulate "polymorphism"

Parameter(s):
_this select 0: STRING - name of the function
_this select 1: STRING - name of the module
	
Returns:
Nothing
*/

params["_functionName", "_moduleName"];
private _functionFullName = format["%1_fnc_%2", _moduleName, _functionName];
(missionNamespace getVariable _functionFullName)