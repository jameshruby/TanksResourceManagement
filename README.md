
# Tank Resource Management Modules

## About
Although Arma3 contains interactive buildings, such as Rearm boxes, or newly added Repair depot 
in Tanks DLC, it seemed that there was never emphasis on resource management gameplay.

In Editor, interactive buildings have no distinction from non-interactive ones. They are 
not visible in the map, unless it's done by mission creator. They also have limited usage.

For interesting resource management gameplay we are adressing following:

- To have the vehicle (in this case Kuma MBT) with much less resources, such as fuel and ammo
  to motivate player to manage resources, and to replenish these during the scenario

- To have interactive modules, which gives us possibility to replenish given resource

  Hold actions are used as they are providing a trade off: player trades substantial ammount of given resource for 
  time, mobility, reactibility(possibility to shoot/control vehicle) and by extension, safety.

Usage in TvT mission could be following:
  - Add the fuelResource module
  - Use Kuma with low resources
  - Set its ammo to eq. 0.5
  - If player gets to the fuel station, and is able to  refuel whole tank, it could be enough for rest of the mission. On the other hand, player is at risk of losing mission objective, or being eliminated while sitting stationary around fuel pump.

## Module Usage
Place the modules in the editor(located under Tanks Resource Management category) and play. You can set maximum duration of action which is number of seconds to completely refill given resource.

Also, for better experience, you can use tweaked versions of Kuma MBT.

## System Overview
System contains modules with attached holdAction. These modules are inheriting from ResourceModulesArea base class. 
HoldAction will add given resource when used. Full progress of the action means that resource is fully replenished.
It can take from 1 sec. to maximum duration of hold action(default: 30s) based on current ammount of the resource.
These resources are applied only on players vehicles not to the players themselfs.

**The hold action is avialable only to effective commander of vehicle** (this prevents situations when more 
players in same vehicle could start hold action)

### Hold action parametrization
Hold action and it's functionality is parametrized in two ways:

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
Function name is composed from TAG_ prefix and function name itself. System assumes, that overridable functions
will be in format *\<YourModuleName\>_fnc_addResourceFraction* and  *\<YourModuleName\>_fnc_getResourceFractionAndDuration*
these function names are looked up and returned as a functions on mission init and passed to the holdAction.

### Adding new resource:
- Create new folder under Modules eq. ModuleResourceLollipops
- Create *addResourceFraction.sqf* and *getResourceFractionAndDuration.sqf* and fill them with desired behaviour
- Create module class (currently theres no macro) and overwrite ResourcesModuleParams subclass

## Known issues

- The fuel station resource is not taking into account possible fuel 
  loss while refueling, which is can be observed with low ammount of fuel
