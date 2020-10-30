["CBA_loadingScreenDone", {
    if (!didJIP) then {
    
        cutText ["loading", "BLACK FADED", 999];
        0.1 fadeSound 0;
        diwako_dui_main_toggled_off = true;

        [{
            call grad_introFX_fnc_textEffects;
        }, [], 10] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;