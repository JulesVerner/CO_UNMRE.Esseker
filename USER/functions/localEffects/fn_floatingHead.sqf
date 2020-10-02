
if !(canSuspend) exitWith { _this spawn grad_user_fnc_floatingHead; };

private _head = "Asian_Head" createVehicleLocal (getPos player);
_head hideObject true;

_head attachTo [player, [-0.065,0.4,0.13], "head"];
[_head, [-90, 0, -90]] call BIS_fnc_setObjectRotation;

sleep 0.5;

// [{
// deleteVehicle _this;
// }, _head, 10] call CBA_fnc_waitAndExecute;

["FilmGrain", 2000, [0.2, 1.25, 2.0, 0.75, 1.0, true]] spawn
{
	params ["_name", "_priority", "_effect"];

	private _handle = ppEffectCreate [_name, _priority];

	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 0;
	// waitUntil {ppEffectCommitted _handle};
	sleep 6;
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};

// private _increment = 0;
// while {_increment <= 3} do {
_head hideObject false;
playSound "floatingHead";
sleep 6;
deleteVehicle _head;
// sleep ((random 15) + 1);
// _increment = _increment + 1;
// };