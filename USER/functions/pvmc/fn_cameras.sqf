params ["_player", "_bool"];

if !(hasInterface) exitWith {};

if !(_bool) then {
	{
		_x params ["_obj", "_index"];

		_obj setObjectTexture [_index, ""];

	}forEach [
		[screen_01, 0],
		[screen_02, 0],
		[screen_03, 1],
		[screen_03, 2],
		[screen_03, 3],
		[screen_04, 1],
		[screen_04, 2],
		[screen_04, 3]
	];

	{
		deleteVehicle _x;
	}forEach (_player getVariable "GRAD_USER_cameras");
} else {
	screen_01 setObjectTexture [0, "#(argb,512,512,1)r2t(piprendertg6,1)"];
	screen_02 setObjectTexture [0, "#(argb,512,512,1)r2t(piprendertg7,1)"];
	screen_03 setObjectTexture [1, "#(argb,512,512,1)r2t(piprendertg,1)"];
	screen_03 setObjectTexture [2, "#(argb,512,512,1)r2t(piprendertg1,1)"];
	screen_03 setObjectTexture [3, "#(argb,512,512,1)r2t(piprendertg2,1)"];
	screen_04 setObjectTexture [1, "#(argb,512,512,1)r2t(piprendertg3,1)"];
	screen_04 setObjectTexture [2, "#(argb,512,512,1)r2t(piprendertg4,1)"];
	screen_04 setObjectTexture [3, "#(argb,512,512,1)r2t(piprendertg5,1)"]; 

	private _cameras = [];

	{
		_x params ["_camPos", "_camTarget", "_renderTG"];

		private _cam = "camera" camCreate (getPos _camPos); 
		_cam camSetTarget _camTarget; 
		_cam cameraEffect ["Internal", "Back", _renderTG];
		_cam camSetFov 0.3;
		_cam camCommit 0;

		_cameras pushBack _cam;

	}forEach [
		[securityCam_01, securityTarget_01, "piprendertg"],
		[securityCam_02, securityTarget_02, "piprendertg1"],
		[securityCam_03, securityTarget_03, "piprendertg2"],
		[securityCam_04, securityTarget_04, "piprendertg3"],
		[securityCam_05, securityTarget_05, "piprendertg4"],
		[securityCam_06, securityTarget_06, "piprendertg5"],
		[securityCam_07, securityTarget_07, "piprendertg6"],
		[securityCam_07, securityTarget_08, "piprendertg7"]
	];

	_player setVariable ["GRAD_USER_cameras", _cameras];
};