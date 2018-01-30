/*
	set the aproximate maxTime which will take for vehicle to deplete its fuel
*/

private _maxTime = _this; 
private _vehicle = vehicle player;

private _vehicleMaxSpeed = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed");
private _maxTimeInSec = _maxTime * 60;

while{true} do {
	private _fuelConsumptionRate = (speed _vehicle / _vehicleMaxSpeed)/_maxTimeInSec;
	_vehicle setFuel (fuel _vehicle - _fuelConsumptionRate);
	sleep 1;
};