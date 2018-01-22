params["_ctrlCheckbox", "_controlClassName"];	
private _state = (cbChecked _ctrlCheckbox);//[true, false] select - reverse option 
private _fade = [0.75,0] select _state;
private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;

{
	if (ctrlclassname ctrlParentControlsGroup _x in [_controlClassName]) then {
		_x ctrlenable _state;
		_x ctrlsetfade _fade;
		_x ctrlcommit 0;
	};	
} foreach (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);