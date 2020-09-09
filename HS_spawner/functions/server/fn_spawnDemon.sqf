params ["_position", "_side", ["_type", "random"]];

private _zombie = objNull;

switch (_side) do { 
    case "west" : {  _zombie = [_position, _type] call HS_spawner_fnc_spawnLDF; }; 
    case "east" : {  _zombie = [_position, _type] call HS_spawner_fnc_spawnRussians; }; 
    default {  _zombie = [_position, _type] call HS_spawner_fnc_spawnCivilians; }; 
};

_zombie setVariable ["RZ_isDemon", true];

_zombie