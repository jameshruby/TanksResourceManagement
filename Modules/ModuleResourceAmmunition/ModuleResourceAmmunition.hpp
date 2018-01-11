	class ModuleResourceAmmunition : ResourceModulesArea
	{
		icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"; 
		scope = 2;
		displayName = $STR_TM_ResourceAmmunition;
		functionSpecific = "TM_fnc_resourceAmmunitionAddAction";

		class Attributes: Attributes
		{
			class Description : Description 
			{
				description = $STR_TM_ResourceAmmunition;
			};
			class BuildingClass : BuildingClass
			{
				defaultValue = """B_Slingload_01_Ammo_F""";
			};		
			class BuildingMarker : BuildingMarker
			{
				defaultValue = """loc_RearmStation""";
			};		
		};
	};