params ["_object"];

private _position = position _object;

_position set [2,2];

if (!isServer) exitWith {};

if (missionNamespace getVariable ["policeFeed", false]) exitWith {};
missionNamespace setVariable ["policeFeed", true, true];

private _grpUnit = createGroup east;

private _allTypes = [
    "GRAD_CivilianZed_rds_schoolteacher",
    "GRAD_CivilianZed_rds_Functionary1",
    "GRAD_CivilianZed_rds_Functionary2",
    "GRAD_CivilianZed_rds_doctor",
    "GRAD_CivilianZed_rds_uniform_priest",
    "GRAD_CivilianZed_rds_uniform_assistant",
    "GRAD_CivilianZed_rds_uniform_Worker1",
    "GRAD_CivilianZed_rds_uniform_Worker2",
    "GRAD_CivilianZed_rds_uniform_Worker3",
    "GRAD_CivilianZed_rds_uniform_Worker4",
    "GRAD_CivilianZed_rds_uniform_Woodlander1",
    "GRAD_CivilianZed_rds_uniform_Woodlander2",
    "GRAD_CivilianZed_rds_uniform_Woodlander3",
    "GRAD_CivilianZed_rds_uniform_Woodlander4",
    "GRAD_CivilianZed_rds_uniform_Villager1",
    "GRAD_CivilianZed_rds_uniform_Villager2",
    "GRAD_CivilianZed_rds_uniform_Villager3",
    "GRAD_CivilianZed_rds_uniform_Villager4",
    "GRAD_CivilianZed_rds_uniform_Profiteer1",
    "GRAD_CivilianZed_rds_uniform_Profiteer2",
    "GRAD_CivilianZed_rds_uniform_Profiteer3",
    "GRAD_CivilianZed_rds_uniform_Profiteer4",
    "GRAD_CivilianZed_rds_uniform_citizen1",
    "GRAD_CivilianZed_rds_uniform_citizen2",
    "GRAD_CivilianZed_rds_uniform_citizen3",
    "GRAD_CivilianZed_rds_uniform_citizen4",
    "GRAD_CivilianZed_rds_uniform_Rocker1",
    "GRAD_CivilianZed_rds_uniform_Rocker2",
    "GRAD_CivilianZed_rds_uniform_Rocker3",
    "GRAD_CivilianZed_rds_uniform_Rocker4"
];

for "_i" from 0 to 3 do {
    private _unit = _grpUnit createUnit [selectRandom _allTypes, _position, [], 0, "NONE"];
    _grpUnit setVariable ["ace_map_hideBlueForceMarker", true, true];
    _unit setVariable ["suomen_overwriteRZ", true];
    _unit setVariable ["RZ_isDemon", false];
    _unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
    _unit setVariable ["RZ_aggressiveSoundCount",round (random 5),true]; 

    [_unit, selectRandom ["Zombi","Zomboy", "Infected1", "Infected2"]] remoteExec ["setFace", 0, _unit];

    {
        _x addCuratorEditableObjects [[_unit],true];
        nil
    } count allCurators;

    _unit reveal _object;
    [_unit, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"]; 
    _unit disableAI "ANIM";
};

_object setDamage 1;