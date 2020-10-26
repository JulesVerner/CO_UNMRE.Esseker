{
    _x params ["_array", "_time"];
	[{
		_this call GRAD_user_fnc_waterfall;
	}, _array, _time] call CBA_fnc_waitAndExecute;
}forEach [
    [[water_01, 0], 0],
    [[water_02, 0], 5],
    [[water_03, 0], 10],
	[[water_04, 0], 15],
    [[water_05, 0], 20],
    [[water_06, 0], 25],
	[[water_07, 0], 0],
    [[water_08, 0], 5],
    [[water_09, 0], 10],
	[[water_10, 0], 15],
    [[water_11, 0], 20],
    [[water_12, 0], 25],
    [[water_13, 0], 0],
    [[water_14, 0], 5],
    [[water_15, 0], 10],
	[[water_16, 0], 15],
    [[water_17, 0], 20],
    [[water_18, 0], 25],
    [[water_19, 0], 0],
    [[water_20, 0], 5],
    [[water_21, 0], 10],
	[[water_22, 0], 15],
    [[water_23, 0], 20],
    [[water_24, 0], 25]
];

[{[] call grad_user_fnc_waterRise;}, [], 2] call CBA_fnc_waitAndExecute;

