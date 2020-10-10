params ["_monitoring"];

if !(canSuspend) exitWith { _this spawn grad_user_fnc_monitorEffects; };

if (_monitoring) then {
	private _id = [{
		{
			private _unitTextArray = _x getVariable ["GRAD_UNMRE_effectsPlayed", []];
			private _unitText = _unitTextArray joinString " • ";
			private _iconPos = ASLtoAGL getPosASL _x;
			if (_unitText != "") then {
				drawIcon3D ["", [1,1,1,0.5], [_iconPos # 0, _iconPos # 1, (_iconPos # 2) - 1], 1, 2, 0, _unitText, 2, 0.03, "RobotoCondensed","center"];
			};		
		} forEach (allPlayers select {(_x distance2D curatorCamera < 800) && (side _x == west)});

	}, 0, []] call CBA_fnc_addPerFrameHandler;
	player setVariable ["GRAD_UNMRE_pfhRunning", _id];
} else {
	[player getVariable ["GRAD_UNMRE_pfhRunning", -1]] call CBA_fnc_removePerFrameHandler;
};