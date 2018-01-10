params["_pos", "_radius", "_direction"];

private _fuel = createVehicle ["Land_RepairDepot_01_civ_F_NoFunction", [_pos select 0, _pos select 1, _pos select 2], [], 0, "CAN_COLLIDE"];
_fuel allowDamage false;
_fuel setVectorUp [0, 0, 1];
//_fuel setDir (_direction - 90);	

[_fuel, "loc_RepairStation"] call TM_fnc_addMarkerBoundAreaIcon;

private _trigger =	 createTrigger ["EmptyDetector", _pos];
//_trigger setTriggerText _triggerName;
_trigger setTriggerTimeout [0, 0, 0, true];
_trigger setTriggerArea [_radius, _radius, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
	"this && vehicle player in thisList && damage vehicle player < 1", 	 
	"_actionId= vehicle player call TM_fnc_resourceRepairAddAction; vehicle player setVariable['actionId', _actionId]", //vehicle player setFuel 1 ((Fuel _target) + 0.2)    [] spawn TM_fnc_zone_room_in   vehicle player call TM_fnc_resourceRefuel;
	"[vehicle player, ((vehicle player) getVariable 'actionId')] call BIS_fnc_holdActionRemove"
]; 

// private _pos = getPos _trigger;
// private _markern = format[ "debugMark_%1", str _pos];
// _markerstr = createMarker [_markern, _pos];	
// _markerstr setMarkerShape "ELLIPSE";
// _markerstr setMarkerType "Empty";
// _markerstr setMarkerColor "ColorBlue";
// _markerstr setMarkerSize [_radius, _radius];

// private _synced =  synchronizedObjects _module;
// if (count _synced > 0) then {
// 	{
// 		null = [_x, _radiationRadius, _radiationDamage] spawn AL_fnc_radiationEmittor;
// 	} forEach synchronizedObjects _module;
// } else {
// 	null = [getPosATL _module, _radiationRadius, _radiationDamage] spawn AL_fnc_radiationEmittor;
// };