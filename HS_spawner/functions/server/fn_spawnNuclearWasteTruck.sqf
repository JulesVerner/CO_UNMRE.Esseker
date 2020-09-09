params ["_pos"];

if (!isServer) exitWith {
    [_pos] remoteExec ["HS_spawner_fnc_spawnNuclearWasteTruck", 2];
};

private _data = [
    "rhs_kamaz5350_flatbed_msv",
        [
            ["gm_barrel",[-0.623047,1.01489,-0.529602]],
            ["gm_barrel",[0.0644531,1.01221,-0.525726]],
            ["gm_barrel",[0.788574,1.0271,-0.544128]],
            ["gm_barrel",[0.682617,0.310059,-0.540131]],
            ["gm_barrel",[-0.0410156,0.294922,-0.529327]],
            ["gm_barrel",[-0.729004,0.297852,-0.525818]],
            ["gm_barrel",[0.756348,-1.11963,-0.588226]],
            ["gm_barrel",[0.0322266,-1.13428,-0.576538]],
            ["gm_barrel",[-0.655273,-1.13159,-0.572723]],
            ["gm_barrel",[-0.549316,-0.414307,-0.576477]],
            ["gm_barrel",[0.138672,-0.417236,-0.573151]],
            ["gm_barrel",[0.862305,-0.4021,-0.592209]],
            ["gm_barrel",[0.25,-1.88599,-0.574615]],
            ["gm_barrel",[0.929688,-1.84082,-0.593384]],
            ["gm_barrel",[-0.587891,-2.57007,-0.572723]],
            ["gm_barrel",[-0.481934,-1.85278,-0.576477]],
            ["gm_barrel",[0.14502,-2.65308,-0.574417]],
            ["gm_barrel",[0.887695,-2.70874,-0.578796]]
        ]
];

_data params ["_classname", "_objectsAndOffsets"];

private _vehicle = _classname createVehicle _pos;

{
  _x params ["_classnameItem", "_offset"];

  private _item = _classnameItem createVehicle [0,0,0];
  _item attachTo [_vehicle, _offset];
  _item setObjectTextureGlobal [0, "pic\barrel.paa"];
} forEach _objectsAndOffsets;

[_vehicle, 3.9, 100, 300] call cbrn_fnc_createZone;