params ["_position", ["_type", "random"], ["_radius", 0]];

private _uniform = "GRAD_SoldierZed_rhs_uniform_emr_patchless";
private _classname = _uniform;

switch (_type) do { 
    case "random" : {
        private _format = format ["%1", selectRandom ["_slow", "_walker", "_crawler", "", "_spider"]];
        _classname = (_uniform + _format);
    };
    case "slow" : {
        private _format = format ["%1", "_slow"];
        _classname = (_uniform + _format);
    };
    case "walker" : {
        private _format = format ["%1", "_walker"];
        _classname = (_uniform + _format);
    };
    case "crawler" : {
        private _format = format ["%1", "_crawler"];
        _classname = (_uniform + _format);
    };
    case "fast" : {
        private _format = format ["%1", ""];
        _classname = (_uniform + _format);
    };
     case "spider" : {
        private _format = format ["%1", "_spider"];
        _classname = (_uniform + _format);
    };
    default {};
};

// hint (_classname + "   " + str _position);


private _grp = creategroup east;
private _zombie = _grp createUnit [_classname, _position, [], _radius, "NONE"];

_zombie enableDynamicSimulation true;
_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_zombie setVariable ["RZ_isDemon", false];
_zombie setVariable ["suomen_overwriteRZ", false];
[_zombie, selectRandom ["Zombi","Zomboy", "Infected1", "Infected2"]] remoteExec ["setFace", 0, _zombie];

_zombie setVariable ["RZ_aggressiveSoundCount",round (random 5),true];

_zombie setposATL [(getposATL _zombie select 0), (getposATL _zombie select 1), 0];

[_zombie] call HS_spawner_fnc_loadoutRussian;

[_zombie] joinSilent _grp;
// _zombie setVariable ["suomen_smells", true];
// _zombie playMoveNow "AmovPercMstpSnonWnonDnon_SaluteOut";

{
    _x addCuratorEditableObjects [[_zombie],true];
    nil
} count allCurators;

_grp deleteGroupWhenEmpty true;

_zombie