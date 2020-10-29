private _number = player getVariable ["introBoat", 0];
private _boatID = format ["introBoat_%1", _number];

[{
    params ["_boatID"];
    !(isNull missionNamespace getVariable [_boatID, objNull])
},
{
    params ["_boatID"];
    private _boat = missionNamespace getVariable [_boatID, objNull];

    player moveInAny _boat;

},[_boatID]] call CBA_fnc_waitUntilAndExecute;



sleep 2;
cutText ["", "BLACK IN", 20];
7 fadeSound 1;
sleep 8;
playSound "intro_song";
sleep 2;
[ "Somewhere in Esseker", "26.07.2025" ] spawn BIS_fnc_infoText;