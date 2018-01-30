class TankResources_maxHoldActonDuration: Slider
{	
	onLoad = "\
		comment 'DO NOT COPY THIS CODE TO YOUR ATTRIBUTE CONFIG UNLESS YOU ARE CHANGING SOMETHING IN THE CODE!';\
		_ctrlGroup = _this select 0;\
		[_ctrlGroup controlsgroupctrl 100,_ctrlGroup controlsgroupctrl 101,''] call bis_fnc_initSliderValue;\
	";
	attributeLoad = "\
		comment 'DO NOT COPY THIS CODE TO YOUR ATTRIBUTE CONFIG UNLESS YOU ARE CHANGING SOMETHING IN THE CODE!';\
		_ctrlGroup = _this;\
		[_ctrlGroup controlsgroupctrl 100,_ctrlGroup controlsgroupctrl 101,'',_value] call bis_fnc_initSliderValue;\
	";
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			sliderRange[] = {1, 40};
			sliderPosition = 30;
			lineSize = 40;
			sliderStep = 1;
		};
		class Edit: Edit{};
	};
};

class CfgMarkerType: Combo
{
	//h = 1 * SIZE_M * GRID_H;
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onload = "\
				_control = _this select 0;\
				_cparams = '!IsNull (_x >> ''markerClass'')' call TM_fnc_getAllCfgMarkerAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
		};
	};
};

class BuildingType: Combo
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onload = "\
				_control = _this select 0;\
				_cparams = [] call TM_fnc_getResourceBuildingAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
		};
	};
};


class CheckBox_BuildingType: Checkbox
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onLoad = "[_this select 0, 'BuildingType'] spawn TM_fnc_controlDisablingOtherControl_load;";
			onCheckedChanged = "[_this select 0, 'BuildingType'] call TM_fnc_controlDisablingOtherControl;";
		};
	};
};

class CheckBox_CreateMarker: Checkbox
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onLoad = "[_this select 0, 'CfgMarkerType'] spawn TM_fnc_controlDisablingOtherControl_load;";
			onCheckedChanged = "[_this select 0, 'CfgMarkerType'] call TM_fnc_controlDisablingOtherControl;";
		};
	};
};

///////////////// other class

class CfgGroupsCombo: Combo
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onload = "\
				_control = _this select 0;\
				_cparams = ['CfgGroups', 'name', 'icon'] call TM_fnc_getAnyCfgAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
			
		};
	};
};

