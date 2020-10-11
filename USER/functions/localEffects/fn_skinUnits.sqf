
if !(canSuspend) exitWith { _this spawn grad_user_fnc_skinUnits; };

[player, "skinunits"] call grad_user_fnc_setVariable;

private _nearUnits = allUnits select { (((side _x) == west) || ((side _x) == civilian)) && ((player distance2D _x) <= 100) };
if (player in _nearUnits) then {
	_nearUnits deleteAt (_nearUnits find player);
};
private _allBodies = [];

{
	
	private _vectorDir = (_x getRelPos [2, 0]) vectorFromTo (getPos _x);
	private _unitPos = getPosATL _x;

	if !((stance _x) == "UNDEFINED") then {

		hideObject _x;

		private _body = "no_skin_open_chest" createVehicleLocal _unitPos;
		_allBodies pushBackUnique _body;
		_body setPosATL _unitPos;
		private _pos = getPosATL _body;
		_pos set [2, (_pos#2) + 0.8];
		_body setPosATL _pos;

		[_body,[0, 90, 0]] call BIS_fnc_setObjectRotation;
		_body setVectorDir _vectorDir;

	};
	
} forEach _nearUnits;


sleep 5;

{
	deleteVehicle _x;	
} forEach _allBodies;

{
	_x hideObject false;	
} forEach _nearUnits;