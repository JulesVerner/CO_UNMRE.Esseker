params ["_pos"];

private _map = createVehicle ["Land_Map_Enoch_F", _pos, [], 0, "CAN_COLLIDE"];

[
    _map,                                          // Object the action is attached to
    "Karte lesen",                                      // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", // Progress icon shown on screen
    "_this distance _target < 3",                       // Condition for the action to be shown
    "_caller distance _target < 3",                     // Condition for the action to progress
    {},                                                 // Code executed when action starts
    {},                                                 // Code executed on every progress tick
    { [] remoteExecCall ["HS_spawner_fnc_createTask6",2]; hint "Verstecktes Flugzeug auf Karte markiert."; },             // Code executed on completion
    {},                                                 // Code executed on interrupted
    [],                                                 // Arguments passed to the scripts as _this select 3
    12,                                                 // Action duration [s]
    0,                                                  // Priority
    true,                                               // Remove on completion
    false                                               // Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _map];   // MP compatible implementation