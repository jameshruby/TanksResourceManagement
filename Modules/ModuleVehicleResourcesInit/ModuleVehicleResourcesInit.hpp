class ModuleVehicleResourcesInit : ResourceModules
{
    //icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_VehicledResourceSystemsInit;
	function = "TM_fnc_moduleVehicleResourcesInit";	

	class Attributes : AttributesBase
	{
		class Description
		{
			data = "AttributeSystemSubcategory";
			control = "SubCategoryNoHeader2";
			description = $STR_TM_VehicledResourceSystemsInit;
		};
	};
};