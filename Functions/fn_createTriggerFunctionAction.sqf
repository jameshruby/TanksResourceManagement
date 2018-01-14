params["_pos", "_radius", "_actionFncParams"];

private _trigger =	 createTrigger ["EmptyDetector", _pos];
_trigger setTriggerTimeout [0, 0, 0, true];
_trigger setTriggerArea [_radius, _radius, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
	"this && vehicle player in thisList", 	 
	format["_actionId = [vehicle player, %1] call TM_fnc_addResourceAction; vehicle player setVariable['actionId', _actionId]",  _actionFncParams], //vehicle player setFuel 1 ((Fuel _target) + 0.2)    [] spawn TM_fnc_zone_room_in   vehicle player call TM_fnc_resourceRefuel;
	"[vehicle player, ((vehicle player) getVariable 'actionId')] call BIS_fnc_holdActionRemove"
]; 