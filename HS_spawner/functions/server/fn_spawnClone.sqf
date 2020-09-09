params ["_deadBody", "_position", "_goggles", "_headgear", "_vest", "_backpack", "_items", "_mags"];

[{
    params ["_deadBody", "_position", "_goggles", "_headgear", "_vest", "_backpack", "_items", "_mags"];

    if (isNull _deadBody) exitWith {};

    deleteVehicle _deadBody;

    private _grp = creategroup east;
    private _zombie = _grp createUnit ["GRAD_SoldierZed_rhs_uniform_FROG01_wd_walker", _position, [], 0, "CAN_COLLIDE"];

    _zombie enableDynamicSimulation true;
    _zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
    _zombie setVariable ["RZ_isDemon", false];
    _zombie setVariable ["suomen_overwriteRZ", false];
    [_zombie, selectRandom ["Zombi","Zomboy", "Infected1", "Infected2"]] remoteExec ["setFace", 0, _zombie];

    _zombie setVariable ["RZ_aggressiveSoundCount",round (random 5),true];

    [_zombie] joinSilent _grp;

    _zombie setposATL [(getposATL _zombie select 0), (getposATL _zombie select 1), 0];
    // _zombie setVariable ["suomen_smells", true];

    // _zombie playMoveNow "AmovPercMstpSnonWnonDnon_SaluteOut";

    {
        _x addCuratorEditableObjects [[_zombie],true];
        nil
    } count allCurators;


    _zombie addHeadgear _headgear;
    _zombie addVest _vest;
    _zombie addBackpack _backpack;
    _zombie addGoggles _goggles;


    {
        if (_zombie canAddItemToUniform [_x, 1]) then {
            _zombie addItemToUniform _x;
        } else {
            if (_zombie canAddItemToVest [_x, 1]) then {
                    _zombie addItemToVest _x;
                } else {
                    if (_zombie canAddItemToBackpack [_x, 1]) then {
                        _zombie addItemToBackpack _x;
                        } else {
                        private _holder = "GroundWeaponHolder" createVehicle _position;
                        _holder addItemCargo [_x, 1];
                    };
            };
        };
    } forEach _items;

    {
        private _mag = _x select 0;
        if (_zombie canAddItemToUniform [_mag, 1]) then {
            _zombie addItemToUniform _mag;
        } else {
            if (_zombie canAddItemToVest [_mag, 1]) then {
                    _zombie addItemToVest _mag;
                } else {
                    if (_zombie canAddItemToBackpack [_mag, 1]) then {
                        _zombie addItemToBackpack _mag;
                        } else {
                        private _holder = "GroundWeaponHolder" createVehicle _position;
                        _holder addItemCargo [_mag, 1];
                    };
            };
        };
    } forEach _mags;

},[_deadBody, _position, _goggles, _headgear, _vest, _backpack, _items, _mags], 5] call CBA_fnc_waitAndExecute;