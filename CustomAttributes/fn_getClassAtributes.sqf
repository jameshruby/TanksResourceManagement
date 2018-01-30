params["_configName", "_configCondition", "_displayNameParam", "_iconParam", "_subConfigArray"];

private _configToQuery = configFile >> _configName;

if (!isNil "_subConfigArray" && count _subConfigArray > 0) then {
	{
		_configToQuery = (_configToQuery >> _x);			
	} forEach _subConfigArray;		
};

private _configData = _configCondition configClasses(_configToQuery);

private _allData = [];
{
	 private _configName = configName _x;
	 private _displayName = getText(_x >> _displayNameParam);
	 private _editorPreview = if (_iconParam == '') then {''} else {getText( _x >>_iconParam);};
	 private _dlcLogo = if (configsourcemod _x == '') then {''} else {modParams [configsourcemod  _x,['logo']] param [0,'']};	

	_allData pushBack [_configName, _displayName, _editorPreview, _dlcLogo];
} forEach _configData; 
_allData


