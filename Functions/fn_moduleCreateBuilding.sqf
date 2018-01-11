params["_module", "_buildingClass", "_buildingMarker"];
private _pos = getPos _module;	
private _direction = direction _module;
private _building = [_buildingClass, _pos, _direction, _buildingMarker] call TM_fnc_createMapEditorBuilding;
_module setVariable ["#building", _building];
_building