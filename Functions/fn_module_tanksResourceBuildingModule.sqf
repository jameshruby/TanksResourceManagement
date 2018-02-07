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
			if (is3DEN) then {
				[] call _drawEhAdd; 
			} else {
				_isActivated = _input param [1,true,[true]];
				[] call _loadLocalFunctions;

				private _building = objNull; 
				if (_module getVariable "#CreateBuilding") then {
					_building = _module call _createBuilding;	
				} else {
					//we can do it like this,as module is snapped at exact building position
					private _terrainBuildingRadius = 0;
					private _buildings = [_module, _terrainBuildingRadius] call _getTerrainBuildings;
					_building = [_module, _buildings] call _getTerrainBuilding;
					if (isNull _building) exitWith {};
					_module setVariable ["#building",_building];
				};		

				if (_module getVariable "#DrawBuildingMarkerIcon") then {
					[_module, _building] call _createLocationMarker;
				};

				if (_isActivated) then {	
					_module call TM_fnc_tankResourceManagement;
				};
			};
		};
		case "attributesChanged3DEN": { // When some attributes were changed (including position and rotation)
			//we need to recreate the building each time in case that building type is changed 
			if (!(_module getVariable "#isTerrainObject") && !isNull (_module getVariable ["#building", objNull])) then {
				_module call _deleteBuilding; 
			};

			private _building = objNull;
			if (_module getVariable "#CreateBuilding") then {
				_building = _module call _createBuilding;
				_module call _setBuildingDirPos;
				_module setVariable ["#isTerrainObject", false];
			} else {
				_building = _module call _useTerrainObject;
				_module setVariable ["#isTerrainObject", true];
			};

			if (_module getVariable ["#buildingMarker", ""] != "") then {
				_module call _deleteMarker;
			};
			if (_module getVariable "#DrawBuildingMarkerIcon") then {
				[_module, _building] call _createLocationMarker;
				//_module call _setMarkerPos;
			};
		};
		case "getBuildingBBox": {
			//we cant make local fnc, for the sake of scopinh
			private _building = _input param [1,objNull,[objNull]];
			if (isNull _building) exitWith {[]};

			private _bbox = boundingBoxReal _building;
			_bbox params ["_point1","_point2"];

			_point1 params ["_x1","_y1","_z1"];
			_point2 params ["_x2","_y2","_z2"];

			#define A		(_building modelToWorldVisual [_x1,_y1,_z1])
			#define B		(_building modelToWorldVisual [_x2,_y1,_z1])
			#define C		(_building modelToWorldVisual [_x2,_y1,_z2])
			#define D		(_building modelToWorldVisual [_x1,_y1,_z2])
			#define E		(_building modelToWorldVisual [_x1,_y2,_z1])
			#define F		(_building modelToWorldVisual [_x2,_y2,_z1])
			#define G		(_building modelToWorldVisual [_x2,_y2,_z2])
			#define H		(_building modelToWorldVisual [_x1,_y2,_z2])

			#define COLOR_HIGHLIGHT							[1,0,1,1]

			private _edges =
			[
				[A,B,COLOR_HIGHLIGHT],
				[B,C,COLOR_HIGHLIGHT],
				[C,D,COLOR_HIGHLIGHT],
				[D,A,COLOR_HIGHLIGHT],
				[E,F,COLOR_HIGHLIGHT],
				[F,G,COLOR_HIGHLIGHT],
				[G,H,COLOR_HIGHLIGHT],
				[H,E,COLOR_HIGHLIGHT],
				[A,E,COLOR_HIGHLIGHT],
				[B,F,COLOR_HIGHLIGHT],
				[C,G,COLOR_HIGHLIGHT],
				[D,H,COLOR_HIGHLIGHT] 
			];

			_edges
		};
		case "registeredToWorld3DEN": {// When added to the world (e.g., after undoing and redoing creation)
			private _building  = _this call _createBuilding;
			[_this, _building] call _createLocationMarker;
		};
		case "unregisteredFromWorld3DEN": {// When removed from the world (i.e., by deletion or undoing creation)
			if (_module getVariable "#CreateBuilding") then {
				_module call _deleteBuilding;
			};
			if (_module getVariable "#DrawBuildingMarkerIcon") then {
				_module call _deleteMarker;
			};
			
			[] call _drawEhRemove;
		};
		case "dragged3DEN": {// When object is being dragged
			if (_module getVariable "#CreateBuilding") then {
				_module call _setBuildingDirPos; 
			};
			if (_module getVariable "#DrawBuildingMarkerIcon") then {
				_module call _setMarkerPos;
			};
		};

	};
};

