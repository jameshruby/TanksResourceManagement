params["_buildingClass","_pos", "_direction", "_buildingMarker"];

private _building = createVehicle [_buildingClass, [_pos select 0, _pos select 1, -1], [], 0, "CAN_COLLIDE"];
_building setVectorUp [0, 0, 1];
_building setDir (_direction); //	_building setDir _direction;		
_building allowDamage false;

//private _buildingMarker = [_building, _buildingMarker] call TM_fnc_createLocationMarkerIcon;
_building