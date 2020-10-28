GRAD_introCam_shotDefinitions = [
    ["CAMERA", 10, outroCam_pos_1, missionNamespace getVariable ["outroGuy", objNull], .6, true, true, 5],
    ["CAMERA", 5, outroCam_pos_2, {missionNamespace getVariable ["outroVTOL", objNull]}, .6],
    ["MOVE", 30, outroCam_pos_3, {missionNamespace getVariable ["outroVTOL", objNull]}, .6],
    ["ATTACH", 30, {missionNamespace getVariable ["outroVTOL", objNull]}, {missionNamespace getVariable ["outroVTOLhelper", objNull]}, 1.2, [0,9,-2.8]]
];



[GRAD_introCam_shotDefinitions, true] call GRAD_introCam_fnc_play;


[{
    [trg_outro_fish_close, 3] execVM "USER\functions\outro\fn_fishRising.sqf";

    [{

        [trg_outro_fish_medium, 1] execVM "USER\functions\outro\fn_fishRising.sqf";

        [trg_outro_trees_1] execVM "USER\functions\outro\fn_treeRising.sqf";

    }, [], 15] call CBA_fnc_waitAndExecute;

}, [], 5] call CBA_fnc_waitAndExecute;