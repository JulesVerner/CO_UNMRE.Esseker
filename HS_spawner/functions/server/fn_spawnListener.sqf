if (!isServer) exitWith {};

["HS_SpawnerRandomCivilian", {
    params ["_position", "_targetPosition", "_radius", "_speed", "_count"];

    [_position, _targetPosition, _radius, _speed, _count] call HS_spawner_fnc_spawnCiviliansCrowd;

}] call CBA_fnc_addEventhandler;



["HS_SpawnerRandomRussian", {
    params ["_position", "_speed"];

    [_position, _speed] call HS_spawner_fnc_spawnRussians;

}] call CBA_fnc_addEventhandler;



["HS_SpawnerRandomLDF", {
    params ["_position", "_speed"];

    [_position, _speed] call HS_spawner_fnc_spawnLDF;

}] call CBA_fnc_addEventhandler;

["HS_SpawnerDemon", {
    params ["_position", "_side"];

    [_position, _side] call HS_spawner_fnc_spawnDemon;

}] call CBA_fnc_addEventhandler;