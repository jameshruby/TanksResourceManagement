if (!isServer) exitWith{}; //we dont want each client to create a building

private _module = _this; 

private _pos = getPos _module;	
private _direction = direction _module;
private _buildingMarker = _module getVariable "#BuildingMarker";
private _buildingClass = _module getVariable "#BuildingClass";
private _drawBuildingMarkerIcon = _module getVariable "#DrawBuildingMarkerIcon";

private _building = [_buildingClass, _pos, _direction] call TM_fnc_createMapEditorBuilding;
_module setVariable ["#building", _building];

if (_drawBuildingMarkerIcon) then {
	private _bMarker = [_building, _buildingMarker] call TM_fnc_createLocationMarkerIcon;
	_module setVariable ["#buildingMarker", _bMarker];
};

