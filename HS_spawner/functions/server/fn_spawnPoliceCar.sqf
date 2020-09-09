params ["_vehicle"];

_vehicle animate ["BeaconsStart",1];
_vehicle animate ["HidePolice", 0];
_vehicle animate ["HideServices", 1];
_vehicle animate ["HideBackpacks", 1];
_vehicle animate ["HideBumper1", 1];
_vehicle animate ["HideBumper2", 0];
_vehicle animate ["HideConstruction", 0];

_vehicle disableAI "LIGHTS";  // override AI
_vehicle setPilotLight true;  // force switch headlights off



{
   _x addGoggles "Mask_M50";
} forEach crew _vehicle;