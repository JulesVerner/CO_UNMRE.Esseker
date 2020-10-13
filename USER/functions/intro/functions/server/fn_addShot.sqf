params ["_camShot"]; // pun intended

private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

_camShots pushBack _camShot;
missionNamespace setVariable ["GRAD_INTROCAM_SHOTS", _camShots];

diag_log format ["GRAD INTROCAM : added %1 to local camshots", _camShot];