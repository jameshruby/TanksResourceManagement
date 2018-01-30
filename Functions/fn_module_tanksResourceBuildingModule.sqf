/*
Author: Hrubyjak

Description:
Module function common for all vehicle resources modules
*/
private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
_module = _input param [0,objNull,[objNull]];

switch _mode do {	
	case "init": {
		_isActivated = _input param [1,true,[true]];
		if (is3DEN) exitWith{};
		[] call TM_fnc_module_loadLocalFunctions;

		if (_module getVariable "#CreateBuilding") then {
			_module call TM_fnc_module_createBuilding;	
		};		
		if (_isActivated) then {	
			_module call TM_fnc_module_initTanksResourceManagement;
		};
	};
	case "attributesChanged3DEN": {// When some attributes were changed (including position and rotation)
		private _initializedTwice = _module getVariable ["#_initializedTwice", false];	
		private _initialized = _module getVariable ["#initialized",false];
		if (!_initialized || _initializedTwice) then
		{
			[] call TM_fnc_module_loadLocalFunctions;
			_module setVariable ["#initialized", true];
			_module setVariable ["#_initializedTwice",false]; 		
		};	
		_module setVariable ["#_initializedTwice",true];		
		
		//we need to recreate the building each time in case that building type is changed 
		if (!isNull (_module getVariable ["#building", objNull])) then {
			_module call TM_fnc_module_deleteBuilding; 
		};

		if (_module getVariable "#CreateBuilding") then {
			_module call TM_fnc_module_createBuilding;
			_module call TM_fnc_module_setBuildingDirPos;
		};
	};
	case "registeredToWorld3DEN": {// When added to the world (e.g., after undoing and redoing creation)
		_module call TM_fnc_module_createBuilding;
	};
	case "unregisteredFromWorld3DEN": {// When removed from the world (i.e., by deletion or undoing creation)
		if (_module getVariable "#CreateBuilding") then {
			_module call TM_fnc_module_deleteBuilding;
		};
	};
	case "dragged3DEN": {// When object is being dragged
		if (_module getVariable "#CreateBuilding") then {
			_module call TM_fnc_module_setBuildingDirPos;
		};
	};
};
true