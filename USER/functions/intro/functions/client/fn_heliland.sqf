params ["_heli"];

doStop _heli;

[{
    params ["_heli"];
    private _boat = _heli getVariable ['introCamBoat', objNull];
    ((vehicle _boat) modelToWorldVisual [0,0,0]) params ["_xPos", "_yPos", "_zPos"]; 
    _zPos < 14 
},
{
    params ["_heli"];
    _heli setSlingLoad objNull; 
    (group _heli) setCurrentWaypoint [(group _heli),5];
    _heli setVariable ["landingCompleted", true];
    _heli flyInHeight 20;
}, [_heli]] call CBA_fnc_waitUntilAndExecute;


[{
    params ["_args", "_handle"];
    _args params ["_heli"];

    if (isNull _heli) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (_heli getVariable ["landingCompleted", true]) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    _heli animateSource ['slingloadlights_source', 0];
    _heli flyInHeight 20;
    _heli flyInHeight 0;
    
}, 0, [_heli]] call CBA_fnc_addPerFrameHandler;