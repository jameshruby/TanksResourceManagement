private _module = _this;
private _building = _module getVariable "#building";

private _pos = getPos _module;	
private _direction = direction _module;

_building setDir _direction;	
_building setPosATL _pos;	