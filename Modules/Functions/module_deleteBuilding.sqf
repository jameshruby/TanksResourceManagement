/*
Author: Hrubyjak

Description:
Removes building and its marker from the world

Parameter(s):

Returns:
Nothing
*/

private _module = _this;
private _building = _module getVariable "#building";
private _marker = _module getVariable "#buildingMarker";

deleteMarker _marker;
deleteVehicle _building;