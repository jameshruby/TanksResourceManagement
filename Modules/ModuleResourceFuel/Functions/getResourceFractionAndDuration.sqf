params["_object", "_holdActionMaxProgress", "_maxDuration"];
private _maxFuel = 1.01;
private _missingFuel = _maxFuel - fuel _object;
private _actionFuelFraction = (_missingFuel/_holdActionMaxProgress);
private _holdActionDuration = _missingFuel * _maxDuration;

[_actionFuelFraction, _holdActionDuration]