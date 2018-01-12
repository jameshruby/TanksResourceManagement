class ModuleResourceFuel : ResourceModulesArea
{
	icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceFuel;
	functionSpecific = "TM_fnc_resourceRefuelAddAction";  

	class Attributes: Attributes
	{
		class Description: Description
		{
			description = $STR_TM_ResourceFuel;
		};
		class BuildingClass : BuildingClass
		{
			defaultValue = """Land_fs_roof_F""";
		};		

		class DrawBuildingMarkerIcon: DrawBuildingMarkerIcon{};

		class BuildingMarker : BuildingMarker
		{
			defaultValue = """loc_Fuelstation""";
		};		
	};
};