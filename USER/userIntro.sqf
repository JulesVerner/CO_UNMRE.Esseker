GRAD_introCam_playOnStart = true;
GRAD_introCam_allowForJIP = false;

/*

    SHOT TYPES:
    ["CAMERA", duration, pos, target, zoom, showBorders, fade, fadeTime, fadeText, effectCam, effectCamType],
    ["MOVE", duration, pos, target, fov (optional), offset (optional), commitTime (optional)],
    ["ATTACH", duration, object, target, fov1, offset (optional)],
    ["ROTATE", duration, target, height, radius, startingAngle, endAngle, clockwise (optional), rise (optional)]
    ["BLEND",  duration, textType, blendOut (optional), blendIn (optional), extension]

* CAM PARAMETERS:
* Duration <NUMBER>
* Positions <OBJECT / POSITION>
* Target <OBJECT / POSITION>
* Zoom Factor <NUMBER> (default: 1)
* Show Borders <BOOLEAN> (default: true)
* Fade <STRING> (default: "")
* Fade Time <NUMBER> (default: 1)
* Fade Text <STRING> (default: "")
* Camera Effect <STRING> (default: "internal")
* Camera Effect Type <STRING> (default: "BACK")
*/

GRAD_introCam_shotDefinitions = [
    ["CAMERA", 0, intro_camPos_0, intro_camTarget_0, .6, true, false, 1],
    ["MOVE", 0, intro_camPos_0, intro_camTarget_1, .6],
    ["MOVE", 8, intro_camPos_1, intro_camTarget_1, .6],
    ["MOVE", 22, intro_camPos_2, intro_camTarget_2, .4],
    ["MOVE", 15, intro_camPos_2, intro_camTarget_3, .4],
    ["MOVE", 15, intro_camPos_3, ace_player, .1],
    ["BLEND", 10, ["DYNAMIC", "<t color='#ffffff' size = '1'>UN-Friedenstruppen auf dem Weg ins Einsatzgebiet</t>",-1,safeZoneY-safeZoneY/2,6,1,0], -1, -1],
    ["ROTATE", 15, vehicle player, 0, 10, 90, 270, 0.6, true],
    ["CAMERA", 15, intro_camPos_2, ace_player, .6, true, true, 1]
];

["CBA_loadingScreenDone", {
    [] spawn {
        
        if (!didJIP) then {
            0 fadeSound 0;
            cutText ["", "BLACK IN", 20];

            [] spawn GRAD_introFX_fnc_textEffects;
        };
    };
}] call CBA_fnc_addEventHandler;


if (!isServer) exitWith {};

private _soundSource = createSoundSource ["waterSplashSource", position intro_camTarget_2, [], 0];

private _allPlayers = (playableUnits + switchableUnits);

for "_i" from 1 to 4 do {

    private _position = getMarkerPos (format ["mrk_intro_heli_start_%1", _i]);
    _position set [2,50];
    private _heli = createVehicle ["gm_ge_army_ch53g", _position, [], 0, "FLY"];
    [
        _heli,
        ["gm_ge_un",1], 
        ["cargoseat_source",0]
    ] call BIS_fnc_initVehicle;

    private _group = createVehicleCrew _heli;

    _heli setCombatMode "BLUE";
    _heli disableAI "Lights";
    _heli setPilotLight true;
    _heli setBehaviour "CARELESS";
    _heli setSpeedMode "SLOW";
    _heli flyInHeight 10;
    _heli flyInHeightASL [20,20,20];
    _heli animateSource ["slingloadlights_source", 1];
    _heli disableAI "AUTOCOMBAT";
    _heli allowDamage false;
    _heli setVariable ["ace_map_hideBlueForceMarker", true, true];

    [_heli] execVM "USER\functions\intro\functions\client\fn_enforceGearUp.sqf";

    private _boat = createVehicle ["rhsgref_hidf_rhib", [0,0,0], [], 0, "NONE"];
    _position set [2,20];
    _boat setPos _position;
    _heli setSlingLoad _boat;
    _heli setVariable ["introCamBoat", _boat, true];
    _boat setVariable ["introCamHeli", _heli, true];
    _boat allowDamage false;

    {
        if (_boat emptyPositions "cargo" > 0) then {
            _x moveInAny _boat;
            _x allowDamage false;
            _allPlayers deleteAt (_allPlayers find _x);
        };
    } forEach _allPlayers;

    for "_j" from 1 to 6 do {
        private _marker = format ["mrk_intro_heli_wp_%1_%2", _i, _j];
      
        private _position =  getMarkerPos _marker;
        _position set [2,20];

         // terrain height
        private _wp = _group addWaypoint [_position, -1]; // negative to make ASL
        _wp setWaypointType "MOVE";

        diag_log format ["adding waypoint at %1", _position];

        if (_j == 4) then {
            _position set [2,10];
            _wp setWaypointType "MOVE";
            _wp setWaypointStatements ["true", "(vehicle this) land 'land'; [vehicle this] execVM 'user\functions\intro\functions\client\fn_heliland.sqf';"];
            _wp setWPPos _position;
        };
    };
};


[{
        params ["_soundSource"];

        deleteVehicle _soundSource;
}, [_soundSource], 180] call CBA_fnc_waitAndExecute;

/*

private _camDefinitions = [
    ["FREE", getPos intro_camPos_0, getPos intro_camPos_1, intro_camTarget_0, intro_camTarget_1, 1, 0, 0.6, 0.6, [0,0,0], [0,0,0]],
    ["FREE", getPos intro_camPos_1, getPos intro_camPos_2, intro_camTarget_1, intro_camTarget_2, 25, 0, 0.6, 0.4, [0,0,0], [0,0,0]],
    ["FREE", getPos intro_camPos_2, getPos intro_camPos_2, intro_camTarget_2, intro_camTarget_3, 15, 0, 0.4, 0.4, [0,0,0], [0,0,0]],
    ["FREE", getPos intro_camPos_2, getPos intro_camPos_3, intro_camTarget_3, {vehicle player getVariable ["introCamHeli", objNull]}, 15, 0, 0.4, 0.1, [0,0,0], [0,0,5]],
    ["FREE", getPos intro_camPos_3, getPos vehicle player, {vehicle player getVariable ["introCamHeli", objNull]}, {vehicle player getVariable ["introCamHeli", objNull]}, 5, 0, 0.1, 0.2, [0,0,5], [0,0,1]]
];
*/