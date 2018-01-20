/*
Author: Hrubyjak

Description:
Calculates total duration of resource action
The resource ammount should be in 0 - 1 range, in other words, to get 1(00%) of resource 
it will take _maxDuration to complete

Use in getResourceFractionAndDuration function of your module if viable

Parameter(s):
_this select 0: NUMBER - resource amount
_this select 1: NUMBER - max duration
	
Returns:
NUMBER - hold action duration
*/

params["_resourceAmount", "_maxDuration"];
private _holdActionDuration = _resourceAmount * _maxDuration;
_holdActionDuration