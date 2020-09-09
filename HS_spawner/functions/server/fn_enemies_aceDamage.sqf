params ["_target", "_damageDealt"];

private _ace_medical_selections = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];

_damageDealt = _damageDealt; // * RZ_ACEDamageMultiplier;

_selection = selectRandom _ace_medical_selections;

[_target, _damageDealt, _selection, "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _target];

// hintsilent format ["dealing %1 damage", _damageDealt];