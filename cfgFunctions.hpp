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

			class moduleCreateBuilding;
			class tanksResourceBuildingModule;
			class createTriggerFunctionAction;
			class addResourceAction;

			class getResourceAcquisitionDuration;

			class getModuleFunction;
			class getResourceModuleFunctionsFromCfgFunctions;

			class baseFunctionException;
		};

		class Modules {
			class moduleVehicleResourcesInit {file = "A3\TanksResourceManagement\Modules\ModuleVehicleResourcesInit\fn_moduleVehicleResourcesInit.sqf"; };
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