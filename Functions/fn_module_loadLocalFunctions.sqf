/*
Author: Hrubyjak

Description:
Loads local functions, the reason why the functions itself are 
not loaded here is, so we could add fnc without recompiling this

Parameter(s):
Nothing
	
Returns:
Nothing
*/
_path = "A3\TanksResourceManagement\Modules\Functions\";
[
	_path,
	"TM_fnc_",
	["loadLocalFunctions"]
] call bis_fnc_loadFunctions;

[] call TM_fnc_loadLocalFunctions; //load functions