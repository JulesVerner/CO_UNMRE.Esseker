params ["_unit"];

_googles = [
    "Mask_M40",
    ""
];

_headgear = [
    "H_HelmetB_plain_wdl",
    ""
];

_vests = [
    "V_CarrierRigKBT_01_heavy_Olive_F"
];

_backpacks = [
    "B_CombinationUnitRespirator_01_F",
    ""
];

_unit addHeadgear selectRandom _headgear;
_unit addVest selectRandom _vests;
_unit addBackpack selectRandom _backpacks;
_unit addGoggles selectRandom _googles;