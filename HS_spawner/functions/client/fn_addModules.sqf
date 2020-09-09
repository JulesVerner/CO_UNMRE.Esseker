if (!hasInterface) exitWith {};

["HS_Spawner", "Civilian Z Group", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast","spider"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true],
            [
                "COMBO", 
                ["Count", ""], [
                [
                    1,3,6,9,12,15,18,21
                ], [
                    ["1", "1"],
                    ["3", "3"],
                    ["6", "6"],
                    ["9", "9"],
                    ["12", "12"],
                    ["15", "15"],
                    ["18", "18"],
                    ["21", "21"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed", "_count"];

            // hint str _position;

            ["HS_SpawnerRandomCivilian", [_position, [], 5, _speed, _count]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["HS_Spawner", "Russian Z Group", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            // hint str _position;

            ["HS_SpawnerRandomRussian", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;

["HS_Spawner", "LDF Z Group", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            // hint str _position;

            ["HS_SpawnerRandomLDF", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;



["HS_Spawner", "Single Civilian", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast","spider"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            // hint str _position;
            ["HS_SpawnerRandomCivilian", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["HS_Spawner", "Demon", {

    params ["_position", "_object"];

    ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Side", ""], [
                [
                    "west", "east","civilian"
                ], [
                    ["West", "Finnish"],
                    ["East", "Russian"],
                    ["Civilian", "Civilian"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_side"];

            // hint str _position;
            ["HS_SpawnerDemon", [_position, _side]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["HS_BluforBuyOptions", "Allow Heli (LVL 1)", {
    params ["_position", "_object"];

    {[player, 1] call grad_lbm_fnc_setPermissionLevel} remoteExec ["call",WEST,true];
    ["wita_notification",["VEHICLES UNLOCKED","BLUFOR now has access to lvl 1 vehicles."]] remoteExec ["bis_fnc_showNotification",west,false];
    systemChat "level 1 unlocked";

}] call zen_custom_modules_fnc_register;

["HS_BluforBuyOptions", "Allow APC (LVL 2)", {
    params ["_position", "_object"];

    {[player, 2] call grad_lbm_fnc_setPermissionLevel} remoteExec ["call",WEST,true];
    ["wita_notification",["VEHICLES UNLOCKED","BLUFOR now has access to lvl 2 vehicles."]] remoteExec ["bis_fnc_showNotification",west,false];
    systemChat "level 2 unlocked";

}] call zen_custom_modules_fnc_register;


["HS_Tasks_Independent", "Task 1 (Polizeistation)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask1",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 2 (Hospital)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask2",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 3 (Friedhof)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask3",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Spawn Translation Book", {
    params ["_position", "_object"];

    [_position] remoteExecCall ["HS_spawner_fnc_spawnTranslationBook",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 4 (Schrottplatz)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask4",2];

}] call zen_custom_modules_fnc_register;


["HS_Tasks_Independent", "Spawn Nuclear Waste Truck", {
    params ["_position", "_object"];

    [_position] remoteExecCall ["HS_spawner_fnc_spawnNuclearWasteTruck",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 5 (AKW Müll)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask5",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Spawn Map for Extraction Hint", {
    params ["_position", "_object"];

    [_position] remoteExecCall ["HS_spawner_fnc_spawnMapPlane",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 6 (Flugzeug)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask6",2];

}] call zen_custom_modules_fnc_register;



["HS_Police", "Equip Police Car with Gasmasks and Beacons", {
    params ["_position", "_object"];

    if (_object isKindOf "C_Offroad_01_F") then {
        [_object] remoteExecCall ["HS_spawner_fnc_spawnPoliceCar",2];
    } else {
        systemChat "error: execute on Offroad instead";
    };

}] call zen_custom_modules_fnc_register;

["HS_Police", "Spawn Road Block WEST", {
    params ["_position", "_object"];

    [_position, WEST] remoteExecCall ["HS_spawner_fnc_spawnStreetBlock",2];

}] call zen_custom_modules_fnc_register;

["HS_Police", "Spawn Road Block EAST", {
    params ["_position", "_object"];
    
    [_position, EAST] remoteExecCall ["HS_spawner_fnc_spawnStreetBlock",2];

}] call zen_custom_modules_fnc_register;

["HS_Ambient", "Equip Unit with Gasmask", {
    params ["_position", "_object"];

    [_object] remoteExecCall ["HS_spawner_fnc_equipWithGasMask",2];

}] call zen_custom_modules_fnc_register;

["HS_Ambient", "Play Organ Music", {
    params ["_position", "_object"];

    private _helper = createVehicle ["Land_ClutterCutter_small_F", _position, [], 0, "NONE"];
    [_helper] remoteExec ["HS_spawner_fnc_playOrganMusic",0];

}] call zen_custom_modules_fnc_register;

["HS_Ambient", "Spawn Priest", {
    params ["_position", "_object"];

    [_position] remoteExecCall ["HS_spawner_fnc_spawnPriest",2];

}] call zen_custom_modules_fnc_register;


["HS_MissionEnd", "Mission WON Outro", {
    params ["_position", "_object"];

    [[getMarkerPos "mrk_outro1", getMarkerPos "mrk_outro2", getMarkerPos "mrk_outro3"], "custom\intro\outroServerWin.sqf"] remoteExec ["BIS_fnc_execVM",2];
    
}] call zen_custom_modules_fnc_register;

["HS_MissionEnd", "Mission LOST Outro", {
    params ["_position", "_object"];

    [[], "custom\intro\outroServerLost.sqf"] remoteExec ["BIS_fnc_execVM",2];
    
}] call zen_custom_modules_fnc_register;

["HS_MissionEnd", "Mission WIN WIN Outro", {
    params ["_position", "_object"];

    [[getMarkerPos "mrk_outro1", getMarkerPos "mrk_outro2", getMarkerPos "mrk_outro3"], "custom\intro\outroServerWinWin.sqf"] remoteExec ["BIS_fnc_execVM",2];
    
}] call zen_custom_modules_fnc_register;

{
    _x addEventHandler ["CuratorWaypointPlaced", {
        params ["_curator", "_group", "_waypointID"];

        private _unit = ((units _group) select 0);
        private _position = waypointPosition [_group, _waypointID];

        if (_unit isKindOf "RyanZombieCivilian_F")  then {
            if !(local _zombie) then 
            {
                [_zombie, _position] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
            } else {
                _zombie domove _position;
            }; 
        };
    }];

    // triggers also for groups
    _x addEventHandler ["CuratorObjectPlaced", {
        params ["_curator", "_entity"];

        if (_entity isKindOf "Man") then {
           [_entity] call HS_spawner_fnc_equipWithGasMask;
        };

        if (_entity isKindOf "LandVehicle") then {
            {
                [_x] call HS_spawner_fnc_equipWithGasMask;
            } forEach crew _entity;
        };
    }];
} forEach  allCurators;


/*
_dialogValues params ["_speed", "_args"];

           
            
            ["GRAD_sandstorm_parametersEdited", [_args, _speed ]] call CBA_fnc_globalEvent;


systemChat str _args;
            private _position = _args;
            _values params ["_speed"];
            ["HS_SpawnerRandomCivilian", [_position, _speed]] call CBA_fnc_globalEvent;




["HS_Spawner", "Spawn Random Civilian TEST", {

    private _args = _this;
    systemChat str _this;


}] call zen_custom_modules_fnc_register;

*/