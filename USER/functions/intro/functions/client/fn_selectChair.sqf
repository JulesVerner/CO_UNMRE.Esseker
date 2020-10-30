params ["_chair", "_unit"];

[_chair, _unit] call acex_sitting_fnc_sit;
_unit attachTo [outro_campfire];