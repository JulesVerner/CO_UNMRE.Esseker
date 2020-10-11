
if !(canSuspend) exitWith { _this spawn grad_user_fnc_headFountain; };

[player, "headFountain"] call grad_user_fnc_setVariable;

// private _whiteHeads = ["WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21", "WhiteHead_22_a", "WhiteHead_22_l", "WhiteHead_22_sa", "WhiteHead_23", "WhiteHead_24", "WhiteHead_25", "WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32", "RussianHead_1", "RussianHead_2", "RussianHead_3", "RussianHead_4", "RussianHead_5", "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4", "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8", "LivonianHead_9", "LivonianHead_10"];
private _greekHeads = ["GreekHead_A3_01", "GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "GreekHead_A3_10_a", "GreekHead_A3_10_l", "GreekHead_A3_10_sa", "GreekHead_A3_11", "GreekHead_A3_12", "GreekHead_A3_13", "GreekHead_A3_14", "Mavros", "Sturrock"];
private _persianHeads = ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03", "PersianHead_A3_04_a", "PersianHead_A3_04_l", "PersianHead_A3_04_sa", "Ioannou"];
private _blackHeads = ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "TanoanHead_A3_01", "TanoanHead_A3_02", "TanoanHead_A3_03", "TanoanHead_A3_04", "TanoanHead_A3_05", "TanoanHead_A3_06", "TanoanHead_A3_07", "TanoanHead_A3_08", "Barklem"];
private _asianHeads = ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"];

private _nearUnits = allUnits select { (((side _x) == west) || ((side _x) == civilian)) && ((player distance2D _x) <= 100) };
if (player in _nearUnits) then {
	_nearUnits deleteAt (_nearUnits find player);
};

private _allSources = [];

{
	private _head = face _x;
	private _p3d = "";
	switch (true) do {
		case (_head in _greekHeads): { _p3d = "a3\characters_f\heads\m_greek_01.p3d" };
		case (_head in _persianHeads): { _p3d = "a3\characters_f\heads\m_persian_01.p3d" };
		case (_head in _blackHeads): { _p3d = "a3\characters_f\heads\m_african_01.p3d" };
		case (_head in _asianHeads): { _p3d = "a3\characters_f\heads\m_asian_01.p3d" };
		default { _p3d = "a3\characters_f\heads\m_white_01.p3d" };
	};

	private _source01 = "#particlesource" createVehicleLocal (eyePos _x);
	_source01 attachTo [_x, [0,0,0.2], "head"];
	_source01 setParticleParams [ 
		_p3d,						// 1	shapeName	Render	String or Array format [p3dPath, nth, index, count, loop]:
		"",  						// 2	animationName	N/A	String - obsolete parameter that was meant to play .rtm anims, will throw "Skeletal animation not supported for particles" rpt error if not empty
		"SpaceObject",				// 3	type	Render	String - "Billboard" or "SpaceObject" 
		0,							// 4	timerPeriod	Script	Number - In seconds. 
		1.5,						// 5	lifetime	Physical	Number - In seconds. 
		[0,0,0],  					// 6	position	Physical	Array format Position
		[0, 0, 0.45],  				// 7	moveVelocity	Physical	Array format velocity
		0,  						// 8	rotationVelocity	Physical	Number - rotations per second
		0.6,	  					// 9	weight	Physical	Number - weight of the particle (kg)
		1,  						// 10	volume	Physical	Number - volume of the particle in m3
		0.04,  						// 11	rubbing	Physical	Number - Determines how particles blown by winds (include downwash by helicopters).
		[1],		  				// 12	size	Render	Array of Numbers - particle size along its lifetime, in meter
		[[1,1,1,1], [1,1,1,1]],  	// 13	color	Render	Array of Arrays format Color
		[0,0,0],  					// 14	animationPhase	Render	Array of Numbers - phase of the animation in time. In other words, the play speed of the selected frames for the Number of Frames to Play above. The higher the number, the faster it plays through the animation frames. Note that if the Number of Frames to Play above is set to 1, this will have no visible effect.
		0,  						// 15	randomDirectionPeriod	Random	Number - In seconds.
		0,  						// 16	randomDirectionIntensity	Random	Number - How particles change its velocity every once in randomDirectionPeriod seconds, in meters?
		"",  						// 17	onTimer	Script	String - path to the script to be executed on timer. Variable _this contains particle position.
		"",							// 18	beforeDestroy	Script	String - code executed right before particle's destruction.  
		_this,						// 19	object	Physical	Object - If this parameter isn't objNull, the particle source will be attached to the object. The source will stop to generate its particles when the distahce between the object and the source is further than Object View Distance.
		0,							// 20	angle	Physical	Number - (Optional, default 0) determines the particle's starting angle in radian. pi = 180°. 
		false,						// 21	onSurface	Physical	Boolean - (Optional, default false) Bounce the particles when hit the surface if true. If circleRadius > 0, placing of particle on (water) surface on start of its existence. Circle radius is defined by command setParticleCircle.
		0,							// 22	bounceOnSurface	Physical	Number - (Optional, default -1) coef of bounce in collision with ground, 0..1 for collisions, -1 to disable collision. Should be used soberly as it has a significant impact on performance.
		[[1,1,1,1], [1,1,1,1]]		// 23	emissiveColor	Render	Array of Arrays format Color - (Optional, default [ ]?) Sets emissivity of the particle (RGB0). Works as lighting of particles, so must be combined with correctly set particle color. Values need to be higher than just 0-1 to have a real effect (f.e. 100 times the RGB color values). Last parameter has no meaning for now. 
									// 24	vectorDir	Physical	Array format vectorDir? - (Optional) Sets the default direction for SpaceObject particles. 
	];
	_source01 setDropInterval 0.06;
	_allSources pushBackUnique _source01;

} forEach _nearUnits;


sleep 5;


{	
	deleteVehicle _x;	
} forEach _allSources;