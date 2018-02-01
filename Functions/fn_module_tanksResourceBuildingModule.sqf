/*
Author: Hrubyjak

Description:
Module function common for all vehicle resources modules
*/

private _main = {
	private _mode = param [0,"",[""]];
	private _input = param [1,[],[[]]];
	_module = _input param [0,objNull,[objNull]];

	switch _mode do {	
		case "init": {
			_isActivated = _input param [1,true,[true]];
			if (is3DEN) exitWith{};
			[] call _loadLocalFunctions;

			if (_module getVariable "#CreateBuilding") then {
				_module call _createBuilding;	
			};		
			if (_isActivated) then {	
				_module call TM_fnc_tankResourceManagement;
			};
		};
		case "attributesChanged3DEN": {// When some attributes were changed (including position and rotation)
			//we need to recreate the building each time in case that building type is changed 
			if (!isNull (_module getVariable ["#building", objNull])) then {
				_module call _deleteBuilding; 
			};

			if (_module getVariable "#CreateBuilding") then {
				_module call _createBuilding;
				_module call _setBuildingDirPos;
			};
		};
		case "registeredToWorld3DEN": {// When added to the world (e.g., after undoing and redoing creation)
			_module call _createBuilding;
		};
		case "unregisteredFromWorld3DEN": {// When removed from the world (i.e., by deletion or undoing creation)
			if (_module getVariable "#CreateBuilding") then {
				_module call _deleteBuilding;
			};
		};
		case "dragged3DEN": {// When object is being dragged
			if (_module getVariable "#CreateBuilding") then {
				_module call _setBuildingDirPos;
			};
		};
	};
	true
};

private _loadLocalFunctions = {
	_path = "A3\TanksResourceManagement\Modules\Functions\";
	[
		_path,
		"TM_fnc_",
		[
		"addResourceAction",
		"tankResourceManagement",
		"getResourceAcquisitionDuration"
		]
	] call bis_fnc_loadFunctions;	
};

//Creates module building and its map marker if selected, module position and direction is used for building placement
private _createBuilding = {
	if (!isServer) exitWith{}; //we dont want each client to create a building

	private _module = _this; 

	private _pos = getPos _module;	
	private _direction = direction _module;
	private _buildingMarker = getText(configFile >> "CfgVehicles" >>  typeof _module >> "buildingMarkerType"); 
	private _buildingClass = _module getVariable "#BuildingClass";
	private _drawBuildingMarkerIcon = _module getVariable "#DrawBuildingMarkerIcon";

	private _building = [_buildingClass, _pos, _direction] call _createMapEditorBuilding;
	_module setVariable ["#building", _building];

	if (_drawBuildingMarkerIcon) then {
		private _bMarker = [_building, _buildingMarker] call _createLocationMarkerIcon;
		_module setVariable ["#buildingMarker", _bMarker];
	};
};

private _deleteBuilding = {
	private _module = _this;
	private _building = _module getVariable "#building";
	private _marker = _module getVariable "#buildingMarker";

	deleteMarker _marker;
	deleteVehicle _building;
};

// Create building(object) of given cfgVehicle class on given pos with given dir for the sake of module functionality, 
// the damage and simulation is disabled. This prevents situation, where module trigger would be created on one place,
//and building would be standing elsewhere due too colisions, or player interaction such as moving the building with heavy vehicle
private _createMapEditorBuilding = {
	params["_buildingClass","_pos", "_direction"];

	private _building = createVehicle [_buildingClass, _pos, [], 0, "CAN_COLLIDE"];
	_building allowDamage false;
	_building enableSimulation false;

	_building setVectorUp [0, 0, 1];
	_building setDir (_direction); 
	_building setPosATL _pos;
	_building allowDamage false;

	_building
};

private _setBuildingDirPos = {
	private _module = _this;
	private _building = _module getVariable "#building";
	private _buildingMarker = _module getVariable "#buildingMarker";

	private _pos = getPos _module;	
	private _direction = direction _module;

	_building setDir _direction;	
	_building setPosATL _pos;	

	_buildingMarker setMarkerPos _pos;
};

//Creates a building marker icon, which is used as replacement for regular map icon
//Eq. fuelStation created by the module is having same icon as the fuel stations which are part of the map
private _createLocationMarkerIcon = {
	params["_object", "_iconType"];
	private _pos = getPosATL _object;
	private _markerName = format[ "bound_%1",  str _pos];
	private _markerstr = createMarker [_markerName, _pos]; 
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerType _iconType;
	_markerstr
};

_this call _main