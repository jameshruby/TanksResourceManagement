#Tank Resource Management Modules

##About
Altought Arma3 contains interactive buildings, such as Rearm boxes, or newly added RepairDepot 
in Tanks DLC, it seemed that there was never emphasis on resource management gameplay.

In Editor, Interactive buildings have no distinction from non-interactive ones, they are 
not visible in the map, if its not done by mission creator, and they have limited usage.

For iteresting resource management gampeplay we are adressing following:

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

##Module Usage
Place the modules in the editor(located under Tanks Resource Management category) and play.
You can set maximum duration of action which is number of seconds to completely refill given resource

##System Overview
System contains modules with attached holdAction. These modules are inheriting from  ResourceModulesArea base class. 
HoldAction will substantiallly add given resource, full progress of holdAction means that resource is fully replenished,
based on current ammount of the resource, that can take from 1sec. to maximumDuration of hold action(default: 30s).
These resources are applied only on players vehicles not the players themselfs.

###Hold action parametrization
Hold action and its functonality is parametrized in two ways:

1) ResourcesModuleParams subclass of given module
     
     holdActionMaxProgress = 24; //Number of ticks in hold action. should not be overriden
     title = "Refuel"; //title of given hold acton 
    
     idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa"; //path to the idle icon
		 progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa"; //path to the progress icon

2) Required module functions
  - fn_addResourceFraction

    Description:
    Adds fraction of given resource to target.
    Function runs on every tick of holdAction

    !IMPORTANT: Overwrite this function in specifc module, 
    to add desired resource to the target, this function is not to be
    called directly (unless debug). 

    Parameter(s):
    _this select 0: OJBECT - players vehicle to which resource is added
    _this select 1: NUMBER - ammount of resource to be added, which is retrieved from getResourceFractionAndDuration
      
    Returns:
    Nothing
  
  - fn_getResourceFractionAndDuration

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
    
   DONT REGISTER THIS FUNCTIONS YOURSELF, USE "RESOURCE_MODULE_FUNCTIONS" MACRO, WITH NAME OF YOUR MODULE CLASS AS A PARAMETER
   THIS IS IMPORTANT, BECAUSE THE FUNCTIONS ARE LINKED AUTOMATICALLY WITH GIVEN MODULE

###Functions linking
Functions in Arma Function manager are formed from TAG_ and function name itself.
Using "RESOURCE_MODULE_FUNCTIONS" macro is important, because system assumes, that overridable functions
will be in format "<YourModuleName>_fnc_addResourceFraction" and  "<YourModuleName>_fnc_getResourceFractionAndDuration"
these function names are looked up and returned as a functions on mission init and passed to the holdAction.

###Adding new resource:
- Create new folder under Modules eq. ModuleResourceLollipops
- Create fn_addResourceFraction.sqf, fn_getResourceFractionAndDuration.sqf and fill them with desired behaviour
- Use RESOURCE_MODULE_FUNCTIONS macros macro for registering the functions
- Create module class (currently theres no macro) and overwrite ResourcesModuleParams subclass

##Known issues and current caveats
- HoldActions are currently not displaying in multiplayer
 
- Current solution is not handling more players in the vehicle, as its build for PvP scenario and will possibly be merged 
  With specific mission: 
  The hold action will be added to all players in the vehicle

- Only overriden buildings should be used: 
  If the modules would be used with default RepairDepot, 
  than the players vehicle would be repaired instantly without need to wait for holdAction

- The fuel station resource is not taking into account possible fuel 
  loss while refueling, which is visible with low ammount of fuel






