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