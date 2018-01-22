class CfgMarkers 
{	
	class loc_Fuelstation;
	class loc_RearmStation: loc_Fuelstation
	{
		name = $STR_TM_RearmStationMarkerDisplayName;
		icon = "\A3\TanksResourceManagement\Img\rearmrstation_CA.paa";
	};
    class loc_RepairStation: loc_Fuelstation
	{
		name = $STR_TM_RepairStationMarkerDisplayName;
		icon = "\A3\TanksResourceManagement\Img\repairstation_CA.paa";
	};
};