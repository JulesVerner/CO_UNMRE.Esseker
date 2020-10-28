GRAD_introCam_shotDefinitions = [
    ["CAMERA", 0, outroCam_pos_1, missionNamespace getVariable ["outroGuy", objNull], .6, true, false],
    ["CAMERA", 5, outroCam_pos_2, {missionNamespace getVariable ["outroVTOL", objNull]}, .6],
    ["MOVE", 10, outroCam_pos_3, {missionNamespace getVariable ["outroVTOL", objNull]}, .6]
];

[GRAD_introCam_shotDefinitions, true] call GRAD_introCam_fnc_play;


[{
    [trg_outro_fish_close, 3] execVM "USER\functions\outro\fn_fishRising.sqf";

    [{

        [trg_outro_fish_medium, 1] execVM "USER\functions\outro\fn_fishRising.sqf";

    }, [], 5] call CBA_fnc_waitAndExecute;

}, [], 5] call CBA_fnc_waitAndExecute;