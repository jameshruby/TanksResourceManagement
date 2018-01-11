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
		};

		class ResourceRepairFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceRepair\Functions";
			class resourceRepair;
			class resourceRepairAddAction;
		};
		class ResourceAmmunitionFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceAmmunition\Functions";
			class resourceAmmunition;
			class resourceAmmunitionAddAction;
			
			class allTurretMagazinesToAdd;
		};
		class ResourceFuelFunctions
		{
			file = "A3\TanksResourceManagement\Modules\ModuleResourceFuel\Functions";
			class resourceRefuel;
			class resourceRefuelAddAction;
		};

		class Modules {
			class moduleVehicleResourcesInit {file = "A3\TanksResourceManagement\Modules\ModuleVehicleResourcesInit\fn_moduleVehicleResourcesInit.sqf"; };
		};
	};
};
