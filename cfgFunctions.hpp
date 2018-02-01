class CfgFunctions
{
    class TanksResourceManagement
	{
		tag = "TM";
		project = "arma3";

		class Functions
		{
			file = "A3\TanksResourceManagement\Functions";
			class module_tanksResourceBuildingModule;
		};
	
		class CustomAttributes
		{
			file = "A3\TanksResourceManagement\CustomAttributes";
			class getClassAtributes;
			class getAllCfgMarkerAttributes;
			class loadClassAttributes;
			class getAllCfgVehiclesAttributes;
			class getResourceBuildingAttributes;

			class getAnyCfgAttributes;

			class controlDisablingOtherControl_load;
			class controlDisablingOtherControl;
		};
	};
};