class TankResources_maxHoldActonDuration: Slider
{
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