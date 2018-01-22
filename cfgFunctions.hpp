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
			class module_loadLocalFunctions;
		};
	
		class CustomAttributes
		{
			file = "A3\TanksResourceManagement\CustomAttributes";
			class getClassAtributes;
			class getAllCfgMarkerAttributes;
			class loadClassAttributes;
			class getAllCfgVehiclesAttributes;
		};
	};
};