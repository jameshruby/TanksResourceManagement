class cfgWeapons
{
    class cannon_120mm;
    class cannon_120mm_long: cannon_120mm // Kuma main weapon
    {
        magazines[] = {
            28Rnd_120mm_APFSDS_shells,
            28Rnd_120mm_APFSDS_shells_Tracer_Red, 
            28Rnd_120mm_APFSDS_shells_Tracer_Green, 
            28Rnd_120mm_APFSDS_shells_Tracer_Yellow,        
            //CUSTOM
            18Rnd_120mm_APFSDS_shells_Tracer_Yellow,
            12Rnd_120mm_APFSDS_shells_Tracer_Yellow, 
            10Rnd_120mm_APFSDS_shells_Tracer_Yellow,
            8Rnd_120mm_APFSDS_shells_Tracer_Yellow, 
            6Rnd_120mm_APFSDS_shells_Tracer_Yellow, 
            5Rnd_120mm_APFSDS_shells_Tracer_Yellow, 
            4Rnd_120mm_APFSDS_shells_Tracer_Yellow, 
            3Rnd_120mm_APFSDS_shells_Tracer_Yellow, 
                        
            14Rnd_120mm_HE_shells,
            14Rnd_120mm_HE_shells_Tracer_Red,
            14Rnd_120mm_HE_shells_Tracer_Green, 
            14Rnd_120mm_HE_shells_Tracer_Yellow, 
            //CUSTOM
            10Rnd_120mm_HE_shells_Tracer_Yellow,
            8Rnd_120mm_HE_shells_Tracer_Yellow,
            6Rnd_120mm_HE_shells_Tracer_Yellow,
            5Rnd_120mm_HE_shells_Tracer_Yellow,
            4Rnd_120mm_HE_shells_Tracer_Yellow
        };
    };
    class LMG_RCWS;
    class LMG_coax: LMG_RCWS /// Coax of AAF armours
	{
		magazines[] = {
			200Rnd_762x51_Belt,
			1000Rnd_762x51_Belt,
			2000Rnd_762x51_Belt,
			// Normal belts
			200Rnd_762x51_Belt_Red,200Rnd_762x51_Belt_Green,200Rnd_762x51_Belt_Yellow,
			1000Rnd_762x51_Belt_Red,1000Rnd_762x51_Belt_Green,1000Rnd_762x51_Belt_Yellow,
			2000Rnd_762x51_Belt_Red,2000Rnd_762x51_Belt_Green,2000Rnd_762x51_Belt_Yellow,
			// All tracered
			200Rnd_762x51_Belt_T_Red,200Rnd_762x51_Belt_T_Green,200Rnd_762x51_Belt_T_Yellow,
			1000Rnd_762x51_Belt_T_Red,1000Rnd_762x51_Belt_T_Green,1000Rnd_762x51_Belt_T_Yellow,
			2000Rnd_762x51_Belt_T_Red,2000Rnd_762x51_Belt_T_Green,2000Rnd_762x51_Belt_T_Yellow,
            //CUSTOM
            500Rnd_762x51_Belt_Yellow,
            300Rnd_762x51_Belt_Yellow,
            100Rnd_762x51_Belt_Yellow,
            80Rnd_762x51_Belt_Yellow,
            60Rnd_762x51_Belt_Yellow
		};
	};
    class HMG_127: LMG_RCWS //Ifrit, Hunter, Strider
	{
		magazines[] = {100Rnd_127x99_mag_Tracer_Yellow};
    };
};


