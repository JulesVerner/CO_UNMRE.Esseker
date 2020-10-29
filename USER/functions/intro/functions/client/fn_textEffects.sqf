private _number = player getVariable ["introBoat", 0];
private _boatID = format ["introBoat_%1", _number];

[{
    params ["_boatID"];
    0 fadeSound 0;
    !(isNull (missionNamespace getVariable [_boatID, objNull]))
},
{
    params ["_boatID"];
    private _boat = missionNamespace getVariable [_boatID, objNull];

    0 fadeSound 0;
    player moveInAny _boat;
    player allowDamage false;

    [] spawn {
        sleep 3;
        cutText ["", "BLACK IN", 20];
        sleep 5;
        3 fadeSound 1;
        sleep 3;
        playSound "intro_song";
        sleep 2;
        [ "Somewhere in Esseker", "26.07.2025" ] spawn BIS_fnc_infoText;
    };

},[_boatID]] call CBA_fnc_waitUntilAndExecute;