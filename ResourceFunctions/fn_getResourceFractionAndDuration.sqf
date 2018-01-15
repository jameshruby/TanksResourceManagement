/*
Author: Hrubyjak

Description:
Calculate how much of given resource will be added in holdActon tick, to replenish 
given resource on full progress of holdAction, and how long it will take

!IMPORTANT: Overwrite this function in specifc module, 
to add desired resource to the target, this function is not to be
called directly (unless debug). 

Parameter(s):
_this select 0: OJBECT - players vehicle for which the resource is calculated
_this select 1: NUMBER - _holdActionProgress - constant(24) number of ticks in holdAction
_this select 2: NUMBER - _holdActionDuration - total duration of holdAction
	
Returns:
_this select 0: NUMBER - how much of given resource will be added
_this select 1: NUMBER - how long it will take to replenish the resource fully
*/

call TM_fnc_baseFunctionException



