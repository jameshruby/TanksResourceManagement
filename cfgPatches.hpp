class cfgPatches
{
	class TanksResourceManagement
	{
		name = "TanksResourceManagement";
		units[] = {
			I_MBT_03_cannon_F_LowResources,
		
			ModuleResourceAmmunition,
			ModuleResourceFuel,
			ModuleResourceRepair,
			ModuleVehicleResourcesInit
		};
		
			// 5Rnd_120mm_APFSDS_shells_Tracer_Yellow,
			// 3Rnd_120mm_APFSDS_shells_Tracer_Yellow
		//I_MBT_03_cannon_F_LowResources,
		
		weapons[] = {
			cannon_120mm_long,
			LMG_coax
		};
		requiredVersion = 1.0;
		requiredAddons[] = {
			A3_Modules_F,
			A3_Weapons_F,
			A3_Armor_F,
			A3_Armor_F_EPB,
			A3_Armor_F_EPB_MBT_03,
			A3_Armor_F_Tank,
			A3_Structures_F_Tank_Military
			//A3_Armor_F_Tank,
			//A3_Data_F_Tank,

		};
	};
}; 





// 12Rnd_120mm_APFSDS_shells_Tracer_Yellow,
// 10Rnd_120mm_APFSDS_shells_Tracer_Yellow,
// 8Rnd_120mm_APFSDS_shells_Tracer_Yellow,
// 6Rnd_120mm_APFSDS_shells_Tracer_Yellow,
// 5Rnd_120mm_APFSDS_shells_Tracer_Yellow,
// 4Rnd_120mm_APFSDS_shells_Tracer_Yellow,
// 3Rnd_120mm_APFSDS_shells_Tracer_Yellow,

// 200Rnd_762x51_Belt_Yellow,
// 100Rnd_762x51_Belt_Yellow,
// 80Rnd_762x51_Belt_Yellow,
// 60Rnd_762x51_Belt_Yellow,


// 10Rnd_120mm_HE_shells_Tracer_Yellow,
// 8Rnd_120mm_HE_shells_Tracer_Yellow,
// 6Rnd_120mm_HE_shells_Tracer_Yellow,
// 5Rnd_120mm_HE_shells_Tracer_Yellow,
// 4Rnd_120mm_HE_shells_Tracer_Yellow,