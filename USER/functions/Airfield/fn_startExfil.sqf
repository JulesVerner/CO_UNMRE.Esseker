private _spawnPos = [1346.9,6991.08,400];
private _vehicleClass = "B_T_VTOL_01_infantry_F";
private _waypointPos = [8519.29,5803.34,0];

private _vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "FLY"];
_vehicle setDir ((getPos _vehicle) getDir _waypointPos);
_vehicle action ["lightOn", _vehicle];

missionNamespace setVariable ["outroVTOL", _vehicle, true];

private _vehicleGroup = createVehicleCrew _vehicle;
_vehicleGroup setBehaviour "CARELESS";
private _waypoint = _vehicleGroup addWaypoint [_waypointPos, 0];
_waypoint setWaypointSpeed "FULL";

[{
	(getPos (_this # 0)) inArea [_this # 1, 200, 200, 0, false]
}, {
	(_this # 0) action ["Land", _this # 0];
}, [_vehicle, _waypointPos]] call CBA_fnc_waitUntilAndExecute;

[{
	[{
		(speed (_this # 0)) < 30
	}, {
		(_this # 0) animateDoor ['Door_1_source', 1];
		(group (_this # 0)) setBehaviour "AWARE";
		(_this#0) engineOn true;
	}, [_this # 0]] call CBA_fnc_waitUntilAndExecute;
}, [_vehicle], 15] call CBA_fnc_waitAndExecute;