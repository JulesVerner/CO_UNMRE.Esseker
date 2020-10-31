GRAD_introCam_shotDefinitions = [
    ["CAMERA", 10, outroCam_pos_1, missionNamespace getVariable ["outroGuy", objNull], .6, true, true, 5],
    ["CAMERA", 5, outroCam_pos_2, {missionNamespace getVariable ["outroVTOL", objNull]}, .6],
    ["MOVE", 40, outroCam_pos_3, {missionNamespace getVariable ["outroVTOL", objNull]}, .8],
    ["ATTACHPFH", 30, {missionNamespace getVariable ["outroVTOL", objNull]}, [-0.5,10.5,-2.6], [0,12.2,-2.6], 1.1]
];

/*

*/

setAperture 3; // fix darkness

[GRAD_introCam_shotDefinitions, true] call GRAD_introCam_fnc_play;


[{
    [trg_outro_fish_close, 3] execVM "USER\functions\outro\fn_fishRising.sqf";
    diwako_dui_main_toggled_off = true;
    [{

        [trg_outro_fish_medium, 1] execVM "USER\functions\outro\fn_fishRising.sqf";
        diwako_dui_main_toggled_off = true;

        [trg_outro_trees_1] execVM "USER\functions\outro\fn_treeRising.sqf";

        [{
            private _VTOL = missionNamespace getVariable ["outroVTOL", objNull];
            private _tree = "Tree_Oak" createVehicleLocal [0,0,0];
            private _velocity = velocity _VTOL;

            diwako_dui_main_toggled_off = true;

            [_VTOL, _tree] spawn {
                params ["_VTOL", "_tree"];
                for "_i" from -30 to 0 do {
                    private _position = _VTOL modelToWorld [0, 12 + -_i, _i+5];
                    _tree setPos _position;
                    sleep 0.01;
                };

                cutText ["", "BLACK FADED", 999];
                playSound "crash";

                sleep 3;

                15 fadeSound 0;

                playSound "rhsusf_dws_critical_enginefailure";

                sleep 3;
                
                player allowDamage false;

                playSound "rhsusf_dws_warning_damagecritical";

                sleep 3;
                
                playSound "rhsusf_dws_critical_enginefailure";

                sleep 3;

                playSound "rhsusf_dws_warning_damagecritical";

                sleep 3;

                playSound "rhsusf_dws_warning_sinkrate";

                sleep 3;

                ["END1", true, 2, false, false] call BIS_fnc_endMission;
            };

        }, [], 40] call CBA_fnc_waitAndExecute;

    }, [], 15] call CBA_fnc_waitAndExecute;

}, [], 5] call CBA_fnc_waitAndExecute;