if (!isServer) exitWith {};
    
// camera 
[] remoteExec ["GRAD_introCam_fnc_start", 0, true];

private _soundSource = createSoundSource ["waterSplashSource", position intro_camTarget_2, [], 0];

private _allPlayers = (playableUnits + switchableUnits);

for "_i" from 1 to 4 do {

    private _position = getMarkerPos (format ["mrk_intro_heli_start_%1", _i]);
    _position set [2,40];
    private _heli = createVehicle ["gm_ge_army_ch53g", _position, [], 0, "FLY"];
    [
        _heli,
        ["gm_ge_un",1], 
        ["cargoseat_source",0]
    ] call BIS_fnc_initVehicle;

    private _group = createVehicleCrew _heli;

    _heli setCombatMode "BLUE";
    _heli disableAI "Lights";
    _heli setPilotLight true;
    _heli setBehaviour "CARELESS";
    _heli setSpeedMode "SLOW";
    _heli flyInHeightASL [20,20,20];
    _heli animateSource ["slingloadlights_source", 1];
    _heli disableAI "AUTOCOMBAT";

    private _boat = createVehicle ["rhsgref_hidf_rhib", [0,0,0], [], 0, "NONE"];
    _position set [2,20];
    _boat setPos _position;
    _heli setSlingLoad _boat;
    _boat setVariable ["introCamHeli", _heli, true];
    _boat allowDamage false;

    {
        if (_boat emptyPositions "cargo" > 0) then {
            _x moveInAny _boat;
            _x allowDamage false;
            _allPlayers deleteAt (_allPlayers find _x);
        };
    } forEach _allPlayers;

    for "_j" from 1 to 6 do {
        private _marker = format ["mrk_intro_heli_wp_%1_%2", _i, _j];
      
        private _position =  getMarkerPos _marker;
        _position set [2,30]; // terrain height
        private _wp = _group addWaypoint [_position, -1]; // negative to make ASL

        diag_log format ["adding waypoint at %1", _position];

        if (_j == 4) then {
            _wp setWaypointStatements ["true", "vehicle this setSlingLoad objNull;"];
            _position set [2,25];
            _wp setWaypointPosition [_position, 0];
        };
    };
};


[{
        params ["_soundSource"];

        deleteVehicle _soundSource;
}, [_soundSource], 180] call CBA_fnc_waitAndExecute;

/*
{
    if (boat_1 emptyPositions "cargo" > 0) then {
        _x moveInAny boat_1;
    } else {
        if (boat_2 emptyPositions "cargo" > 0) then {
            _x moveInAny boat_2;
        };
    };
} forEach (playableUnits + switchableUnits);
*/