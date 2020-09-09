params ["_position", "_side"];

private _type = "rhs_tigr_vdv";

_position set [2,0];

switch (_side) do { 
    case west : {  _type = "B_GEN_Offroad_01_comms_F"; }; 
    case east : {  _type = "rhs_tigr_vdv"; }; 
    default {}; 
};



for "_i" from 0 to (1 max (random 4)) do {
     private _offroad = createVehicle [_type, _position, [], 10, "NONE"];
     _offroad setDir (Random 360);
     createVehicleCrew _offroad;
     _offroad setPilotLight true;
     _offroad animate ["BeaconsStart", 1];
     _offroad animate ["Beacons", 1];
     _offroad animate ["StartBeaconLight", 1];
     _offroad setVehicleLock "LOCKED";

     private _item = createVehicle [selectRandom ["RoadBarrier_long", "RoadBarrier_light", "Land_Razorwire_F"], _position, [], 10, "NONE"];
    {
        _x addCuratorEditableObjects [[_offroad, _item],true];
        nil
    } count allCurators;

    {
        [_x] call HS_spawner_fnc_equipWithGasMask;
         moveOut _x;
         unassignVehicle _x;
    } forEach crew _offroad;
};