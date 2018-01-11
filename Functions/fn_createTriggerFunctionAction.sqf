params["_pos", "_radius", "_functionName"];

private _trigger =	 createTrigger ["EmptyDetector", _pos];
//_trigger setTriggerText _triggerName;
_trigger setTriggerTimeout [0, 0, 0, true];
_trigger setTriggerArea [_radius, _radius, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
	"this && vehicle player in thisList", 	 
	"_actionId = vehicle player call ; vehicle player setVariable['actionId', _actionId]", //vehicle player setFuel 1 ((Fuel _target) + 0.2)    [] spawn TM_fnc_zone_room_in   vehicle player call TM_fnc_resourceRefuel;
	"[vehicle player, ((vehicle player) getVariable 'actionId')] call BIS_fnc_holdActionRemove"
]; 



TM_fnc_resourceRefuelAddAction