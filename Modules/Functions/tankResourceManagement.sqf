
//Initializes the module function, should be called only once at the start of the mission
private _main = {
	private _module = _this;
	private _resourceSpecificParams = _module call _loadResourceSpecificParams;
	_resourceSpecificParams call _createTriggerFunctionAction;
};

//Forms resource action parameters, some of these are taken from the module itself, others are loaded
//from the ResourcesModuleParams subclass of given module. The parameteres are passed to trigger, and 
//subsequently to hold action itself
private _loadResourceSpecificParams = {
	private _module = _this;

	private _moduleName = typeof _module;
	private _pos = getPos _module;
	private _area = _module getVariable "objectArea";	
	private _radius = [_area select 0, _area select 1];

	private _maxDuration = _module getVariable "#MaxDuration";
	private _resourcesModuleParams =  (configFile >> "CfgVehicles" >> _moduleName >> "ResourcesModuleParams");

	private _title = getText(_resourcesModuleParams >> "title");
	private _holdActionMaxProgress = getNumber(_resourcesModuleParams >> "holdActionMaxProgress");

	private _idleIcon = getText(_resourcesModuleParams >> "idleIcon");
	private _progressIcon = getText(_resourcesModuleParams >> "progressIcon");

	private _custoModuleFunctions = getArray(_resourcesModuleParams >> "custoModuleFunctions");

	[_moduleName, _custoModuleFunctions] call _getResourceModuleFunctions;	

	//[] call (missionNamespace getVariable (_moduleName +"_fnc_init"));

	[
		_pos, _radius,
		[
			_title,
			[_maxDuration, _holdActionMaxProgress],
			_moduleName,
			[_idleIcon, _progressIcon]
		]
	]
};

//Loads module functions
private _getResourceModuleFunctions = {
	private _moduleName = _this select 0;
	private _customModuleFunctions = _this select 1;

	private _functionNames = 
	[
		"init",
		"getResourceFractionAndDuration",
		"addResourceFraction"
	];

	_functionNames append _customModuleFunctions;

	_path = "\A3\TanksResourceManagement\Modules\" + _moduleName + "\Functions\";
	[
		_path,
		_moduleName + "_fnc_",
		_functionNames
	] call bis_fnc_loadFunctions;
};

/*
	I would probably need to check that theres vehicle in the trigger 
	and so to blah
	or 

	other version possible 
*/


//Creates trigger on given position which will add the holdAction to given player whene activated. 
//Player needs to be effective commmander of vehicle.
private _createTriggerFunctionAction = {
	params["_pos", "_radius", "_actionFncParams"];
	private _trigger =	 createTrigger ["EmptyDetector", _pos];
	_trigger setTriggerTimeout [0, 0, 0, true];
	_trigger setTriggerArea [_radius select 0, _radius select 1, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerStatements [
		"this && vehicle player != player && vehicle player in thisList", // && player == effectiveCommander vehicle player 
		format["_actionId = [vehicle player, %1] call TM_fnc_addResourceAction; vehicle player setVariable['actionId', _actionId]",  _actionFncParams], //vehicle player setFuel 1 ((Fuel _target) + 0.2)    [] spawn _zone_room_in   vehicle player call _resourceRefuel;
		"[vehicle player, ((vehicle player) getVariable 'actionId')] call BIS_fnc_holdActionRemove"
	];
};

_this call _main;