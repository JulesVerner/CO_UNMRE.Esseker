


private _source01 = "#particlesource" createVehicleLocal (getPos test);
_source01 setParticleParams [ 
	"a3\data_f\particleeffects\universal\sparksball.p3d",						// 1	shapeName	Render	String or Array format [p3dPath, nth, index, count, loop]:
	"",  						// 2	animationName	N/A	String - obsolete parameter that was meant to play .rtm anims, will throw "Skeletal animation not supported for particles" rpt error if not empty
	"SpaceObject",				// 3	type	Render	String - "Billboard" or "SpaceObject" 
	0,							// 4	timerPeriod	Script	Number - In seconds. 
	0.2,						// 5	lifetime	Physical	Number - In seconds. 
	[0,0,0],  					// 6	position	Physical	Array format Position
	[0,0,0],  				// 7	moveVelocity	Physical	Array format velocity
	0,  						// 8	rotationVelocity	Physical	Number - rotations per second
	0.1,	  					// 9	weight	Physical	Number - weight of the particle (kg)
	0.1,  						// 10	volume	Physical	Number - volume of the particle in m3
	0.01,  						// 11	rubbing	Physical	Number - Determines how particles blown by winds (include downwash by helicopters).
	[1],		  				// 12	size	Render	Array of Numbers - particle size along its lifetime, in meter
	[[1,1,1,1], [1,1,1,1]],  	// 13	color	Render	Array of Arrays format Color
	[0,0,0],  					// 14	animationPhase	Render	Array of Numbers - phase of the animation in time. In other words, the play speed of the selected frames for the Number of Frames to Play above. The higher the number, the faster it plays through the animation frames. Note that if the Number of Frames to Play above is set to 1, this will have no visible effect.
	0.05,  						// 15	randomDirectionPeriod	Random	Number - In seconds.
	5,  						// 16	randomDirectionIntensity	Random	Number - How particles change its velocity every once in randomDirectionPeriod seconds, in meters?
	"",  						// 17	onTimer	Script	String - path to the script to be executed on timer. Variable _this contains particle position.
	"",							// 18	beforeDestroy	Script	String - code executed right before particle's destruction.  
	_this						// 19	object	Physical	Object - If this parameter isn't objNull, the particle source will be attached to the object. The source will stop to generate its particles when the distahce between the object and the source is further than Object View Distance.
								// 20	angle	Physical	Number - (Optional, default 0) determines the particle's starting angle in radian. pi = 180°. 
							// 21	onSurface	Physical	Boolean - (Optional, default false) Bounce the particles when hit the surface if true. If circleRadius > 0, placing of particle on (water) surface on start of its existence. Circle radius is defined by command setParticleCircle.
							// 22	bounceOnSurface	Physical	Number - (Optional, default -1) coef of bounce in collision with ground, 0..1 for collisions, -1 to disable collision. Should be used soberly as it has a significant impact on performance.
			// 23	emissiveColor	Render	Array of Arrays format Color - (Optional, default [ ]?) Sets emissivity of the particle (RGB0). Works as lighting of particles, so must be combined with correctly set particle color. Values need to be higher than just 0-1 to have a real effect (f.e. 100 times the RGB color values). Last parameter has no meaning for now. 
								// 24	vectorDir	Physical	Array format vectorDir? - (Optional) Sets the default direction for SpaceObject particles. 
];
_source01 setDropInterval 0.05;