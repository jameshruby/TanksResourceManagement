class ModuleResourceRepair : ResourceModulesArea
{
    icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceRepair;
	functionSpecific = "TM_fnc_resourceRepairAddAction";	
	
	class Attributes: Attributes
	{
		class Description : Description 
		{
			description = $STR_TM_ResourceRepair;
		};
		class BuildingClass : BuildingClass
		{
			defaultValue = """Land_RepairDepot_01_civ_F_NoFunction""";
		};		
		class BuildingMarker : BuildingMarker
		{
			defaultValue = """loc_RepairStation""";
		};		
	};
};

