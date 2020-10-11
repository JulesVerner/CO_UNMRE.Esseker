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