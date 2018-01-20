private _configCondition = _this;
if (isNil "_configCondition") then {
	_configCondition = "true";
};

private _configName = "cfgMarkers";
private _displayNameParam = "name";
private _iconParam = "icon";

[_configName, _configCondition, _displayNameParam, _iconParam] call TM_fnc_getClassAtributes