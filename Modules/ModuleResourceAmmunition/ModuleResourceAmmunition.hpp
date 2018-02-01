class ModuleResourceAmmunition : ResourceModulesArea
{
	icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceAmmunition;
	buildingMarkerType = "loc_Fuelstation";
	
	class ResourcesModuleParams : ResourcesModuleParams
	{
		title = $STR_TM_HoldAction_rearm;
		progressIcon = "A3\TanksResourceManagement\Img\holdAction_rearm_CA.paa";
		idleIcon =  "A3\TanksResourceManagement\Img\holdAction_rearm_CA.paa";
		cfgVehiclesQuery = "configName _x isKindOf('B_Slingload_01_Ammo_F') && getNumber (_x >> 'transportAmmo') == 0";
		custoModuleFunctions[] = {};
		buildingMarkerType = "loc_RearmStation";
	};

	class Attributes: Attributes
	{
		class MaxDuration : MaxDuration{};
		class CreateBuilding : CreateBuilding{};
		class BuildingType: BuildingType
		{
			defaultValue = """B_Slingload_01_Ammo_F_NoFunction""";
		};

		class DrawBuildingMarkerIcon: DrawBuildingMarkerIcon{};
		class ModuleDescription: ModuleDescription{};			
	};

	class ModuleDescription: ModuleDescription
	{
		description = $STR_TM_ResourceAmmunitionDescription;
	};
}; 