params ["_player", "_value"];

private _effectsPlayed = _player getVariable ["GRAD_UNMRE_effectsPlayed", []];
private _timesPlayed = _player getVariable ["GRAD_UMRE_" + _value, 0];

_timesPlayed = _timesPlayed + 1;
_effectsPlayed pushBackUnique _value;

_player setVariable ["GRAD_UNMRE_effectsPlayed", _effectsPlayed, true];
_player setVariable ["GRAD_UMRE_" + _value, _timesPlayed, true];