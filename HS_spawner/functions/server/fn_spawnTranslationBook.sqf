params ["_pos"];

private _book = createVehicle ["Book_02_F", _pos, [], 0, "CAN_COLLIDE"];

_book setDir (random 360);

_book setObjectTextureGlobal [0, "pic\book.paa"];


[
    _book,                                          // Object the action is attached to
    "Buch lesen",                                      // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", // Progress icon shown on screen
    "_this distance _target < 3",                       // Condition for the action to be shown
    "_caller distance _target < 3",                     // Condition for the action to progress
    {},                                                 // Code executed when action starts
    {},                                                 // Code executed on every progress tick
    { params ["_target", "_caller", "_actionId", "_arguments"]; deleteVehicle _target; ["en", "fi", "ru"] remoteExecCall ["acre_api_fnc_babelSetSpokenLanguages", _caller]; ["You learned so many new languages in just a minute!"] remoteExecCall ["hint", _caller]; },             // Code executed on completion
    {},                                                 // Code executed on interrupted
    [],                                                 // Arguments passed to the scripts as _this select 3
    10,                                                 // Action duration [s]
    0,                                                  // Priority
    false,                                               // Remove on completion
    false                                               // Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _book];   // MP compatible implementation