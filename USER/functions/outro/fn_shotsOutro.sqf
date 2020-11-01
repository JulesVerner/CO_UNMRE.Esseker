GRAD_introCam_shotDefinitions = [
    ["CAMERA", 5, outroCam_pos_1, missionNamespace getVariable ["outroGuy", objNull], .6, true, true, 5],
    ["MOVE", 5, outroCam_pos_4, {missionNamespace getVariable ["outroGuy", objNull]}, .6],
    ["CAMERA", 5, outroCam_pos_2, {missionNamespace getVariable ["outroVTOL", objNull]}, .6],
    ["MOVE", 40, outroCam_pos_3, {missionNamespace getVariable ["outroVTOL", objNull]}, .8],
    ["ATTACHPFH", 30, {missionNamespace getVariable ["outroVTOL", objNull]}, [0,10.7,-2.5], [0,13.2,-2.6], 1.2]
];


fnc_SetPitchBankYaw = {  
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY","_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp", 
    "_upXTemp"]; 
    _object = _this select 0;  
    _rotations = _this select 1;  
    _aroundX = _rotations select 0;  
    _aroundY = _rotations select 1;  
    _aroundZ = (360 - (_rotations select 2)) - 360;  
    _dirX = 0;  
    _dirY = 1;  
    _dirZ = 0;  
    _upX = 0;  
    _upY = 0;  
    _upZ = 1;  
    if (_aroundX != 0) then {  
        _dirY = cos _aroundX;  
        _dirZ = sin _aroundX;  
        _upY = -sin _aroundX;  
        _upZ = cos _aroundX;  
    };  
    if (_aroundY != 0) then {  
        _dirX = _dirZ * sin _aroundY;  
        _dirZ = _dirZ * cos _aroundY;  
        _upX = _upZ * sin _aroundY;  
        _upZ = _upZ * cos _aroundY;  
    };  
    if (_aroundZ != 0) then {  
        _dirXTemp = _dirX;  
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);  
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);         
        _upXTemp = _upX;  
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);  
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);    
    };  
    _dir = [_dirX,_dirY,_dirZ];  
    _up = [_upX,_upY,_upZ];  
    _object setVectorDirAndUp [_dir,_up];  
};

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

            [_VTOL] spawn {
                private _fish = createSimpleObject ["A3\animals_f\Fishes\Mullet_F.p3d", [0, 0, 0], true]; 

                sleep 24;
                params ["_VTOL"];
                    for "_i" from -30 to 0 do {
                        private _position = _VTOL modelToWorld [-0.0688477,11.1743+_i,-2.63159 -_i];
                        _fish setPos _position;
                        sleep 0.01;
                    };
                playSound "fish_1";
                _fish attachTo [_VTOL, [-0.0688477,11.1743,-2.63159]];
                [_fish,[-90,45, 60]] call fnc_SetPitchBankYaw;
            };

            [_VTOL] spawn {
                sleep 29;
                private _fish = createSimpleObject ["A3\animals_f\Fishes\Mullet_F.p3d", [0, 0, 0], true]; 
                params ["_VTOL"];
                    for "_i" from -30 to 0 do {
                        private _position = _VTOL modelToWorld [-0.3688477,11.1743+_i,-2.63159 -_i];
                        _fish setPos _position;
                        sleep 0.01;
                    };
                playSound "fish_2";
                _fish attachTo [_VTOL, [-0.3688477,11.1743,-2.63159]];
                [_fish,[-90,-45, -60]] call fnc_SetPitchBankYaw;
            };

            [{
                private _VTOL = missionNamespace getVariable ["outroVTOL", objNull];
                private _tree = "Tree_Oak" createVehicleLocal [0,0,0];

                diwako_dui_main_toggled_off = true;

                [_VTOL, _tree] spawn {
                    params ["_VTOL", "_tree"];
                    for "_i" from -30 to 0 do {
                        private _position = _VTOL modelToWorld [0, 12 + -_i, _i-10];
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
                    setAperture -1;

                    ["END1", true, 2, false, false] call BIS_fnc_endMission;
                };

            }, [], 40] call CBA_fnc_waitAndExecute;

        }, [], 15] call CBA_fnc_waitAndExecute;

    }, [], 15] call CBA_fnc_waitAndExecute;

}, [], 5] call CBA_fnc_waitAndExecute;


private _cockpitLight = "#lightpoint" createVehicleLocal [0,0,0];
_cockpitLight setLightBrightness 0.1;
_cockpitLight setLightAmbient [0.0, 1.0, 0.0];
_cockpitLight setLightColor [0.0, 1.0, 0.0];

[{
    params ["_args", "_handle"];
    _args params ["_cockpitLight"];

    private _VTOL = missionNamespace getVariable ["outroVTOL", objNull];

    if (isNull _VTOL) exitWith {};

    _cockpitLight setPos (_VTOL modelToWorld [-0.3688477,13.1743,-2.63159]);
    
}, 0, [_cockpitLight]] call CBA_fnc_addPerFrameHandler;