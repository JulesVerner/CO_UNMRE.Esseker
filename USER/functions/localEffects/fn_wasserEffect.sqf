params ["_object", "_dir"];

private _stream = "#particlesource" createVehicleLocal (getPos _object);

_stream setParticleParams [
    ["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],
	"",
	"BillBoard",
	1,
	4,
	[0,0,0],
    [sin (_dir) * 0.5,cos (_dir) * 0.5,0],
	0,
	1.5,
	1,
	0.1,
	[0.05,0.2,0.5],
	[[0.7,0.7,0.8,0.3], [0.7,0.7,0.8,0.7]],
	[1],
	1,
	0,
	"",
	"",
	_stream,
	0,
	true,
	0.1,
	[[0.8,0.7,0.2,0]]
];

_stream setDropInterval 0.001;

private _pond = createSimpleObject ["gm\gm_structures\gm_rivers\gm_pond_01.p3d", (getPosASL _object vectorAdd [0,0,-3]), true];

[{
	{
		deleteVehicle _x;
	}forEach _this;    
}, [_stream, _pond], 30] call CBA_fnc_waitAndExecute;

if (isNil "GRAD_USER_wasserEffekPFH") then {
	GRAD_USER_wasserEffect = [_pond];

	[{
		params ["", "_handle"];

		if (GRAD_USER_wasserEffect isEqualTo []) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};

		GRAD_USER_wasserEffect = GRAD_USER_wasserEffect - [nil, objNull];

		{
			private _pos = getPos _x;
			_pos params ["","","_zPos"];
			_pos set [2,_zPos + 0.001];
			_x setPos _pos;
		}forEach GRAD_USER_wasserEffect;

	}, 0.1, []] call CBA_fnc_addPerFrameHandler;

} else {
	GRAD_USER_wasserEffect pushBack _pond;
};