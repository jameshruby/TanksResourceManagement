params["_cparams", "_control"];
{
	_x params["_configName", "_displayName", "_smallIcon", "_dlcLogo"];
	_lbadd = _control lbadd _displayName;
	_control lbsetdata [_lbadd, _configName];
	if (_smallIcon != '') then {_control lbsetpicture [_lbadd, _smallIcon];};
	_control lbsettooltip [_lbadd,(_control lbtext _lbadd) + 'n' + (_control lbdata _lbadd)];
	if (_dlcLogo != '') then {_control lbsetpictureright [_lbadd,_dlcLogo];};
} foreach _cparams;
lbsort _control;