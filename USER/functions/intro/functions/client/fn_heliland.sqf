params ["_heli"];

[{
    params ["_heli"];
    private _boat = _heli getVariable ['introCamBoat', objNull];
    ((vehicle _boat) modelToWorldVisual [0,0,0]) params ["_xPos", "_yPos", "_zPos"]; 
    _zPos < 12 
},
{
    params ["_heli"];
    _heli setSlingLoad objNull; 
    deleteWaypoint [group _heli, currentWaypoint (group _heli)];
}, [_heli]] call CBA_fnc_waitUntilAndExecute;


[{
    params ["_args", "_handle"];
    _args params ["_heli"];

    if (isNull _heli) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _heli animateSource ['slingloadlights_source', 0];
    _heli action ['LandGearUp', _heli];
    
}, 0, [_heli]] call CBA_fnc_addPerFrameHandler;