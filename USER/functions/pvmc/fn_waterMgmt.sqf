{
    _x params ["_array", "_time"];
	[{
		_this call GRAD_user_fnc_waterfall;
	}, _array, _time] call CBA_fnc_waitAndExecute;
}forEach [
    [[water_01, 0], 0],
    [[water_03, 0], 10],
    [[water_05, 0], 20],
	[[water_07, 0], 0],
    [[water_09, 0], 10],
    [[water_11, 0], 20],
    [[water_13, 180], 0],
    [[water_15, 180], 10],
    [[water_17, 180], 20],
    [[water_19, 180], 0],
    [[water_21, 180], 10],
    [[water_23, 180], 20]
];

[{[] call grad_user_fnc_waterRise;}, [], 2] call CBA_fnc_waitAndExecute;


[{
    !(missionNamespace getVariable ["PVMC_waterRising", false])
},{
    deleteVehicle water_01;
    deleteVehicle water_07;
    deleteVehicle water_13;
    deleteVehicle water_19;
}, []] call CBA_fnc_waitUntilAndExecute;


[{
    !(missionNamespace getVariable ["PVMC_waterRising", false])
},{
    deleteVehicle water_03;
    deleteVehicle water_09;
    deleteVehicle water_15;
    deleteVehicle water_21;
}, []] call CBA_fnc_waitUntilAndExecute;


[{
    !(missionNamespace getVariable ["PVMC_waterRising", false])
},{
    deleteVehicle water_05;
    deleteVehicle water_11;
    deleteVehicle water_17;
    deleteVehicle water_23;
}, []] call CBA_fnc_waitUntilAndExecute;