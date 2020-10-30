//

[{
    params ["_args", "_handle"];

    private _inArea = player inArea trg_bunkerArea;
    private _maxHeight = 50;
    private _minHeight = 1.5;

    if (_inArea) then {
        getPos player params ["", "", "_zPos"];

        private _multiplicatorSending = linearConversion [_maxHeight, _minHeight, _zPos, 1, 1/90, true];
        private _multiplicatorReceiving = linearConversion [_maxHeight, _minHeight, _zPos, 1, 90, true];

        player setVariable ["tf_sendingDistanceMultiplicator", _multiplicatorSending];
        player setVariable ["tf_receivingDistanceMultiplicator", _multiplicatorReceiving];
    } else {
        player setVariable ["tf_sendingDistanceMultiplicator", 1];
        player setVariable ["tf_receivingDistanceMultiplicator", 1];
    };
    
}, 2, []] call CBA_fnc_addPerFrameHandler;
