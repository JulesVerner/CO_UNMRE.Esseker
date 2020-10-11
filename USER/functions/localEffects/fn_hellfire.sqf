params ["_player", ["_duration", 10]];

if !(local _player) then {
	_this remoteExecCall ["grad_user_fnc_hellfire", _player, false];
};

[player, "hellfire"] call grad_user_fnc_setVariable;

private _pos = getPos _player; 
private _count = 60; 
private _positions = []; 
private _angle = 360/_count; 
private _direction = 0; 
 
 
for "_i" from 1 to _count do { 
	private _newPos = _pos getPos [15, _direction]; 

	private _heightASL = getTerrainHeightASL _newPos;
	if ((_newPos select 2) <= (_heightASL)) then {
		_newPos set [2, (_heightASL) + 0.3];
	};
 	_positions pushBack _newPos; 
 	_direction = _direction + _angle; 
}; 
 
private _particleSourcesArray = []; 
private _helpers = [];
 
{ 
	private _helper = "Land_HelipadEmpty_F" createVehicleLocal _x; 

	
	private _particleSource = "#particlesource" createVehicleLocal _x; 
	_particleSource setParticleCircle [0, [0, 0, 0]]; 
	_particleSource setParticleRandom [0.2, [ 1, 1, 0], [2, 2, 1], 0.2, 0.2, [0, 0, 0, 0], 0, 0]; 
	_particleSource setDropInterval 0.05; 
	_particleSource setParticleParams [ 
		["\ca\data\ParticleEffects\FireAndSmokeAnim\FireAnim", 8, 2, 7],  
		"",  
		"Billboard",  
		1,  
		1,  
		[random 0.5, random 0.5, 0],  
		[0, 0, 2],  
		1,  
		1,  
		0.9,  
		0.3,  
		[4,6], 
		[[1,1,1,0.7], [1,1,1,0.5],  
		[1,1,1,0]],  
		[0,1],  
		1,  
		1,  
		"",  
		"",  
		_helper 
	]; 
	
	private _particleSource1 = "#particlesource" createVehicleLocal _x; 
	_particleSource1 setParticleCircle [0, [0, 0, 0]]; 
	_particleSource1 setParticleRandom [0.5, [1, 1, 0.4], [0, 0, 4], 0, 0.5, [0, 0, 0, 0], 0, 0]; 
	_particleSource1 setDropInterval 0.01; 
	_particleSource1 setParticleParams [ 
		["\ca\data\ParticleEffects\FireAndSmokeAnim\FireAnim", 8, 2, 1],  
		"",  
		"Billboard",  
		1,  
		2,  
		[0, random 0.5,  random 1],  
		[0, 0, 1],  
		10, 1,  
		0.9,  
		0.3,  
		[1], 
		[[1,1,1,0.5], 
		[1,1,1,0.2], 
		[1,1,1,0]],  
		[0.5,0.5,0],  
		1,  
		1,  
		"",  
		"",  
		_helper 
	]; 
	
	_particleSourcesArray = _particleSourcesArray + [_particleSource, _particleSource1, _helper]; 
	_helpers pushBack _helper;
}forEach _positions; 

[{
	params ["_helpers", "_handle"];

	if (isNull (_helpers select 0)) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};

	private _index = random 3;
	
	for "_i" from 1 to _index do {
		private _from = selectRandom _helpers;

		_from say3D (selectRandom [
			"scream_1", 
			"scream_2", 
			"scream_3", 
			"scream_4", 
			"scream_5", 
			"scream_6", 
			"scream_7", 
			"scream_8",
			"scream_9",
			"scream_10",
			"scream_11"
		]);
	};
}, 1, _helpers] call CBA_fnc_addPerFrameHandler;
 
[{ 
	{ 
		deleteVehicle _x; 
	}forEach _this; 
}, _particleSourcesArray, _duration] call CBA_fnc_waitAndExecute;