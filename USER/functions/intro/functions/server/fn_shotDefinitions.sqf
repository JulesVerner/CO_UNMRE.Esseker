// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

private _camDefinitions = [
    ["FREE", getPos intro_camPos_0, getPos intro_camPos_1, intro_camTarget_0, intro_camTarget_1, 1, 0, 0.6, 0.6, [0,0,0], [0,0,0]],
    ["FREE", getPos intro_camPos_1, getPos intro_camPos_2, intro_camTarget_1, intro_camTarget_2, 25, 0, 0.6, 0.4, [0,0,0], [0,0,0]],
    ["FREE", getPos intro_camPos_2, getPos intro_camPos_2, intro_camTarget_2, intro_camTarget_3, 15, 0, 0.4, 0.4, [0,0,0], [0,0,0]],
	["FREE", getPos intro_camPos_2, getPos intro_camPos_3, intro_camTarget_3, {vehicle player getVariable ["introCamHeli", objNull]}, 15, 0, 0.4, 0.1, [0,0,0], [0,0,5]],
    ["FREE", getPos intro_camPos_3, getPos vehicle player, {vehicle player getVariable ["introCamHeli", objNull]}, {vehicle player getVariable ["introCamHeli", objNull]}, 5, 0, 0.1, 0.2, [0,0,5], [0,0,1]]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _camDefinitions;