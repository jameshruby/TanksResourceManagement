class ModuleResourceFuel : ResourceModulesArea
{
	icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceFuel;
	
	class ResourcesModuleParams : ResourcesModuleParams
	{
		title = $STR_TM_HoldAction_refuel;
		progressIcon = "A3\TanksResourceManagement\Img\holdAction_refuel_CA.paa"; 
		idleIcon =  "A3\TanksResourceManagement\Img\holdAction_refuel_CA.paa"; 
		cfgVehiclesQuery =  "_name = configName _x; _res = ((_name find 'Land_fs' == 0)||(_name find 'pump' == 0)||(_name find 'fuel' == 0)); _res"; 
        custoModuleFunctions[] = {"setVeryHungryFuelConsumptionRate"};
	};
	
	class Attributes: Attributes
	{
		class MaxDuration : MaxDuration{};
		class CreateBuilding : CreateBuilding{};
		class BuildingType: BuildingType
		{
			defaultValue = """Land_fs_roof_F""";
		};

		class DrawBuildingMarkerIcon: DrawBuildingMarkerIcon{};

		class BuildingMarker : BuildingMarker
		{
			defaultValue = """loc_Fuelstation""";
		};
		
		class ModuleDescription: ModuleDescription{};		
	};

	class ModuleDescription: ModuleDescription
	{
		description = $STR_TM_ResourceFuelDescription;
	};
};