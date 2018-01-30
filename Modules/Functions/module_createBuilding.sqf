/*
Author: Hrubyjak

Description:
Creates module building and its map marker if selected, 
module position and direction is used for building placement

Parameter(s):
_this: OBJECT - resource action module

Returns:
Nothing
*/

if (!isServer) exitWith{}; //we dont want each client to create a building

private _module = _this; 

private _pos = getPos _module;	
private _direction = direction _module;
private _buildingMarker = getText(configFile >> "CfgVehicles" >>  typeof _module >> "buildingMarkerType"); 
private _buildingClass = _module getVariable "#BuildingClass";
private _drawBuildingMarkerIcon = _module getVariable "#DrawBuildingMarkerIcon";

private _building = [_buildingClass, _pos, _direction] call TM_fnc_createMapEditorBuilding;
_module setVariable ["#building", _building];

if (_drawBuildingMarkerIcon) then {
	private _bMarker = [_building, _buildingMarker] call TM_fnc_createLocationMarkerIcon;
	_module setVariable ["#buildingMarker", _bMarker];
};