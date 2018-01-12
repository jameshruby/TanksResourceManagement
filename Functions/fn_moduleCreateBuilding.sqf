private _module = _this; 
private _pos = getPos _module;	
private _direction = direction _module;

private _buildingMarker = _module getVariable "#BuildingMarker";
private _buildingClass = _module getVariable "#BuildingClass";
private _drawBuildingMarkerIcon = _module getVariable "#DrawBuildingMarkerIcon";

private _building = [_buildingClass, _pos, _direction, _buildingMarker, _drawBuildingMarkerIcon] call TM_fnc_createMapEditorBuilding;
//	_building setPos _pos;	

_module setVariable ["#building", _building];
_building