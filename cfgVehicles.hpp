class CfgFactionClasses
{
	class TanksResourceManagement     	
	{
		displayName = $STR_TM_ModulesCategory;		
		side = TLogic;
		priority = 10;
	};
};

class CfgVehicles
{	

	class Land_RepairDepot_01_civ_F;
	class Land_RepairDepot_01_civ_F_NoFunction: Land_RepairDepot_01_civ_F
	{	
		displayName = $STR_TM_RepairDepotDisplayName;
		transportRepair = 0;
	};

	class B_Slingload_01_Ammo_F;
	class B_Slingload_01_Ammo_F_NoFunction: B_Slingload_01_Ammo_F
	{
		transportAmmo = 0;
		displayName = $STR_TM_AmmoContainerDisplayName;
	};


	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription;
		class AttributesBase
		{
			class Default;
			class Edit; // Default edit box (i.e., text input field)
			class Combo; // Default combo box (i.e., drop-down menu)
			class Checkbox; // Default checkbox (returned value is Bool)
			class CheckboxNumber; // Default checkbox (returned value is Number)
			class ModuleDescription; // Module description
			class Units; // Selection of units on which the module is applied
		};
	};

	class ResourceModules: Module_F
	{
		icon = "A3\Armor_F_Tank\AFV_Wheeled_01\Data\UI\AFV_Wheeled_01_cannon_ca.paa"; 
		category = "TanksResourceManagement";
		functionPriority = 1;
		isGlobal = 1; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 0; // 1 for module waiting until all synced triggers are activated
		isDisposable = 0; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		is3DEN = 1;
	};
	
	class ResourceModulesArea: ResourceModules
	{
		canSetArea = 1;
		canSetAreaHeight = 0;
		canSetAreaShape = 0;
		
		function = "TM_fnc_tanksResourceBuildingModule";			

		class AttributeValues
		{
			size3[] = {10,10,0};
			isRectangle = 0;
		};

		class Attributes : AttributesBase
		{
			class Description
			{
				data = "AttributeSystemSubcategory";
				control = "SubCategoryNoHeader2";
				displayName = "";
				description = "";
				tooltip = "";
			};
			class BuildingClass : Edit
			{
				property = "#BuildingClass";
				typeName = "String";
				displayName = "Building Class";
				defaultValue = "";
				expression = _this setVariable ["#BuildingClass", _value];
			};		
			
			class DrawBuildingMarkerIcon : Checkbox
			{
				property = "#DrawBuildingMarkerIcon";
				displayName = "Draw building marker icon";
				defaultValue = "true";
				expression = _this setVariable ["#DrawBuildingMarkerIcon", _value];
			};		

			class BuildingMarker : Edit
			{
				property = "#BuildingMarker";
				typeName = "String";
				displayName = "Building Marker";
				defaultValue = "";
				expression = _this setVariable ["#BuildingMarker", _value];
			};		

			class ModuleDescription: ModuleDescription{};
		};
		
		class ModuleDescription: ModuleDescription
		{
		};	
		
	};
	
	#include "Modules\ModuleResourceAmmunition\ModuleResourceAmmunition.hpp"
	#include "Modules\ModuleResourceFuel\ModuleResourceFuel.hpp"
	#include "Modules\ModuleResourceRepair\ModuleResourceRepair.hpp"
	#include "Modules\ModuleVehicleResourcesInit\ModuleVehicleResourcesInit.hpp"

	#include "Vehicles\MBT_03\I_MBT_03_cannon_F_LowResources.hpp"
};
