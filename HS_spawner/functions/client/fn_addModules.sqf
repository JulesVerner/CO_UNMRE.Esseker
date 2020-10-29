ryanzombiesglow = 1;
ryanzombiesstartinganim = 1;

Ryanzombiescanthrowdemon = 1;

Ryanzombiescanthrow = 1;
Ryanzombiescanthrowdistance = 20;

Ryanzombiescanthrowtankdistance = 1;

Ryanzombiescanthrowdistancedemon = 150;
Ryanzombiescanthrowtank = 1;

Ryanzombiesfeed = 1;
ryanzombiescivilianattacks = true;
Ryanzombieslogicroam = 1;


Ryanzombiesattackspeed = 0.3;
Ryanzombiesattackdistance = 2.35;
Ryanzombiesattackstrenth = 1.5;
Ryanzombiesdamage = 0.15;
Ryanzombiesdamagecar = 0.01;
Ryanzombiesdamageair = 0.01;
Ryanzombiesdamagetank = 0.002;
Ryanzombiesdamagecarstrenth = 1.5;
Ryanzombiesdamageairstrenth = 1;
Ryanzombiesdamagetankstrenth = 0.4;

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

["HS_Spawner", "Single Doc", {

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
            ["HS_SpawnerSpecificCivilian", [_position, _speed, "GRAD_CivilianZed_rds_doctor"]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["HS_Spawner", "Pumpkin Joe Zombie", {

    params ["_position", "_object"];

        [position zombie_bloodpool] call HS_spawner_fnc_spawnLightHouseFeed;

        hintsilent "zombie joe spawned";

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