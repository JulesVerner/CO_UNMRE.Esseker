
private _vehicle = createVehicle ["B_T_VTOL_01_infantry_F", [10068.5,4868.95,0], [], 0, "NONE"];
_vehicle setDir 90;
_vehicle action ["lightOn", _vehicle];

missionNamespace setVariable ["outroVTOL", _vehicle, true];

private _vehicleGroup = createVehicleCrew _vehicle;
_vehicleGroup setBehaviour "CARELESS";
private _waypoint = _vehicleGroup addWaypoint [[13272.9,3596.73,357.528], 0];
_waypoint setWaypointSpeed "FULL";

/*
    above only for debug!
*/


private _VTOL = missionNamespace getVariable ["outroVTOL", objNull];

_VTOLhelper = createVehicle ["Land_VitaminBottle_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_VTOLhelper attachTo [_VTOL, [0.0307617,11.2158,-2.82889]];


private _outroChair = createVehicle ["Land_CampingChair_V1_F", [10611.6,5275.24,0], [], 0, "CAN_COLLIDE"];

private _outroGuy = (createGroup civilian) createUnit ["RDS_Villager2", [10611.6,5275.24,0], [], 0, "NONE"];

[_outroChair, _outroGuy] call acex_sitting_fnc_sit;

missionNamespace setVariable ["outroGuy", _outroGuy, true];
missionNamespace setVariable ["outroVTOLhelper", _VTOLhelper, true];

[{


    ["USER\functions\outro\fn_shotsOutro.sqf"] remoteExec ["BIS_fnc_execVM"];
}, [], 3] call CBA_fnc_waitAndExecute;