private _drawEhRemove = {
	//remove 'Draw3D' eh if last module is removed
	private _modules = (all3DENEntities param [3,[]]) select { _x isKindOf "ResourceModulesArea" && {_x != _module}};
	if (count _modules == 0) then
	{
		private _ehDraw3D = missionNamespace getVariable ["resourceModules_ehDraw3D",-1];
		if (_ehDraw3D != -1) then
		{
			removeMissionEventHandler ["Draw3D",_ehDraw3D];
			missionNamespace setVariable ["resourceModules_ehDraw3D",-1];
		};
	};
	private _building = _module getVariable "#building";	
	_building setVariable["#marriedTo", objNull];
};

private _drawEhAdd = {
	private _ehDraw3D =  missionNamespace getVariable ["resourceModules_ehDraw3D",-1];
	if (_ehDraw3D == -1) then {
		_ehDraw3D = addMissionEventHandler ["Draw3D", {
			private _module = ((get3DENSelected "logic") select {_x isKindOf "ResourceModulesArea"}) param [0,objNull];
			if (isNull _module) exitWith {};
			private _building = _module getVariable ["#building",objNull];
			if (isNull _building) exitWith {};
			//draw bbox
			private _bbox = ["getBuildingBBox",[_module,_building]] call TM_fnc_module_tanksResourceBuildingModule;
			{drawLine3D _x} forEach _bbox;
		}];
		missionNamespace setVariable ["resourceModules_ehDraw3D",_ehDraw3D];
	};
};

private _useTerrainObject = {
	private _module = _this;
	private _terrainBuildingRadius = 15;

	private _buildings = [_module, _terrainBuildingRadius] call _getTerrainBuildingsEden;
	private _building = [_module, _buildings] call _getTerrainBuildingEden;
	_module setVariable ["#building",_building];
	if (isNull _building) exitWith {};
	_module call _setTerrainBuildingEden;
	_building
};

private _getTerrainBuildings = {
	 params["_module", "_terrainBuildingRadius"];
	_buildings = nearestTerrainObjects [_module,["HOUSE"], _terrainBuildingRadius, true, true];
	_buildings
};

private _getTerrainBuildingsEden = {
	 params["_module", "_terrainBuildingRadius"];
	 private _buildings = _this call _getTerrainBuildings;
	_buildings = _buildings select {_m = _x getVariable ["#marriedTo", objNull]; isNull _m || {_module == _m}};
	_buildings
};

private _getTerrainBuilding = {
	_buildings = _this;
	private _building = _buildings param [0,objNull];//use 1st object
	_building
};

private _getTerrainBuildingEden = {
	params["_module", "_buildings"];
	private _building =  _buildings call _getTerrainBuilding;
	if (isNull _building) exitWith {_building};
	
	private _buildingPrev = _module getVariable ["#building", objNull];
	if (!isNull _buildingPrev) then {
		_buildingPrev setVariable["#marriedTo", objNull];
	};
	_building
};

private _setTerrainBuildingEden = {
	private _module = _this;
	private _building = _module getVariable "#building";
	
	//snap module to building	
	private _buildingPos = getPos _building; _buildingPos set [2,0];
	_module set3DENAttribute ["position",_buildingPos];

	_building setVariable["#marriedTo", _module];
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

private _createLocationMarker = {
	params["_module", "_building"];
	private _buildings = _module getVariable "#building";
	if (_module getVariable "#DrawBuildingMarkerIcon") then {
		private _buildingMarker = getText(configFile >> "CfgVehicles" >>  typeof _module >> "buildingMarkerType"); 
		private _bMarker = [_buildings, _buildingMarker] call _createLocationMarkerIcon;
		_module setVariable ["#buildingMarker", _bMarker];
	};
};

//Creates module building and its map marker if selected, module position and direction is used for building placement
private _createBuilding = {
	if (!isServer) exitWith{}; //we dont want each client to create a building

	private _module = _this; 

	private _pos = getPos _module;	
	private _direction = direction _module;
	private _buildingClass = _module getVariable "#BuildingClass";
	
	private _building = [_buildingClass, _pos, _direction] call _createMapEditorBuilding;
	_module setVariable ["#building", _building];
	_building
};

private _deleteMarker = {
	private _module = _this; 
	private _marker = _module getVariable "#buildingMarker";
	deleteMarker _marker;
};

private _deleteBuilding = {
	private _module = _this; 
	private _building = _module getVariable "#building";
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

private _setMarkerPos = {
	private _module = _this;
	private _buildingMarker = _module getVariable "#buildingMarker";
	private _pos = getPos _module;	
	_buildingMarker setMarkerPos _pos;
};

private _setBuildingDirPos = {
	private _module = _this;
	private _building = _module getVariable "#building";

	private _pos = getPos _module;	
	private _direction = direction _module;

	_building setDir _direction;	
	_building setPosATL _pos;	
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