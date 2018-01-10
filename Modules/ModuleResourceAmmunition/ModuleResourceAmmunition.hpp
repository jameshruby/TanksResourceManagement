	class ModuleResourceAmmunition : ResourceModules
	{
		icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"; 
		scope = 2;
		displayName = $STR_TM_ResourceAmmunition;
		function = "TM_fnc_moduleResourceAmmunition";
		
		canSetArea = 1;
		canSetAreaHeight = 0;
		canSetAreaShape = 0;

		class AttributeValues
		{
			size3[] = {10,10,0};
			isRectangle = 0;
		};

		// class Attributes : AttributesBase
		// {
     
		// 	class ModuleDescription: ModuleDescription{};
		// };

		// class ModuleDescription: ModuleDescription
		// {
		// 	description = "Capture the Zone";//TODO desc.
		// };
	};