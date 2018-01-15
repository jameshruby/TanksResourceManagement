params["_buildingClass","_pos", "_direction", "_buildingMarker", "_drawBuildingMarkerIcon"];

private _building = createVehicle [_buildingClass, [_pos select 0, _pos select 1, -1], [], 0, "CAN_COLLIDE"];
_building allowDamage false;
_building enableSimulation false;

_building setVectorUp [0, 0, 1];
_building setDir (_direction); 
_building allowDamage false;

if (_drawBuildingMarkerIcon) then {
	[_building, _buildingMarker] call TM_fnc_createLocationMarkerIcon;
};

_building