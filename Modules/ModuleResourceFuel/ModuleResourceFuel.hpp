class ModuleResourceFuel : ResourceModulesArea
{
	icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceFuel;
	buildingMarkerType = "loc_Fuelstation";

	class ResourcesModuleParams : ResourcesModuleParams
	{
		title = $STR_TM_HoldAction_refuel;
		progressIcon = "A3\TanksResourceManagement\Img\holdAction_refuel_CA.paa"; 
		idleIcon =  "A3\TanksResourceManagement\Img\holdAction_refuel_CA.paa"; 
		cfgVehiclesQuery = "configName _x isKindOf('Slingload_base_F') && getNumber (_x >> 'transportFuel') == 0 && (((configName _x) find 'fuel') >= 0 || ((configName _x) find 'Fuel') >= 0)"; //buildingType
        custoModuleFunctions[] = {};
	};
	
	class Attributes: Attributes
	{
		class MaxDuration : MaxDuration{};
		class CreateBuilding : CreateBuilding{};
		class BuildingType: BuildingType
		{
			defaultValue = """B_Slingload_01_Fuel_F_NoFunction""";
		};

		class DrawBuildingMarkerIcon: DrawBuildingMarkerIcon{};
		class ModuleDescription: ModuleDescription{};		
	};

	class ModuleDescription: ModuleDescription
	{
		description = $STR_TM_ResourceFuelDescription;
	};
};
