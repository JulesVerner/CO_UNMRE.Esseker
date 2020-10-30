private _position = getPos trg_outro_trees_1;
_position set [2, 100];

private _count = count (playableUnits + switchableUnits);

// in case no chairs are set yet
private _chairsCampFire = ["Land_CampingChair_V1_F", _position, _count] call grad_introFX_fnc_createChairCircle;
_chairsCampFire params ["_chairs", "_campFire"];

/*
[{
    params ["_chairs", "_campFire"];

    {
       _x attachTo [outro_campfire];
    } forEach _chairs;
    _campFire attachTo [outro_campfire];
}, [_chairs, _campFire], 120] call CBA_fnc_waitAndExecute;
*/


{
    [_chairs select _forEachIndex, _x] remoteExec ["grad_introFX_fnc_selectChair", _x];
} forEach (playableUnits + switchableUnits);