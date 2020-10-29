params ["_trigger", "_frequency"];
/*
if (!canSuspend) exitWith {
    [_trigger] execVM "fishRising.sqf";
    systemChat "exiting";
};
*/

// systemChat "läuft";

private _levitateBaseSpeed = 0.1;

private _identifier = format ["ALL_FISHES_%1", _frequency];
missionNamespace getVariable [_identifier, []];

DEBUG_DURATION = 60;

if (_frequency > 2) then {
  playSound "outro_song";
  0 fadesound 1;
};

[_trigger, _levitateBaseSpeed, _frequency, _identifier] spawn {
    params ["_trigger", "_levitateBaseSpeed", "_frequency", "_identifier"];
    for "_i" from 0 to (DEBUG_DURATION) do { 

        private _array = missionNamespace getVariable [_identifier, []];
        
        private _position = [[_trigger], []] call BIS_fnc_randomPos;
        _position params ["_posX", "_posY", "_posZ"];
        private _agent = createSimpleObject ["A3\animals_f\Fishes\Mullet_F.p3d", [_posX, _posY, -1], true];
        
        _agent setDir (random 360);
        
        [_agent, -90, 0] call BIS_fnc_setPitchBank;

        _agent setVariable ["levitateSpeed", _levitateBaseSpeed + random 0.01];
        _array pushBackUnique _agent;
        missionNamespace setVariable [_identifier, _array];
        sleep random _frequency;
    };
};

// Fishes_Swim, Fishes_Swim_S1, Fishes_Swim_S2, Fishes_Swim_S3, Fishes_Stop, Fishes_Die, Fishes_Die2

private _handle = [{
    params ["_args", "_handle"];
    _args params ["_identifier"];

    private _array = missionNamespace getVariable [_identifier, []];

    {   
        (position _x) params ["_posX", "_posY", "_posZ"];
        private _waterFX = _x getVariable ["waterFX", false];

        if (_posZ > -0.5 && _posZ < 0.1 && !_waterFX) then {
            _x setVariable ["waterFX", true];

            private _bullet = "B_20mm" createVehicleLocal [0,0,0];
            _bullet setPos [_posX, _posY, -1];
            _bullet setVelocity [0,0,100];
            
            // hint "bla";
        };

        private _speed = _x getVariable ["levitateSpeed", 0];
        _x setPos [_posX, _posY, _posZ + _speed];
        _x setDir (getDir _x + 0.05);
        [_x, -90, 0] call BIS_fnc_setPitchBank;

        if (_posZ > 200) then {
            _array deleteAt (_array find _x);
            deleteVehicle _x;
        };

    } forEach _array;

    missionNamespace setVariable [_identifier, _array];
    
}, 0, [_identifier]] call CBA_fnc_addPerFrameHandler;

[{  
    params ["_handle", "_identifier"];

    private _array = missionNamespace getVariable [_identifier, []];

    [_handle] call CBA_fnc_removePerFrameHandler;
    {
        deleteVehicle _x;
        _array deleteAt (_array find _x);
    } forEach _array;


    missionNamespace setVariable [_identifier, []];

}, [_handle, _identifier], DEBUG_DURATION] call CBA_fnc_waitAndExecute;