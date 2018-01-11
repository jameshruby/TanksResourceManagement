class ModuleResourceFuel : ResourceModulesArea
{
	icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa"; 
	scope = 2;
	displayName = $STR_TM_ResourceFuel;
	function = "TM_fnc_moduleResourceFuel";
	
	class Attributes : AttributesBase
	{
		class CivilianPresence_Description
		{
			data = "AttributeSystemSubcategory";
			control = "SubCategoryNoHeader2";
			description = $STR_TM_ResourceFuel;
		};
	};
};