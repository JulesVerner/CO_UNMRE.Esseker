private _pond = createSimpleObject ["gm\gm_structures\gm_rivers\gm_pond_01.p3d", [6647.77,3992.72,1.56001], true]; 
_pond setPos [6647.77,3992.72,1.56001];

missionNamespace setVariable ["UNMRE_pond", _pond];

[{ 
    params ["_args", "_handle"];

    private _pond = missionNamespace getVariable ["UNMRE_pond", objNull];

    if (isNull _pond) exitWith {};
    
    private _pos = getPos _pond;
    if ((_pos select 2) > 30) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    }; 

    private _eyePosHeight = 9999;
    private _pondHeightASL = (AGLtoASL _pos) select 2;

    {
        private _eyePosHeightPlayer = ((eyePos _x) select 2) - 0.2;

        if (_eyePosHeightPlayer < _eyePosHeight) then {
            _eyePosHeight = _eyePosHeightPlayer;
        };
    }forEach allPlayers;
    
    if (_eyePosHeight > _pondHeightASL) then {
        // private _pondReplacement = createSimpleObject ["gm\gm_structures\gm_rivers\gm_pond_01.p3d", (_pos vectorAdd [0,0,0.004]), true]; 
        _pond setPos (_pos vectorAdd [0,0,0.01]);
        // deleteVehicle _pond;
        // missionNamespace setVariable ["UNMRE_pond", _pondReplacement];
    };
}, 2, []] call CBA_fnc_addPerFrameHandler;
