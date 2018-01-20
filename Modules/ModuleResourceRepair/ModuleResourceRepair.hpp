class ModuleResourceRepair : ResourceModulesArea
{
    icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceRepair;
	
	class ResourcesModuleParams : ResourcesModuleParams
	{
		title = $STR_TM_HoldAction_repair;
		progressIcon = "A3\TanksResourceManagement\Img\holdAction_repair_CA.paa";
		idleIcon = "A3\TanksResourceManagement\Img\holdAction_repair_CA.paa";
	};

	class Attributes: Attributes
	{
		class MaxDuration : MaxDuration{};
		class CreateBuilding : CreateBuilding{};
		class BuildingType: BuildingType
		{
			control = "RepairDepotType";
			defaultValue = """Land_RepairDepot_01_Green_F_NoFunction""";
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