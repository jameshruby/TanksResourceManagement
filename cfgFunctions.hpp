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
		};

		class ResourceRepairFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceRepair\Functions";
			class resourceRepairAddAction;
			class repair;
		};
		class ResourceAmmunitionFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceAmmunition\Functions";
			class resourceAmmunitionAddAction;
			
			class allTurretMagazinesToAdd;
			class setMagazines;
		};
		class ResourceFuelFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceFuel\Functions";
			class resourceRefuelAddAction;
			class refuel;
		};

		class Modules {
			class moduleVehicleResourcesInit {file = "A3\TanksResourceManagement\Modules\ModuleVehicleResourcesInit\fn_moduleVehicleResourcesInit.sqf"; };
		};
	};
};
