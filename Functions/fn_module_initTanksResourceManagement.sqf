/*
Author: Hrubyjak

Description:
Initializes the module function, should be called only once at the start of the mission

Parameter(s):
_this: OBJECT - resource module 

Returns:
Nothing
*/

private _module = _this;
private _resourceSpecificParams = _module call TM_fnc_loadResourceSpecificParams;
_resourceSpecificParams call TM_fnc_createTriggerFunctionAction;