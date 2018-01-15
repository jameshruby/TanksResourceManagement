/*
Author: Hrubyjak

Description:
Adds fraction of given resource to target.
Function runs on every tick of holdAction

!IMPORTANT: Overwrite this function in specifc module, 
to add desired resource to the target, this function is not to be
called directly (unless debug). 

Parameter(s):
_this select 0: OJBECT - players vehicle to which resource is added
_this select 1: NUMBER - ammount of resource to be added, which is retrieved from getResourceFractionAndDuration
	
Returns:
Nothing
*/

call TM_fnc_baseFunctionException