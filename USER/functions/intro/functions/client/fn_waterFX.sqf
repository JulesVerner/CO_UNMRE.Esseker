params ["_source"];

private _stream = "#particlesource" createVehicleLocal (getPos _source);
// _stream attachTo [_source, [0,0,0]];

private _dir = getDir _source;
_stream setParticleParams [
    ["\A3\data_f\cl_water.p3d", 1, 0, 1],"","BillBoard",1,1,[1.5, 1.5, 1.5],
    [sin (_dir) * 7,cos (_dir) * 7,4],0,100,0.01,0,[2, 2.5, 7, 10],[[0.7, 0.7, 0.7, 0.01], [1, 1, 1, 0.5], [1, 1, 1, 0]],[0.08],1,0,"","",_stream,0,false,0.1,[[0.8,0.7,0.2,0]]];

_stream setDropInterval 0.1;


[{
    params ["_stream"];

    deleteVehicle _stream;
    
}, [_stream], 180] call CBA_fnc_waitAndExecute;