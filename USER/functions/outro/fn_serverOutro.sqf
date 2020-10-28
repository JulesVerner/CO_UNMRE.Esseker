private _VTOLs = nearestObjects [[10112.2,4876.25,0], ["VTOL_Base_F"], 5000];
_VTOLs params ["_VTOL"];

_VTOLhelper = createVehicle ["Land_VitaminBottle_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_VTOLhelper attachTo [_VTOL, [0.0307617,11.2158,-2.82889]];


private _outroChair = createVehicle ["Land_CampingChair_V1_F", [10611.6,5275.24,0], [], 0, "CAN_COLLIDE"];

private _outroGuy = (createGroup civilian) createUnit ["RDS_Villager2", [10611.6,5275.24,0], [], 0, "NONE"];

[_outroChair, _outroGuy] call acex_sitting_fnc_sit;

missionNamespace setVariable ["outroGuy", _outroGuy, true];
missionNamespace setVariable ["outroVTOL", _VTOL, true];
missionNamespace setVariable ["outroVTOLhelper", _VTOLhelper, true];

[{


    ["USER\functions\outro\fn_shotsOutro.sqf"] remoteExec ["BIS_fnc_execVM"];
}, [], 3] call CBA_fnc_waitAndExecute;