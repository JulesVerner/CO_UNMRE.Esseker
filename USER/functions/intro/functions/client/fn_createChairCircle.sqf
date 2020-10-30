/*

    ["Land_CampingChair_V1_F", cursorTarget, 10] call missionControl_fnc_createChairCircle;

*/
params ["_type", "_pos", "_count"];

_missionControl_fnc_getPosInCircle = {
    params ["_origin", "_count", "_distance"];

    private _array = [];
    private _angle = 360/_count;
    private _direction = 0;

    for "_i" from 1 to _count do {

        private _position = _origin getPos [_distance, _direction];
        _position set [2,100];

        _array pushBack _position;

        _direction = _direction + _angle;
    };

    _array
};

// params ["_origin", "_count", "_distance"];
private _positions = [_pos, _count, _count/5] call _missionControl_fnc_getPosInCircle;
private _chairs = [];

{
    private _chair = createVehicle [_type, _x, [], 0, "CAN_COLLIDE"];
    _chair setDir ((_chair getRelDir _pos) - 180);
    _chairs pushBack _chair;
    _chair attachTo [outro_campfire];
} forEach _positions;

private _campFire = createVehicle ["Land_Campfire_burning", _pos, [], 0, "CAN_COLLIDE"];
_campFire attachTo [outro_campfire];

[_chairs, _campFire]