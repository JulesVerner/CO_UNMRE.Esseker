params ["_heli"];

private _handle = [{
    params ["_args", "_handle"];
    _args params ["_heli"];

    if (isNull _heli) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (_heli animationPhase "ind_gear_1_1_anim" < 1) then {
        _heli animateSource ['ind_gear_1_1_anim', 1];
    };

    if (_heli animationPhase "ind_gear_1_2_anim" < 1) then {
        _heli animateSource ['ind_gear_1_2_anim', 1];
    };

}, 0, [_heli]] call CBA_fnc_addPerFrameHandler;