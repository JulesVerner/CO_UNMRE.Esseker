private _VTOL = nearestObject [[10112.2,4876.25,-1.90735e-006], "VTOL_Base_F", 5000];

private _outroChair = createVehicle ["Land_CampingChair_V1_F", [10611.6,5275.24,0], [], 0, "NONE"];

private _outroGuy = (createGroup civilian) createUnit ["RDS_Villager2", [10611.6,5275.24,0], [], 0, "NONE"];

[_outroChair, _outroGuy] call acex_sitting_fnc_sit;

missionNamespace setVariable ["outroGuy", _outroGuy, true];
missionNamespace setVariable ["outroVTOL", _VTOL, true];

["USER\functions\outro\fn_shotsOutro.sqf"] remoteExec ["BIS_fnc_execVM"];