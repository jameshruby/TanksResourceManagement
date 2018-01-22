
# Tank Resource Management Modules

## About
Altought Arma3 contains interactive buildings, such as Rearm boxes, or newly added RepairDepot 
in Tanks DLC, it seemed that there was never emphasis on resource management gameplay.

In Editor, Interactive buildings have no distinction from non-interactive ones, they are 
not visible in the map, if its not done by mission creator, and they have limited usage.

For interesting resource management gampeplay we are adressing following:

- To have some vehicle (in this case Kuma MBT) with much less resources, such as fuel, and ammo
  to motivate player replenish these during the scenario

- To have interactive modules, which gives us possibility to replenish given resource

  Hold actions are used as they are providing a trade off: player is substantial ammount of given resource for 
  time, mobility, reactibility(possibility to shoot/control vehicle) and by extension, safety.
  And more time is spent the more resource player gets.

Usage in TvT mission could be following:
  - Add the fuelResource module
  - Use Kuma with low resources
  - Set its ammo to eq. 0.5
  - If player gets to the fuel station, and gets maximum fuel, it could be enough for rest of the mission to not worry about fuel
    On the other hand, player is at risk of lossing mission objective, or being eliminated while sitting stationary around fuel pump.

## Module Usage
Place the modules in the editor(located under Tanks Resource Management category) and play. You can set maximum duration of action which is number of seconds to completely refill given resource

Also, for better experience, you can use tweaked versions of Kuma MBT

## System Overview
System contains modules with attached holdAction. These modules are inheriting from ResourceModulesArea base class. 
HoldAction will substantiallly add given resource, full progress of holdAction means that resource is fully replenished,
based on current ammount of the resource, that can take from 1sec. to maximumDuration of hold action(default: 30s).
These resources are applied only on players vehicles not the players themselfs.

**The hold action is avialable only to effective commander of vehicle** (this prevents situation when more 
players in same vehicle could run hold action)

### Hold action parametrization
Hold action and its functonality is parametrized in two ways:

1) #### ResourcesModuleParams subclass of given module

    ``` sqf
    holdActionMaxProgress = 24; //Number of ticks in hold action. should not be overriden
    title = "Refuel"; //title of given hold acton 
        
    idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa"; //path to the idle icon
    progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa"; //path to the progress icon  
    cfgVehiclesQuery = "configName _x isKindOf('Land_RepairDepot_01_base_F')" //query to cfgVehicles which basically is same as condition for configClasses command
    ```   

2) #### Required module functions
   
    **addResourceFraction**
        
    ``` sqf  
    Description:
      
    Adds fraction of given resource to target.
    Function runs on every tick of holdAction

    IMPORTANT: Overwrite this function in specifc module, 
    to add desired resource to the target, this function is not to be
    called directly (unless debug)

    Parameter(s):
    _this select 0: OBJECT - target
    _this select 1: NUMBER - resource fraction:
            amount of resource added per hold action
            tick, which is returned in getResourceFractionAndDuration
    _this select 2 (Optional): NUMBER - _currentProgress - number of ticks passed
          
    Returns:
    Nothing
    ```
    
    **getResourceFractionAndDuration**
   
    ``` sqf
    Description:
    
    Calculate how much of given resource will be added in holdActon tick, to replenish 
    given resource on full progress of holdAction, and how long it will take
  
    !IMPORTANT: Overwrite this function in specifc module, 
    to add desired resource to the target, this function is not to be
    called directly (unless debug). 

    Parameter(s):
    _this select 0: OJBECT - players vehicle for which the resource is calculated
    _this select 1: NUMBER - _holdActionProgress - constant(24) number of ticks in holdAction
    _this select 2: NUMBER - _holdActionDuration - total duration of holdAction
      
    Returns:
    _this select 0: NUMBER - how much of given resource will be added
    _this select 1: NUMBER - how long it will take to replenish the resource fully
    ```

      **DON'T REGISTER THIS FUNCTIONS YOURSELF, AS THEY ARE LOCAL FUNCTIONS REGISTERED AUTOMATICALLY WITH GIVEN MODULE.**

### Functions linking
Functions formed from TAG_ and function name itself. System assumes, that overridable functions
will be in format *\<YourModuleName\>_fnc_addResourceFraction* and  *\<YourModuleName\>_fnc_getResourceFractionAndDuration*
these function names are looked up and returned as a functions on mission init and passed to the holdAction.

### Adding new resource:
- Create new folder under Modules eq. ModuleResourceLollipops
- Create *addResourceFraction.sqf* and *getResourceFractionAndDuration.sqf* and fill them with desired behaviour
- Create module class (currently theres no macro) and overwrite ResourcesModuleParams subclass

## Known issues and current caveats

- The fuel station resource is not taking into account possible fuel 
  loss while refueling, which is visible with low ammount of fuel