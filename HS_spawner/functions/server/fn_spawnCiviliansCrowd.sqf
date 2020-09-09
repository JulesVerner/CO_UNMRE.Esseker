params [
    ["_position",[0,0]],
    ["_targetPosition", []],
    ["_radius", 6],
    ["_speed","random"],
    ["_count",9]
];

for "_i" from 0 to _count do {
    
    [{
        params ["_position", "_targetPosition", "_radius", "_speed"];
        private _zombie = [_position, _speed, _radius] call HS_spawner_fnc_spawnCivilians;

        if (count _targetPosition > 0) then {
             [{
                params ["_zombie", "_targetPosition"];

                private _randomizedPosition = [[[_targetPosition, 3]],[]] call BIS_fnc_randomPos;
                if (!alive _zombie) exitWith {};
                if !(local _zombie) then 
                {
                    [_zombie, _randomizedPosition] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
                } else {
                    _zombie domove _randomizedPosition;
                };
            }, [_zombie, _targetPosition], 5] call CBA_fnc_waitAndExecute;
        };

    }, [_position, _targetPosition, _radius, _speed], random _count] call CBA_fnc_waitAndExecute;
};