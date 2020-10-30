private _number = player getVariable ["introBoat", 0];
private _boatID = format ["introBoat_%1", _number];

[{
    params ["_boatID"];
    0 fadeSound 0;
    !(isNull (missionNamespace getVariable [_boatID, objNull]))
},
{
    params ["_boatID"];
    private _boat = missionNamespace getVariable [_boatID, objNull];

    0 fadeSound 0;
    [player, _boat] remoteExecCall ["moveInAny", 2];
    player allowDamage false;
    _boat allowDamage false;

    // safe check to force stay in boat
    [{
        params ["_args", "_handle"];
        _args params ["_boat"];

        private _heli = _boat getVariable ["introCamHeli", objNull];
        
        if (_heli getVariable ["boatDropped", false]) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        if (objectParent player != _boat) then {
            [player, _boat] remoteExecCall ["moveInAny", 2];
        };
    }, 1, [_boat]] call CBA_fnc_addPerFrameHandler;

    [] spawn {
        sleep 1;
        cutText ["", "BLACK IN", 20];
        sleep 3;
        1 fadeSound 1;
        sleep 1;
        playSound "intro_song";
        sleep 2;
        [ "Somewhere in Esseker", "26.07.2025" ] spawn BIS_fnc_infoText;
    };

},[_boatID]] call CBA_fnc_waitUntilAndExecute;