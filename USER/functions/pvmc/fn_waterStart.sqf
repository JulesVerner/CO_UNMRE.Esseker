if (!isServer) exitWith {};

[4] remoteExec ["BIS_fnc_earthquake", [0,-2] select isDedicated];

[{

    missionNamespace setVariable ["PVMC_waterRising", true, true];

    [] remoteExec ["grad_user_fnc_waterMgmt", 0];

    private _soundSource = createSoundSource ["waterLeakBunkerSource", getPos water_19, [], 0];
    private _soundSource2 = createSoundSource ["waterLeakBunkerSource", getPos water_01, [], 0];

    [{ 
        params ["_args", "_handle"];
        _args params ["_soundSource", "_soundSource2"];

        private _eyePosHeightMin = 9999;
        
        // get lowest player
        {
            if (side _x == west) then {
                private _eyePosHeightPlayer =  (((ASLToAGL (eyePos _x)) select 2) - 0.3);

                if (_eyePosHeightPlayer < _eyePosHeightMin) then {
                    _eyePosHeightMin = _eyePosHeightPlayer;
                };
            };
        }forEach allPlayers;

        private _height = missionNamespace getVariable ["PVMC_waterLevel", 1.5];

        if (_height < _eyePosHeightMin) then {
            _height = _height + missionNamespace getVariable ["PVMC_waterLevelDelta", 0.0005]; // 0.0005;
        };
        missionNamespace setVariable ["PVMC_waterLevel", _height, true];

        if (!(missionNamespace getVariable ["PVMC_waterRising", false]) || _height > 30) then {
            [_handle] call CBA_fnc_removePerFrameHandler;
            missionNamespace setVariable ["PVMC_waterRising", false, true];
            deleteVehicle _soundSource;
            deleteVehicle _soundSource2;
        };

    }, 0, [_soundSource, _soundSource2]] call CBA_fnc_addPerFrameHandler;

}, [], 5] call CBA_fnc_waitAndExecute;