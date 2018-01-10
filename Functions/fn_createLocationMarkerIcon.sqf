params["_object", "_iconType"];
private _pos = getPosATL _object;
private _markerName = format[ "bound_%1",  str _pos];
private _markerstr = createMarker [_markerName, _pos]; 
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType _iconType;
