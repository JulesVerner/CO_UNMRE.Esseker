titleText ["","BLACK FADED",999];
0 fadeSound 0;

[{
    missionNamespace getVariable ["UNMRE_introDone", false]
},{
    titleText ["", "BLACK IN", 15];
    5 fadeSound 1;
}, []] call CBA_fnc_waitUntilAndExecute;
