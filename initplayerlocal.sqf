if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

[
    {
        !(isNil "SAN_Headlamp_Helmets")
    },{
        SAN_Headlamp_Helmets = SAN_Headlamp_Helmets + ["rhsgref_helmet_pasgt_un", "rhsgref_ssh68_un","rhssaf_helmet_m97_nostrap_blue"];
    },
    []
] call CBA_fnc_waitUntilAndExecute;

// Bleed-Out prevention
#include "\z\ace\addons\medical\functions\script_component.hpp"
//10% of the default Blood Volume as failsafe
#define MIN_BLOOD_VOL (BLOOD_VOLUME_FATAL + 0.1 * DEFAULT_BLOOD_VOLUME)

["unit", {
    params ["_newUnit", "_oldUnit"];

    // remove old perFrameHandler if there is one
    private _id = missionNamespace getVariable ["grad_bleedOutHandler", -1];
    if (_id > -1) then { [_id] call CBA_fnc_removePerFrameHandler; };

    private _isRemoteControlledUnit = false;
    {
        if (getAssignedCuratorUnit _x isEqualTo _newUnit) exitWith {
            _isRemoteControlledUnit = true;
            _isRemoteControlledUnit;
        };
    } forEach allCurators;

    // exit, if unit doesn't exist, or is remote-controlled
    if (isNull _newUnit || {_isRemoteControlledUnit}) exitWith {};
    
    private _handle = [{
        params ["_unit", "_handle"];
        //check if player is awake and bleeding
        if (!IS_UNCONSCIOUS(_unit) || {!IS_BLEEDING(_unit)}) exitWith {};
        //check if player falls below threshold and set threshold as new value
        if (GET_BLOOD_VOLUME(_unit) < MIN_BLOOD_VOL) then {
            private _allCurators = [];
            {
                _allCurators pushBackUnique (getAssignedCuratorUnit _x);     
            } forEach allCurators;
            //[format["%1 fell below %2 litres of blood. Current level: %3 litres", name _unit, MIN_BLOOD_VOL, GET_BLOOD_VOLUME(_unit)]] remoteExec ["systemChat", _allCurators];
            _unit setVariable [VAR_BLOOD_VOL, MIN_BLOOD_VOL, true];
        };
    }, 2, _newUnit] call CBA_fnc_addPerFrameHandler;
    missionNamespace setVariable ["grad_bleedOutHandler", _handle];
}, true] call CBA_fnc_addPlayerEventHandler;