params ["_heli"];

_heli addEventHandler ["Gear", {
    params ["_vehicle", "_gearState"];

    if (_gearState) then {
        (selectRandom allPlayers) Action ["landgearup",_heli]; 
        private _wps = waypoints _heli;
        private _pilot = driver _heli;
        _pilot setdamage 1;
        deleteVehicle _pilot;
        createVehicleCrew _heli;
        { _heli addWaypoint _x; } forEach _wps;
    };
}];