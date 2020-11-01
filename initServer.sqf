["Initialize"] call BIS_fnc_dynamicGroups;

[
	{
		private _date = date;

		_date params ["", "", "", "_hour", "_minutes"];

		((_hour == 20) && {_minutes == 15})
	}, {
		setTimeMultiplier 0;
	}, 
	[]
] call CBA_fnc_waitUntilAndExecute;