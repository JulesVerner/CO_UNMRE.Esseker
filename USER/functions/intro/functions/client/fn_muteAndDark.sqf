if (!didJIP) then {
    
    cutText ["loading", "BLACK FADED", 999];
    1 fadeSound 0;
    diwako_dui_main_toggled_off = true;

    [] spawn {
        sleep 10;

        execVM "user\functions\intro\functions\client\fn_textEffects.sqf";
    };
};