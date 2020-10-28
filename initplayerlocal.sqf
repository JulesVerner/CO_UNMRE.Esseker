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