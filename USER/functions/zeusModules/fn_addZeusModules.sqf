[
	"GRAD mission intro fixes",
	"Fix Boat 1", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 

	private _boat = missionNamespace getVariable ["introBoat_1", objNull];
	private _heli = missionNamespace getVariable ["introHeli_1", objNull];
	
	[_heli, _boat] remoteExecCall ["setSlingLoad", 2];

	hintSilent "intro boat 1 fixed";
	}
] call zen_custom_modules_fnc_register;

[
	"GRAD mission intro fixes",
	"Fix Boat 2", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 

	private _boat = missionNamespace getVariable ["introBoat_2", objNull];
	private _heli = missionNamespace getVariable ["introHeli_2", objNull];
	
	[_heli, _boat] remoteExecCall ["setSlingLoad", 2];

	hintSilent "intro boat 2 fixed";
	}
] call zen_custom_modules_fnc_register;

[
	"GRAD mission intro fixes",
	"Fix Boat 3", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 

	private _boat = missionNamespace getVariable ["introBoat_3", objNull];
	private _heli = missionNamespace getVariable ["introHeli_3", objNull];

    [_heli, _boat] remoteExecCall ["setSlingLoad", 2];

	hintSilent "intro boat 3 fixed";
	}
] call zen_custom_modules_fnc_register;

[
	"GRAD mission intro fixes",
	"Fix Boat 4", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 

	private _boat = missionNamespace getVariable ["introBoat_4", objNull];
	private _heli = missionNamespace getVariable ["introHeli_4", objNull];
	
	[_heli, _boat] remoteExecCall ["setSlingLoad", 2];

	hintSilent "intro boat 4 fixed";
	}
] call zen_custom_modules_fnc_register;

[
	"GRAD mission events",
	"PVMC Ghost Hawk Crash", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	
	[] remoteExec ["grad_user_fnc_specOpsInsertion", 2, false];
	hintSilent "spec ops insertion started";
	}
] call zen_custom_modules_fnc_register;



[
	"GRAD mission events",
	"PVMC Raise Water", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	
	[] remoteExec ["grad_user_fnc_waterStart", 2, false];
	hintSilent "water rising started";
	}
] call zen_custom_modules_fnc_register;

["GRAD mission events", "Adjust Water Speed", {

    params ["_position", "_object"];

        ["Adjust Water Speed", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    0.0001, 0.0005,0.001,0.002,0.005
                ], [
                    ["0.0001", "0.0001"],
                    ["0.0005", "0.0005"],
                    ["0.001", "0.001"],
                    ["0.002", "0.002"],
                    ["0.005", "0.005"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            hintsilent ("new speed is : " + str _speed);

            missionNamespace setVariable ["PVMC_waterLevelDelta", _speed, true];
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


[
	"GRAD mission events",
	"Call Exfil Blackfish to Land", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	
	[] remoteExec ["grad_user_fnc_startExfil", 2, false];
	hintSilent "Exfil started";
	}
] call zen_custom_modules_fnc_register;

[
	"GRAD mission events",
	"End Mission Outro (Blackfish Start from Airfield)", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	
	[] remoteExec ["grad_outro_fnc_serverOutro", 2, false];
	hintSilent "Outro started";
	}
] call zen_custom_modules_fnc_register;


[
	"GRAD local effects",
	"Rushing Skeleton", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	if !(isPlayer _attachedObject) exitWith { hint "Has to be placed on a player!"};
	[[], grad_user_fnc_skeletonRushing] remoteExec ["spawn", _attachedObject, false];
	}
] call zen_custom_modules_fnc_register;



[
	"GRAD local effects",
	"Floating Head", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	if !(isPlayer _attachedObject) exitWith { hint "Has to be placed on a player!"};
	[[], grad_user_fnc_floatingHead] remoteExec ["spawn", _attachedObject, false];
	}
] call zen_custom_modules_fnc_register;



[
	"GRAD local effects",
	"Head Fountain", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	if !(isPlayer _attachedObject) exitWith { hint "Has to be placed on a player!"};
	[[], grad_user_fnc_headFountain] remoteExec ["spawn", _attachedObject, false];
	}
] call zen_custom_modules_fnc_register;



[
	"GRAD local effects",
	"Skin Units", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	if !(isPlayer _attachedObject) exitWith { hint "Has to be placed on a player!"};
	[[], grad_user_fnc_skinUnits] remoteExec ["spawn", _attachedObject, false];
	}
] call zen_custom_modules_fnc_register;



[
	"GRAD local effects",
	"Twitching", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	if !(isPlayer _attachedObject) exitWith { hint "Has to be placed on a player!"};
	[[], grad_user_fnc_twitching] remoteExec ["spawn", _attachedObject, false];
	}
] call zen_custom_modules_fnc_register;

[
	"GRAD local effects",
	"Hellfire", 
	{ 
	params ["_modulePosition", "_attachedObject"]; 
	if !(isPlayer _attachedObject) exitWith { hint "Has to be placed on a player!"};
	[[_attachedObject], grad_user_fnc_hellfire] remoteExec ["spawn", _attachedObject, false];
	}
] call zen_custom_modules_fnc_register;



["GRAD local effects", "Monitor Effects", {

	["Monitor local effects",
	[ 
		[
			"CHECKBOX",
			["Switch monitoring", "Monitors effects if checked"],
			[player getVariable ["GRAD_UNMRE_monitoringActive", false]],
			true
		]
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_monitoring"];

		if (_monitoring isEqualTo (player getVariable ["GRAD_UNMRE_monitoringActive", false])) exitWith {};
		player setVariable ["GRAD_UNMRE_monitoringActive", _monitoring];
		[[_monitoring], grad_zeus_fnc_monitorEffects] remoteExec ["spawn", player, false];
	}, {}, []] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;