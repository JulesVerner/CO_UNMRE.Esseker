/*
private _vehicle = createVehicle ["B_T_VTOL_01_infantry_F", [10068.5,4868.95,0], [], 0, "NONE"];
_vehicle setDir 90;
_vehicle action ["lightOn", _vehicle];

missionNamespace setVariable ["outroVTOL", _vehicle, true];

private _vehicleGroup = createVehicleCrew _vehicle;
_vehicleGroup setBehaviour "CARELESS";



    above only for debug!
*/

if (missionNamespace getVariable ["outroStarted", false]) exitWith {};
missionNamespace setVariable ["outroStarted", true, true];

(selectRandom allPlayers) action ["fireInFlame", outro_campfire];

private _VTOL = missionNamespace getVariable ["outroVTOL", objNull];

private _waypoint = (group _VTOL) addWaypoint [getMarkerPos "mrk_outro_wp_1", 0];
private _waypoint2 = (group _VTOL) addWaypoint [getMarkerPos "mrk_outro_wp_2", 1];
private _waypoint3 = (group _VTOL) addWaypoint [getMarkerPos "mrk_outro_wp_3", 3];
_waypoint setWaypointSpeed "FULL";
_VTOL action ["lightOn", _VTOL];

_VTOL animateDoor ['Door_1_source', 0];

// _VTOLhelper = createVehicle ["Land_VitaminBottle_F", [0,0,0], [], 0, "CAN_COLLIDE"];
// _VTOLhelper attachTo [_VTOL, [0,14.2,-2.8]];
// _VTOLhelper hideObjectGlobal false;

private _outroChair = createVehicle ["Land_CampingChair_V1_F", [10611.6,5275.24,0], [], 0, "CAN_COLLIDE"];

private _outroGuy = (createGroup civilian) createUnit ["RDS_Villager2", [10611.6,5275.24,0], [], 0, "NONE"];

[_outroChair, _outroGuy] call acex_sitting_fnc_sit;

missionNamespace setVariable ["outroGuy", _outroGuy, true];
// missionNamespace setVariable ["outroVTOLhelper", _VTOLhelper, true];

[{


    ["USER\functions\outro\fn_shotsOutro.sqf"] remoteExec ["BIS_fnc_execVM"];
}, [], 3] call CBA_fnc_waitAndExecute;