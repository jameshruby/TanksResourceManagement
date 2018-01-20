/*
Author: Hrubyjak

Description:
Creates a building marker icon, which is used as replacement for regular map icon
Eq. fuelStation created by the module is having same icon as the fuel stations which 
are part of the map

Parameter(s):
_this select 0: STRING - Asset type, can be:
_this select 1: STRING - CfgMarkers Classname of desired marker 
	
Returns:
Nothing
*/

params["_object", "_iconType"];
private _pos = getPosATL _object;
private _markerName = format[ "bound_%1",  str _pos];
private _markerstr = createMarker [_markerName, _pos]; 
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType _iconType;
_markerstr