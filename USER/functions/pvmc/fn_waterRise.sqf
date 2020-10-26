_pond = createSimpleObject ["gm\gm_structures\gm_rivers\gm_pond_01.p3d", [6647.77,3992.72,1.56001], true]; 
_pond setPos [6647.77,3992.72,1.56001];
 
[{ 
    params ["_pond", "_handle"]; 
    
    private _pos = getPos _pond; 
    if ((_pos select 2) > 30) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    }; 

    private _eyePosHight = 9999;
    private _pondHightASL = (AGLtoASL _pos) select 2;

    {
        private _eyePosHightPlayer = ((eyePos _x) select 2) - 0.2;

        if (_eyePosHightPlayer < _eyePosHight) then {
            _eyePosHight = _eyePosHightPlayer;
        };
    }forEach (playableUnits + switchableUnits);
    
    if (_eyePosHight > _pondHightASL) then {
        _pond setPos (_pos vectorAdd [0,0,0.004])
    };
}, 0.25, _pond] call CBA_fnc_addPerFrameHandler;
