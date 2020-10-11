params ["_player", "_value"];

private _effectsPlayed = _player getVariable ["GRAD_UNMRE_effectsPlayed", []];
_effectsPlayed pushBackUnique _value;
_player setVariable ["GRAD_UNMRE_effectsPlayed", _effectsPlayed, true];