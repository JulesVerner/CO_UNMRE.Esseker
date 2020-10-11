params [["_minDist", 15], ["_maxDist", 20]];

if !(canSuspend) exitWith { _this spawn grad_user_fnc_skeletonRushing; };

[player, "skeletonRushing"] call grad_user_fnc_setVariable;

private _spawnPos = [];
private _suitablePositionFound = false;

while { !_suitablePositionFound } do {
	_spawnPos = [player, _minDist, _maxDist, 2, 0, 0, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
	if !(_spawnPos isEqualTo [0,0,0]) then {
		private _lineIntersects = lineIntersects[eyePos player, [_spawnPos#0, _spawnPos#1, (getTerrainHeightASL _spawnPos) + 1.9]];
		if !(_lineIntersects) then {
			_suitablePositionFound = true;
		} else {
			sleep 0.1;
		};	
	} else {
		sleep 0.1;
	};
};

showHud false;
diwako_dui_main_toggled_off = true;
private _foglevel = fog;
0 setFog 0.7;

private _skeleton = "impaled_skeleton" createVehicleLocal _spawnPos;
_skeleton setDir (player getDir _skeleton);

// private _skeletonPos = getPosASL _skeleton;
// private _lightsource = "#lightpoint" createVehicleLocal (getPosATL _skeleton);
// _lightsource setPosASL [_skeletonPos#0, _skeletonPos#1, 1.9];
// _lightsource setLightColor [1,0.15,0];
// _lightsource setLightBrightness 1;
// _lightsource attachTo [_skeleton];

// private _fire = "test_EmptyObjectForFireBig" createVehicleLocal (getPos _skeleton);
// _fire attachTo [_skeleton];

private _ps1 = "#particlesource" createVehicleLocal (getPosATL _skeleton);
_ps1 setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard",
	1, 1, [0, 0, 0], [0, 0, 0.5], 0, 1, 1, 3, [0.5,1.5],
	[[1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
	[0.25,1], 1, 1, "", "", _this];
_ps1 setParticleRandom [0.2, [0.5, 0.5, 0.25], [0.125, 0.125, 0.125], 0.2, 0.2, [0, 0, 0, 0], 0, 0];
_ps1 setDropInterval 0.001;

// Smoke
// private _ps2 = "#particlesource" createVehicleLocal (getPosATL _skeleton);
// _ps2 setParticleParams [
// 	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 1, 1], "", "Billboard",
// 	1, 5, [0, 0, 1], [0, 0, 1.5], 0, 1, 1, 0.5, [1.75,2,3,4.5], // timerPeriod → size
// 	[[1,1,1,0], [1,1,1,0.5], [1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
// 	[0.5,0.5], 0, 0, "", "", _ps2];
// _ps2 setParticleRandom [0.5, [1, 1, 0.4], [0, 0, 0.5], 0, 0.125, [0, 0, 0, 0], rad 30, 0];
// _ps2 setDropInterval 0.02;
// _ps2 attachTo [_skeleton];

sleep 2;

_skeleton say3D "scream_12";

sleep 0.9;

// private _initDist = player distance2D _skeleton;
private _distance = 0;


[
	{
		params ["_args", "_handle"];
		_args params ["_skeleton", "_distance", "_foglevel", "_ps1"];
		if ((player distance2D _skeleton) > 1) then {
			_distance = _distance + 0.4;
			// createVehicle ["Sign_Sphere10cm_F", _skeleton getPos [_distance, _skeleton getDir player], [], 0, "CAN_COLLIDE"];
			private _pos = AGLToASL (_skeleton getPos [_distance, _skeleton getDir player]);
			// _skeleton setPosASL [_pos#0, _pos#1, getTerrainHeightASL _pos];
			_skeleton setPosASL _pos;
			_ps1 setPosASL [_pos#0, _pos#1, 1];
			_skeleton setDir (player getDir _skeleton);
		} else {
			[_handle] call cba_fnc_removeperframehandler;
			deleteVehicle _ps1;
			deleteVehicle _skeleton;
			0 setFog _foglevel;
			showHud true;
			diwako_dui_main_toggled_off = false;			
		};
	}, 0, [_skeleton, _distance, _foglevel, _ps1]
] call CBA_fnc_addPerFrameHandler;