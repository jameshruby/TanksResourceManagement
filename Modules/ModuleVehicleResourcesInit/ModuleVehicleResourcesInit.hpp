class ModuleVehicleResourcesInit : ResourceModules
{
    //icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_VehicledResourceSystemsInit;
	function = "TM_fnc_moduleVehicleResourcesInit";	

	// class Attributes : AttributesBase
	// {
	
	// 	class ModuleDescription: ModuleDescription{};
	// };

	class ModuleDescription: ModuleDescription
	{
		description = $STR_TM_VehicledResourceSystemsInit;//TODO desc.
	};
};