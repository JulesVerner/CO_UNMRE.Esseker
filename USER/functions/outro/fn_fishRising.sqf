params ["_trigger", "_frequency"];
/*
if (!canSuspend) exitWith {
    [_trigger] execVM "fishRising.sqf";
    systemChat "exiting";
};
*/

// systemChat "läuft";

private _levitateBaseSpeed = 0.1;
private _levitateTreeSpeed = 0.1;
FISH_RISING_ACTIVATION_RADIUS = 200;

ALL_FISHES = [];

DEBUG_DURATION = 60;

playMusic "";
playMusic "Music_Theme_Contact";

[_trigger, _levitateBaseSpeed, _frequency] spawn {
    params ["_trigger", "_levitateBaseSpeed", "_frequency"];
    for "_i" from 0 to (DEBUG_DURATION) do { 
        
        private _position = [[_trigger], []] call BIS_fnc_randomPos;
        _position params ["_posX", "_posY", "_posZ"];
        private _agent = createSimpleObject ["A3\animals_f\Fishes\Mullet_F.p3d", [_posX, _posY, -1], true];
        
        _agent setDir (random 360);
        
        [_agent, -90, 0] call BIS_fnc_setPitchBank;

        _agent setVariable ["levitateSpeed", _levitateBaseSpeed + random 0.01];
        ALL_FISHES pushBackUnique _agent;
        sleep random _frequency;
    };
};

// Fishes_Swim, Fishes_Swim_S1, Fishes_Swim_S2, Fishes_Swim_S3, Fishes_Stop, Fishes_Die, Fishes_Die2

private _handle = [{
    params ["_args", "_handle"];

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

    } forEach ALL_FISHES;
    
}, 0, []] call CBA_fnc_addPerFrameHandler;

[{  
    params ["_handle"];

    [_handle] call CBA_fnc_removePerFrameHandler;
    {
        deleteVehicle _x;
        ALL_FISHES deleteAt (ALL_FISHES find _x);
    } forEach ALL_FISHES;


    ALL_FISHES = [];

}, [_handle], DEBUG_DURATION] call CBA_fnc_waitAndExecute;