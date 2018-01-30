/*
Author: Hrubyjak

Description:
Loads local functions

Parameter(s):
Nothing
	
Returns:
Nothing
*/

_path = "A3\TanksResourceManagement\Modules\Functions\";
[
	_path,
	"TM_fnc_",
	[
	"createLocationMarkerIcon",
	"createMapEditorBuilding",
	"loadResourceSpecificParams",

	"module_createBuilding",
	"module_deleteBuilding",
	"module_initTanksResourceManagement",
	
	"module_setBuildingDirPos",
	
	"createTriggerFunctionAction",
	"addResourceAction",

	"getResourceAcquisitionDuration",

	"getResourceModuleFunctions"
	]
] call bis_fnc_loadFunctions;