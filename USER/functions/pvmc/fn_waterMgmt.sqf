{
    _x params ["_array", "_time"];
	[{
		_this call GRAD_user_fnc_waterfall;
	}, _array, _time] call CBA_fnc_waitAndExecute;
}forEach [
    [[water_01, 180], 0],
    [[water_03, 180], 10],
    [[water_05, 180], 20],
	[[water_07, 180], 0],
    [[water_09, 180], 10],
    [[water_11, 180], 20],
    [[water_13, 180], 0],
    [[water_15, 180], 10],
    [[water_17, 180], 20],
    [[water_19, 180], 0],
    [[water_21, 180], 10],
    [[water_23, 180], 20]
];

[{[] call grad_user_fnc_waterRise;}, [], 2] call CBA_fnc_waitAndExecute;

[{
    deleteVehicle water_01;
    deleteVehicle water_07;
    deleteVehicle water_13;
    deleteVehicle water_19;
}, [], 30] call CBA_fnc_waitAndExecute;

[{
    deleteVehicle water_03;
    deleteVehicle water_09;
    deleteVehicle water_15;
    deleteVehicle water_21;
}, [], 90] call CBA_fnc_waitAndExecute;

[{
    deleteVehicle water_05;
    deleteVehicle water_11;
    deleteVehicle water_17;
    deleteVehicle water_23;
}, [], 120] call CBA_fnc_waitAndExecute;