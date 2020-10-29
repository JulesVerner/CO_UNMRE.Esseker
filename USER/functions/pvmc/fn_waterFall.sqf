params ["_object", "_dir"]; 
 
private _stream = "#particlesource" createVehicleLocal (getPosASL _object); 
 
_stream setParticleParams [ 
    ["\a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8], 
 "", 
 "BillBoard", 
 1, 
 2, 
 [0,0,0], 
    [sin (_dir) * 0.5, cos (_dir) * 0.5, 0], 
 0, 
 1.5, 
 1, 
 0, 
 [0.05,0.2,0.5], 
 [[0.7,0.7,0.8,0.3], [0.7,0.7,0.8,0.7]], 
 [1], 
 1, 
 0, 
 "", 
 "", 
 _object, 
 0, 
 true, 
 0.1, 
 [[0.8,0.7,0.2,0]] 
]; 
 
_stream setDropInterval 0.01; 
