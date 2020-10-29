private _pond = "HAG_Pond_Big_01" createVehicleLocal [0,0,0];

// createSimpleObject ["gm\gm_structures\gm_rivers\gm_pond_01.p3d", [6647.77,3992.72,1.56001], true]; 
_pond setPos [6647.77,3992.72,1.56001];

missionNamespace setVariable ["UNMRE_pond", _pond];

[{ 
    params ["_args", "_handle"];

    private _pond = missionNamespace getVariable ["UNMRE_pond", objNull];
    private _height = missionNamespace getVariable ["PVMC_waterLevel", 0];

    if (isNull _pond) exitWith {};
    
    private _pos = getPos _pond;
    _pos params ["_posX", "_posY", "_posZ"];

    if (!(missionNamespace getVariable ["PVMC_waterRising", false])) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    _pond setPos [_posX, _posY, _height];
   
}, 0, []] call CBA_fnc_addPerFrameHandler;


// update simulation height every 10s
[{ 
    params ["_args", "_handle"];

    private _pondNew = "HAG_Pond_Big_01" createVehicleLocal [0,0,0];
    private _pondOld = missionNamespace getVariable ["UNMRE_pond", objNull];
    private _height = missionNamespace getVariable ["PVMC_waterLevel", 0];

    if (isNull _pondOld) exitWith {};
    
    private _pos = getPos _pondOld;
    _pondNew setPos _pos;
    missionNamespace setVariable ["UNMRE_pond", _pondNew];
    deleteVehicle _pondOld;

    if (!(missionNamespace getVariable ["PVMC_waterRising", false])) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };
   
}, 10, []] call CBA_fnc_addPerFrameHandler;
