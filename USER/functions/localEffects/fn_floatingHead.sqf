
if !(canSuspend) exitWith { _this spawn grad_user_fnc_floatingHead; };

private _head = "Asian_Head" createVehicleLocal (getPos player);
_head hideObject true;

_head attachTo [player, [-0.06,0.5,0.125], "head"];
[_head, [-90, 0, -90]] call BIS_fnc_setObjectRotation;

sleep 0.5;

// [{
// deleteVehicle _this;
// }, _head, 10] call CBA_fnc_waitAndExecute;


private _increment = 0;
while {_increment <= 3} do {
	_head hideObject false;
	sleep ((random 2) + 0.5);
	_head hideObject true;
	sleep ((random 15) + 1);
	_increment = _increment + 1;
};