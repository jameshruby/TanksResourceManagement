params["_configName", "_configCondition", "_displayNameParam", "_iconParam"];

private _configData = _configCondition configClasses(configFile >> _configName);
private _allData = [];
{
	 private _configName = configName _x;
	 private _displayName = getText(_x >> _displayNameParam);
	 private _editorPreview = getText( _x >>_iconParam);
	 private _dlcLogo = if (configsourcemod _x == '') then {''} else {modParams [configsourcemod  _x,['logo']] param [0,'']};	

	_allData pushBack [_configName, _displayName, _editorPreview, _dlcLogo];
} forEach _configData; 
_allData