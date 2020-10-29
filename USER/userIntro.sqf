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
    ["CAMERA", 0, intro_camPos_0, intro_camTarget_0, .6, true, false],
    ["MOVE", 0, intro_camPos_0, intro_camTarget_1, .6],
    ["MOVE", 8, intro_camPos_1, intro_camTarget_1, .6],
    ["MOVE", 20, intro_camPos_2, intro_camTarget_2, .4],
    ["MOVE", 15, intro_camPos_2, intro_camTarget_3, .4],
    ["MOVE", 5, intro_camPos_3, ace_player, .1],
    ["BLEND", 5, ["DYNAMIC", "<t color='#ffffff' size = '1'>UN-Friedenstruppen auf dem Weg ins Einsatzgebiet</t>",-1,safeZoneY-safeZoneY/2,6,1,0], -1, -1],
    ["ROTATE", 15, vehicle player, 0, 10, 90, 270, 0.6, true],
    ["CAMERA", 15, intro_camPos_5, ace_player, .6, true, true, 1]
];


if (!isServer) exitWith {};

[{
        private _soundSource = createSoundSource ["waterSplashSource", position intro_camTarget_2, [], 0];

        private _allGroupsWithPlayers = [];
        {
            if (side _x == west && !isMultiplayer) then {
                _allGroupsWithPlayers pushBackUnique group _x
            };
        } forEach allPlayers;

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
            _heli animateSource ["warn_hook_1_1_source",1,true];

            private _boat = createVehicle ["rhsgref_hidf_rhib", [0,0,0], [], 0, "NONE"];
            _position set [2,20];
            _boat setPos _position;
            _heli setSlingLoad _boat;
            _heli setVariable ["introCamBoat", _boat, true];
            _boat setVariable ["introCamHeli", _heli, true];
            _boat allowDamage false;

            private _boatID = format ["introBoat_%1", _i];
            missionNamespace setVariable [_boatID, _boat, true];

            [{
                params ["_heli"];
                (isNull (getSlingLoad _heli))
            },{
                params ["_heli", "_boat"];
                if (!(_heli getVariable ["boatDropped", false])) then {
                    _heli setSlingLoad _boat;
                };
            }, [_heli, _boat]] call CBA_fnc_waitUntilAndExecute;

            {
                private _groupUnits = units _x;
                {
                    if (!(_x getVariable ["playerPlacedInBoat", false])) then {
                        if (_x getVariable ["introBoat", 0] == _i) then {
                            _x moveInAny _boat;
                            _x allowDamage false;
                            _x setVariable ["playerPlacedInBoat", true];
                        };
                    };
                } forEach _groupUnits;
            } forEach _allGroupsWithPlayers;

            private _flightPath = format ["fn_flightPath%1.sqf", _i];

            [_heli, _boat] execVM ("user\functions\intro\functions\records\" + _flightPath);
           
        };


        [{
                params ["_soundSource"];

                deleteVehicle _soundSource;

                missionNamespace setVariable ["UNMRE_introDoneServer", true, true];

        }, [_soundSource], 180] call CBA_fnc_waitAndExecute;

}, [], 10] call CBA_fnc_waitAndExecute;