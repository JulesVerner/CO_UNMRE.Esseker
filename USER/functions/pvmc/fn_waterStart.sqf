if (!isServer) exitWith {};

missionNamespace setVariable ["PVMC_waterRising", true, true];

[] remoteExec ["grad_user_fnc_waterMgmt", [0,-2] select isDedicated];

private _soundSource = createSoundSource ["waterSplashSource", getPos water_01, [], 0];

[{ 
    params ["_args", "_handle"];
    _args params ["_soundSource"];

    private _eyePosHeightMin = 9999;
    
    // get lowest player
    {
        if (side _x == west) then {
            private _eyePosHeightPlayer = ((eyePos _x) select 2) - 0.3;

            if (_eyePosHeightPlayer < _eyePosHeightMin) then {
                _eyePosHeightMin = _eyePosHeightPlayer;
            };
        };
    }forEach allPlayers;

    private _height = missionNamespace getVariable ["PVMC_waterLevel", 1.5];

    if (AGLtoASL _height < _eyePosHeightMin) then {
        _height = _height + 0.0005;
    };
    missionNamespace setVariable ["PVMC_waterLevel", _height, true];

    if (!(missionNamespace getVariable ["PVMC_waterRising", false]) || _height > 30) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
        missionNamespace setVariable ["PVMC_waterRising", false, true];
        deleteVehicle _soundSource;
    };

}, 0, [_soundSource]] call CBA_fnc_addPerFrameHandler;