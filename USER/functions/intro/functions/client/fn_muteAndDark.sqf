["CBA_loadingScreenDone", {
    if (!didJIP) then {
    
        cutText ["loading", "BLACK FADED", 999];
        0.1 fadeSound 0;
        diwako_dui_main_toggled_off = true;

        [{
            missionNamespace getVariable ["UNMRE_introStarted", false]
        },{
            call grad_introFX_fnc_textEffects;
        }, []] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_addEventHandler;


private _soundBugFix = ["vehicle", {
    params ["_unit"];

    // if (!acex_volume_lowerInVehicles) exitWith {};

    if (vehicle _unit != _unit) then {
        [{
            0 fadeSound 0;
        }] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addPlayerEventHandler;


[{
    (missionNamespace getVariable ["UNMRE_introDone", false])
},{
    params ["_soundBugFix"];
    
    ["vehicle", _soundBugFix] call CBA_fnc_removePlayerEventHandler;

}, [_soundBugFix]] call CBA_fnc_waitUntilAndExecute;