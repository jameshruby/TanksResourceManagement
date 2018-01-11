private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
_module = _input param [0,objNull,[objNull]];

private _buildingMarker = _module getVariable "#BuildingMarker";
private _buildingClass = _module getVariable "#BuildingClass";

private _pos = getPos _module;	
private _direction = direction _module;
	
switch _mode do {	
	case "init": {
		_isActivated = _input param [1,true,[true]];// _logic = _input param [0,objNull,[objNull]]; // Module logic
		
		["FAF %1", _module getVariable "#building"] call bis_fnc_logFormat;
		if (is3DEN) exitWith{};
		
		private _building = [_module, _buildingClass, _buildingMarker] call TM_fnc_moduleCreateBuilding;	
		_building setPos _pos;	
		private _area = _module getVariable "objectArea";	
		
		if (_isActivated) then {	
			["FAF init AF %1",typeName _module ] call bis_fnc_logFormat;
			private _radius = (_area select 0) max (_area select 1);
			private _functionNameToExecute =  getText(configFile >> "CfgVehicles" >> typeof _module >> "functionSpecific");;
			[_pos, _radius] call (missionNamespace getVariable [_functionNameToExecute,{}]);
		};
	};
	case "attributesChanged3DEN": {// When some attributes were changed (including position and rotation)
		//as loading/undoing will hit only this event...
		private _initialized = _module getVariable ["#initialized",false];
		if (!_initialized) then
		{
			[_module, _buildingClass, _buildingMarker] call TM_fnc_moduleCreateBuilding;
			_module setVariable ["#initialized",true];
		};	

		["FAF attributesChanged3DEN %1", _module getVariable "#building"] call bis_fnc_logFormat;
		private _building = _module getVariable "#building";
		_building setDir _direction;	
		_building setPos _pos;	
	};
	case "registeredToWorld3DEN": {// When added to the world (e.g., after undoing and redoing creation)
		[_module, _buildingClass, _buildingMarker] call TM_fnc_moduleCreateBuilding;
		["FAF registeredToWorld3DEN %1", _module getVariable "#building"] call bis_fnc_logFormat;
	};
	case "unregisteredFromWorld3DEN": {// When removed from the world (i.e., by deletion or undoing creation)
		["FAF unregisteredToWorld3DEN %1", _module getVariable "#building"] call bis_fnc_logFormat;

		private _building = _module getVariable "#building";
		deleteVehicle _building;
	};
	case "dragged3DEN": {// When object is being dragged
		["FAF dragged3DEN %1", _module getVariable "#building"] call bis_fnc_logFormat;
		
		private _building = _module getVariable "#building";
		_building setDir _direction;	
		_building setPos _pos;	
	};
};
true



