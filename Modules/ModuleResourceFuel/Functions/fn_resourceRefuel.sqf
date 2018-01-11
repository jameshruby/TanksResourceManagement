params["_pos", "_radius", "_direction"];

private _trigger =	 createTrigger ["EmptyDetector", _pos];
//_trigger setTriggerText _triggerName;
_trigger setTriggerTimeout [0, 0, 0, true];
_trigger setTriggerArea [_radius, _radius, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
	"this && vehicle player in thisList", 	 
	"_actionId = vehicle player call TM_fnc_resourceRefuelAddAction; vehicle player setVariable['actionId', _actionId]", //vehicle player setFuel 1 ((Fuel _target) + 0.2)    [] spawn TM_fnc_zone_room_in   vehicle player call TM_fnc_resourceRefuel;
	"[vehicle player, ((vehicle player) getVariable 'actionId')] call BIS_fnc_holdActionRemove"
]; 


// private _synced =  synchronizedObjects _module;
// if (count _synced > 0) then {
// 	{
// 		null = [_x, _radiationRadius, _radiationDamage] spawn AL_fnc_radiationEmittor;
// 	} forEach synchronizedObjects _module;
// } else {
// 	null = [getPosATL _module, _radiationRadius, _radiationDamage] spawn AL_fnc_radiationEmittor; 
// };