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
			
			class createTriggerFunctionAction;
			class addResourceAction;

			class getResourceAcquisitionDuration;

			class getModuleFunction;
			class getResourceModuleFunctionsFromCfgFunctions;

			class baseFunctionException;
		};
	
		class CustomAttributes
		{
			file = "A3\TanksResourceManagement\CustomAttributes";
			class getClassAtributes;
			class getAllCfgMarkerAttributes;
			class loadClassAttributes;
		};
	};

	//////////////// Module Functions ////////////////////////////////////
	
	class TanksResourceBase
	{
		class ResourceFunctions
		{
			file = "A3\TanksResourceManagement\ResourceFunctions";
			
			class getResourceFractionAndDuration;
			class addResourceFraction;
		};
	};

	#define RESOURCE_MODULE_FUNCTIONS(MODULE_CLASS_NAME)\
    class ##MODULE_CLASS_NAME##: TanksResourceBase\
    {\
        class ResourceFunctions: ResourceFunctions\
        {\
            file = \A3\TanksResourceManagement\Modules\##MODULE_CLASS_NAME##\Functions;\
            \
            class getResourceFractionAndDuration: getResourceFractionAndDuration{};\
            class addResourceFraction: addResourceFraction{};\
        };\
    };\

	RESOURCE_MODULE_FUNCTIONS(ModuleResourceFuel)
	RESOURCE_MODULE_FUNCTIONS(ModuleResourceRepair)
	RESOURCE_MODULE_FUNCTIONS(ModuleResourceAmmunition)
};