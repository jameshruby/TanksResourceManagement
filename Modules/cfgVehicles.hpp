class Logic;
class Module_F: Logic
{
	class AttributesBase
	{
		class Edit;
		class Combo;
		class Checkbox;
		class CheckboxNumber;
		class ModuleDescription;
	};
	
	class ModuleDescription;
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
	
	function = "TM_fnc_module_tanksResourceBuildingModule";			

	class ResourcesModuleParams//mod specific
	{	
		holdActionMaxProgress = 24;

		title = $STR_TM_HoldAction_unknown;
		idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";
		progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";
		
		cfgVehiclesQuery = "false";// "false" configClasses(configFile >> "cfgVehicles")
		custoModuleFunctions[] = {};
	};
	
	class AttributeValues
	{
		size3[] = {10,10,0};
		isRectangle = 0;
	};

	class Attributes : AttributesBase
	{
		class MaxDuration
		{
			property = "#MaxDuration";
			displayName = $STR_MaxDurationDisplayName;
			tooltip = $STR_MaxDurationTooltip;
			control = "TankResources_maxHoldActonDuration";
			defaultValue = "30";
			expression = _this setVariable ["#MaxDuration", _value, true];
		};

		class CreateBuilding 
		{
			property = "#CreateBuilding";
			displayName = $STR_TM_CreateBuilding;
			tooltip = $STR_TM_ResourceCreateBuildingTooltip;
			control = "CheckBox_BuildingType";
			defaultValue = "true";
			expression = _this setVariable ["#CreateBuilding", _value];
		};		

		class BuildingType 
		{
			property = "#BuildingClass";
			typeName = "String";
			control = "BuildingType";
			tooltip = $STR_TM_BuildingTypeTooltip;
			displayName = $STR_TM_BuildingClassDisplayName;
			expression = _this setVariable ["#BuildingClass", _value];
		};
	
		class DrawBuildingMarkerIcon 
		{
			property = "#DrawBuildingMarkerIcon";
			displayName = $STR_TM_AttrributeDrawBuildingMarkerIcon;
			tooltip = $STR_TM_ResourceCreateBuildingMarkerIconTooltip;
			control = "CheckBox";
			defaultValue = "true";
			expression = _this setVariable ["#DrawBuildingMarkerIcon", _value];
		};		
		class ModuleDescription: ModuleDescription{};
	};
	
	class ModuleDescription: ModuleDescription{};	
	
};

#include "ModuleResourceAmmunition\ModuleResourceAmmunition.hpp"
#include "ModuleResourceFuel\ModuleResourceFuel.hpp"
#include "ModuleResourceRepair\ModuleResourceRepair.hpp"