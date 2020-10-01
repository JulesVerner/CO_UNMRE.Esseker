params [["_minDist", 15], ["_maxDist", 20], ["_speed", 0.001]];

if !(local player) exitWith {
	_this remoteExecCall ["grad_user_fnc_skeletonRushing", player, false];
};

if !(canSuspend) exitWith { _this spawn grad_user_fnc_skeletonRushing; };

private _spawnPos = [];
private _suitablePositionFound = false;

while { !_suitablePositionFound } do {
	_spawnPos = [player, _minDist, _maxDist, 2, 0, 0, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
	if !(_spawnPos isEqualTo [0,0,0]) then {
		private _lineIntersects = lineIntersects[eyePos player, [_spawnPos#0, _spawnPos#1, (getTerrainHeightASL _spawnPos) + 1.8]];
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
0.5 setFog 0.7;

private _skeleton = "impaled_skeleton" createVehicleLocal _spawnPos;
_skeleton setDir (player getDir _skeleton);

player switchMove "Acts_welcomeOnHUB02_PlayerWalk";
player setDir (player getDir _skeleton);

sleep 0.5;

_skeleton say3D "scream_12";

sleep 0.5;

private _initDist = player distance2D _skeleton;
private _distance = 0;

while {(player distance2D _skeleton) > 1.5} do {
	_distance = _distance + 0.01;
	// createVehicle ["Sign_Sphere10cm_F", _skeleton getPos [_distance, _skeleton getDir player], [], 0, "CAN_COLLIDE"];
	private _pos = _skeleton getPos [_distance, _skeleton getDir player];
	// _skeleton setPosASL [_pos#0, _pos#1, getTerrainHeightASL _pos];
	_skeleton setPosASL (AGLToASL _pos);
	_skeleton setDir (player getDir _skeleton);
	sleep _speed;
};

sleep 0.05;
player switchMove "";
0.5 setFog 0;
deleteVehicle _skeleton;
showHud true;
diwako_dui_main_toggled_off = false;


// while {(player distance2D _skeleton) > 2} do {
// 	_distance = _distance + 0.01;

// 	if (_distance < _initDist * 0.8) then {
// 		_skeleton setPos (_skeleton getPos [_distance, _skeleton getDir player]);
// 		_skeleton setDir (player getDir _skeleton);
// 		sleep _slowestSpeed;
// 	} else {

// 		if (_distance < _initDist * 0.6) then {
// 			_skeleton setPos (_skeleton getPos [_distance, _skeleton getDir player]);
// 			_skeleton setDir (player getDir _skeleton);
// 			sleep _slowestSpeed * 0.75;
// 		} else {
// 			if (_distance < _initDist * 0.3) then {
// 				_skeleton setPos (_skeleton getPos [_distance, _skeleton getDir player]);
// 				_skeleton setDir (player getDir _skeleton);
// 				sleep _slowestSpeed * 0.5;
// 			} else {
// 				_skeleton setPos (_skeleton getPos [_distance, _skeleton getDir player]);
// 				_skeleton setDir (player getDir _skeleton);
// 				// sleep _slowestSpeed * 0.25;				
// 			};
// 		};
// 	};
// };