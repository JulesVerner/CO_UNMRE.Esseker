params ["_unit"];

_googles = [
    "NWTS_goggle_deer",
    "NWTS_goggle_deer_bloody",
    "NWTS_goggle_deer_glow",
    "NWTS_goggle_deer_mossy"
];

_headgear = [
    "",
    "",
    "",
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