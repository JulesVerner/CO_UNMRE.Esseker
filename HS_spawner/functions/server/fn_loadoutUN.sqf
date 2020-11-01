params ["_unit"];

_googles = [
    ""
];

_headgear = [
    "rhsgref_un_beret",
    "rhssaf_helmet_m97_nostrap_blue",
    "rhssaf_helmet_m97_nostrap_blue_tan_ess",
    "rhssaf_helmet_m97_nostrap_blue_tan_ess_bare",
    "rhsgref_helmet_pasgt_un",
    "rhsgref_ssh68_un"
];

_vests = [
    "rhs_6b13_Flora",
    "rhs_6b13_Flora_6sh92",
    "rhs_6b13_Flora_6sh92_headset_mapcase",
    "rhs_6b13_Flora_6sh92_radio",
    "rhs_6b13_Flora_6sh92_vog",
    "rhs_6b13_Flora_crewofficer",
    "rhs_6sh46"
];

_backpacks = [
    "rhs_sidor",
    "B_Carryall_oli",
    "rhs_assault_umbts",
    "rhs_assault_umbts_demo",
    "rhs_rpg_empty",
    "RHS_M2_Tripod_Bag",
    "",
    "",
    "",
    "",
    ""
];

_unit addHeadgear selectRandom _headgear;
_unit addVest selectRandom _vests;
_unit addBackpack selectRandom _backpacks;
_unit addGoggles selectRandom _googles;