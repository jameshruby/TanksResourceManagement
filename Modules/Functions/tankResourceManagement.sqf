
//Initializes the module function, should be called only once at the start of the mission
private _main = {
	private _module = _this;
	private _resourceSpecificParams = _module call _loadResourceSpecificParams;
	_resourceSpecificParams call _initTriggerHoldAction;
};

//Forms resource action parameters, some of these are taken from the module itself, others are loaded
//from the ResourcesModuleParams subclass of given module. The parameteres are passed to trigger, and 
//subsequently to hold action itself
private _loadResourceSpecificParams = {
	private _module = _this;

	private _moduleName = typeof _module;
	private _pos = getPos _module;
	private _building = _module getVariable "#building";
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

	[
		_building, _radius,
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

//Creates trigger on given position which will add the holdAction to given player whene activated. 
//Player needs to be effective commmander of vehicle.
private _initTriggerHoldAction = {
	params["_building", "_radius", "_actionFncParams"];
	
	_building enableSimulation true; //enable sim again
	private _trigger = createTrigger ["EmptyDetector", getPos _building];	
	
	_building setVariable["#trigger", _trigger];
	_building addEventHandler ["Killed",{
		_trigger = (_this select 0) getVariable "#trigger";
		[_trigger getVariable '#firstVehicle', (_trigger getVariable 'actionId')] call BIS_fnc_holdActionRemove;
		deleteVehicle _trigger;
	}];
	_trigger setVariable ["#building", _building];

	_trigger setTriggerTimeout [0, 0, 0, true];
	_trigger setTriggerArea [_radius select 0, _radius select 1, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerStatements [
		"this && vehicle player in thisList", // && count thisList > 0
		format["_actionId = [vehicle player,thisTrigger, %1] call TM_fnc_addResourceAction; thisTrigger setVariable['actionId', _actionId]",  _actionFncParams],
		"[thisTrigger getVariable '#firstVehicle', (thisTrigger getVariable 'actionId')] call BIS_fnc_holdActionRemove" 
	];
};

_this call _main;
