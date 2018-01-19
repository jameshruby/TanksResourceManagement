private _configCondition = _this;
if (isNil "_configCondition") then {
	_configCondition = "true";
};
 
private _configName = "cfgVehicles";
private _displayNameParam = "displayName";
private _iconParam = "editorPreview";

[_configName, _configCondition, _displayNameParam, _iconParam] call TM_fnc_getClassAtributes