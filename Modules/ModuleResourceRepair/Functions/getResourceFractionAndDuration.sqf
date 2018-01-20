params["_object", "_holdActionProgress", "_maxDuration"];

private _missingFuel = damage _object;
private _actionRepairFraction = _missingFuel/_holdActionProgress;
private _holdActionDuration = [_missingFuel, _maxDuration] call TM_fnc_getResourceAcquisitionDuration;

[_actionRepairFraction, _holdActionDuration]	