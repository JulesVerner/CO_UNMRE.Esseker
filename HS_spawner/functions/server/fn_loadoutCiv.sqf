params ["_unit"];

_googles = [
    ""
];

_headgear = [
    "NWTS_deer",
    "NWTS_deer_bloody",
    "NWTS_deer_glow",
    "NWTS_deer_mossy",
    "Axe_In_Head"
];

_vests = [
    ""
];

_backpacks = [
    ""
];

_unit addHeadgear selectRandom _headgear;
_unit addVest selectRandom _vests;
_unit addBackpack selectRandom _backpacks;
_unit addGoggles selectRandom _googles;