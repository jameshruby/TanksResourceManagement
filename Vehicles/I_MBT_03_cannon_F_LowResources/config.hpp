class LandVehicle;
class Tank: LandVehicle
{
	class NewTurret;
};
class Tank_F: Tank
{
	class Turrets
	{
		class MainTurret:NewTurret
		{
			class Turrets
			{
				class CommanderOptics;
			};
		};
	};
};

class MBT_03_base_F: Tank_F {};
class I_MBT_03_base_F: MBT_03_base_F{};
class I_MBT_03_cannon_F: I_MBT_03_base_F {};

class I_MBT_03_cannon_F_LowResources : I_MBT_03_cannon_F
{
	displayName	= $STR_TM_KumaDisplayName;
	fuelCapacity = 0.8;
	//fuelConsumptionRate = 0.01;
	class Turrets : Turrets
	{
		class MainTurret : MainTurret
		{
			magazines[]	= {12Rnd_120mm_APFSDS_shells_Tracer_Yellow, 6Rnd_120mm_HE_shells_Tracer_Yellow, 60Rnd_762x51_Belt_Yellow};
		   //ORIG VALUES  {28Rnd_120mm_APFSDS_shells_Tracer_Yellow, 14Rnd_120mm_HE_shells_Tracer_Yellow, 2000Rnd_762x51_Belt_Yellow, 2000Rnd_762x51_Belt_Yellow};
		
			class Turrets: Turrets
			{
				class CommanderOptics: CommanderOptics
				{
					magazines[]	= {100Rnd_127x99_mag_Tracer_Yellow, SmokeLauncherMag};
				};
			};
		};
	};
};

class I_MBT_03_cannon_F_LowResourcesMoreFuel : I_MBT_03_cannon_F_LowResources
{
	displayName	= $STR_TM_KumasMoreFuelDisplayName;
	fuelCapacity = 1.5;
};

class I_MBT_03_cannon_F_LowMediumResources : I_MBT_03_cannon_F_LowResources
{
	displayName	= $STR_TM_KumaLowMediumDisplayName;
	fuelCapacity = 2;
	//fuelConsumptionRate = 0.01;
	class Turrets : Turrets
	{
		class MainTurret : MainTurret
		{
			magazines[]	= {18Rnd_120mm_APFSDS_shells_Tracer_Yellow, 10Rnd_120mm_HE_shells_Tracer_Yellow, 500Rnd_762x51_Belt_Yellow};
			class Turrets: Turrets
			{
				class CommanderOptics: CommanderOptics
				{
					magazines[]	= {100Rnd_127x99_mag_Tracer_Yellow, SmokeLauncherMag};
				};
			};
		};
	};
};