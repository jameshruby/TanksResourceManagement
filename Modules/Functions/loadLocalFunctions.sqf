private _functionNames = 
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
];

_path = "A3\TanksResourceManagement\Modules\Functions\";
[
	_path,
	"TM_fnc_",
	_functionNames
] call bis_fnc_loadFunctions;
