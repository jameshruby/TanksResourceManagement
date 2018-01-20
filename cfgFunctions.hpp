class CfgFunctions
{
    class TanksResourceManagement
	{
		tag = "TM";
		project = "arma3";

		class Functions
		{
			file = "A3\TanksResourceManagement\Functions";
			class createLocationMarkerIcon;
			class createMapEditorBuilding;
			class loadResourceSpecificParams;

			class module_createBuilding;
			class module_deleteBuilding;
			class module_initTanksResourceManagement;
			class module_tanksResourceBuildingModule;
			class module_setBuildingDirPos;
			
			class createTriggerFunctionAction;
			class addResourceAction;

			class getResourceAcquisitionDuration;

			class getModuleFunction;
			class getResourceModuleFunctions;
		};
	
		class CustomAttributes
		{
			file = "A3\TanksResourceManagement\CustomAttributes";
			class getClassAtributes;
			class getAllCfgMarkerAttributes;
			class loadClassAttributes;
			class getAllCfgVehiclesAttributes;
		};
	};
};