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