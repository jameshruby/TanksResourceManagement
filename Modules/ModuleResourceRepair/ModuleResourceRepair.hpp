class ModuleResourceRepair : ResourceModulesArea
{
    icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceRepair;
	
	class ResourcesModuleParams : ResourcesModuleParams
	{
		title = "REPAIR";
	};

	class Attributes: Attributes
	{
		class MaxDuration : MaxDuration{};

		class BuildingClass : BuildingClass
		{
			defaultValue = """Land_RepairDepot_01_civ_F_NoFunction""";
		};		

		class DrawBuildingMarkerIcon: DrawBuildingMarkerIcon{};

		class BuildingMarker : BuildingMarker
		{
			defaultValue = """loc_RepairStation""";
		};	

		class ModuleDescription: ModuleDescription{};		
	};

	class ModuleDescription: ModuleDescription
	{
		description = $STR_TM_ResourceRepairDescription;
	};
};