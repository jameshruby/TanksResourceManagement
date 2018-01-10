	class ModuleResourceFuel : ResourceModulesArea
	{
	    icon = "A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa"; 
		scope = 2;
		displayName = $STR_TM_ResourceFuel;
		function = "TM_fnc_moduleResourceFuel";
		
		class Attributes : AttributesBase
		{
			// class VehiclesFuelCapacity
			// {
			// 	property = "#VehiclesFuelCapacity";
			// 	displayName = "VehiclesFuelCapacity";
			// 	control = "Slider";
			// 	defaultValue = "1";
			// 	expression = _this setVariable ["#VehiclesFuelCapacity", _value];
			// };	

			// class FalloutAsh : Checkbox
			// {
			// 	property = "#FalloutAsh";
			// 	displayName = "Spawn";
			// 	defaultValue = "true";
			// 	expression = _this setVariable ["#FalloutAsh", _value];
			// };

			class ModuleDescription: ModuleDescription{};
		};

		class ModuleDescription: ModuleDescription
		{
			description = $STR_TM_ResourceFuel;//TODO desc.
		};
	};