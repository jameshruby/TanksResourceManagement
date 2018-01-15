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
	class ModuleResourceFuel: TanksResourceBase
	{
		class ResourceFunctions: ResourceFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceFuel\Functions";
	
			class getResourceFractionAndDuration: getResourceFractionAndDuration{};
			class addResourceFraction: addResourceFraction{};
		}; 
	};
	class ModuleResourceRepair: TanksResourceBase
	{
		class ResourceFunctions: ResourceFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceRepair\Functions";
			
			class getResourceFractionAndDuration: getResourceFractionAndDuration{};
			class addResourceFraction: addResourceFraction{};
		}; 
	};
	class ModuleResourceAmmunition: TanksResourceBase
	{
		class ResourceFunctions: ResourceFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceAmmunition\Functions";
			
			class getResourceFractionAndDuration: getResourceFractionAndDuration{};
			class addResourceFraction: addResourceFraction{};
		}; 
	};
};
