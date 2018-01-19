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
				_cparams = [] call TM_fnc_getAllCfgMarkerAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
		};
	};
};


class RepairDepotType: Combo
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onload = "\
				_control = _this select 0;\
				_cparams = 'configName _x isKindOf(''Land_RepairDepot_01_base_F'') && getNumber (_x >> ''transportRepair'') == 0' call TM_fnc_getAllCfgVehiclesAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
		};
	};
};

class AmmunutionDepotType: Combo
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onload = "\
				_control = _this select 0;\
				_cparams = 'configName _x isKindOf(''B_Slingload_01_Ammo_F'') && getNumber (_x >> ''transportAmmo'') == 0' call TM_fnc_getAllCfgVehiclesAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
		};
	};
};

class FuelDepotType: Combo
{
	class Controls: Controls
	{
		class Title: Title{};
		class Value: Value
		{
			onload = "\
				_control = _this select 0;\
				_cparams = '(configName _x find ''Land_fs'') == 0' call TM_fnc_getAllCfgVehiclesAttributes;\
				[_cparams, _control]  call TM_fnc_loadClassAttributes;\
			";
		};
	};
};