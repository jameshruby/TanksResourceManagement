private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
_module = _input param [0,objNull,[objNull]];
switch _mode do {
	case "init": {
		// _logic = _input param [0,objNull,[objNull]]; // Module logic
	 	
		_isActivated = _input param [1,true,[true]];
		// private _radiationDamage = _module getVariable ["#EmittorObjectsRadiationDamage", 0.02]; 
		private _area = _module getVariable "objectArea";	
			
		if (_isActivated) then {		// if ((!isServer) && (isNull player)) then {waitUntil {!isNull player};}; //isNull player &&  && time > 0};
			if (is3DEN) exitWith {};
			waitUntil{ time > 0;};
			[] call TM_fnc_vehicleResourcesInit;
	   };
	};
};
true