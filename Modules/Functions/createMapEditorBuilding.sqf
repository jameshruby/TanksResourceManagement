/*
Author: Hrubyjak

Description:
Create building(object) of given cfgVehicle class on given pos with given dir
for the sake of module functionality, the damage and simulation is disabled.

This prevents situation, where module trigger would be created on one place, and building would be standing elsewhere
due too colisions, or player interaction such as moving the building with heavy vehicle

Parameter(s):
_this select 0: STRING - CfgVehicles classname of building(object) 
_this select 1: ARRAY - position(ATL) where the building should be placed 
_this select 2: NUMBER - direction which the building will face 
	
Returns:
the building object
*/

params["_buildingClass","_pos", "_direction"];

private _building = createVehicle [_buildingClass, _pos, [], 0, "CAN_COLLIDE"];
_building allowDamage false;
_building enableSimulation false;

_building setVectorUp [0, 0, 1];
_building setDir (_direction); 
_building setPosATL _pos;
_building allowDamage false;

_building