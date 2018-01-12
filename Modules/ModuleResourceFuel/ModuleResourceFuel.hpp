class ModuleResourceFuel : ResourceModulesArea
{
	icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceFuel;
	functionSpecific = "TM_fnc_resourceRefuelAddAction";  

	class Attributes: Attributes
	{
		class BuildingClass : BuildingClass
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