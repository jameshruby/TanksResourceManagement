/*
Author: Hrubyjak

Description:
Creates trigger on given position which will add the holdAction to given
player whene activated. Player needs to be effective commmander of vehicle.

Parameter(s):
_this select 0: ARRAY - trigger position  
_this select 1: NUMBER - trigger radius 
_this select 2: ARRAY - function parameteres created by loadResourceSpecificParams function
	
Returns:
Nothing
*/

params["_pos", "_radius", "_actionFncParams"];

private _trigger =	 createTrigger ["EmptyDetector", _pos];
_trigger setTriggerTimeout [0, 0, 0, true];
_trigger setTriggerArea [_radius, _radius, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
	"this && vehicle player != player && player == effectiveCommander vehicle player && vehicle player in thisList", 	 
	format["_actionId = [vehicle player, %1] call TM_fnc_addResourceAction; vehicle player setVariable['actionId', _actionId]",  _actionFncParams], //vehicle player setFuel 1 ((Fuel _target) + 0.2)    [] spawn TM_fnc_zone_room_in   vehicle player call TM_fnc_resourceRefuel;
	"[vehicle player, ((vehicle player) getVariable 'actionId')] call BIS_fnc_holdActionRemove"
]; 




