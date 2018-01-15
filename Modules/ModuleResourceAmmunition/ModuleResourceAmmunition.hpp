	class ModuleResourceAmmunition : ResourceModulesArea
	{
		icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"; 
		scope = 2;
		displayName = $STR_TM_ResourceAmmunition;
		
		class ResourcesModuleParams : ResourcesModuleParams
		{
			title = "REARM";
		};

		class Attributes: Attributes
		{
			class MaxDuration : MaxDuration{};

			class BuildingClass : BuildingClass
			{
				defaultValue = """B_Slingload_01_Ammo_F_NoFunction""";
			};

			class DrawBuildingMarkerIcon: DrawBuildingMarkerIcon{};

			class BuildingMarker : BuildingMarker
			{
				defaultValue = """loc_RearmStation""";
			};

			class ModuleDescription: ModuleDescription{};			
		};

		class ModuleDescription: ModuleDescription
		{
			description = $STR_TM_ResourceAmmunitionDescription;
		};
	}; 