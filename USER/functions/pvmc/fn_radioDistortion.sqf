//


private _handle = [{
    params ["_args", "_handle"];

    private _inArea = player inArea trg_bunkerArea;
    private _maxHeight = 50;
    private _minHeight = 1.5;

    if (_inArea) then {
        getPosATL player params ["", "", "_zPos"];

        private _maxValue = missionNamespace getVariable ["distortionMax", 90];

        private _multiplicatorSending = linearConversion [_maxHeight, _minHeight, _zPos, 1, 1/_maxValue, true];
        private _multiplicatorReceiving = linearConversion [_maxHeight, _minHeight, _zPos, 1, _maxValue, true];

        player setVariable ["tf_sendingDistanceMultiplicator", _multiplicatorSending];
        player setVariable ["tf_receivingDistanceMultiplicator", _multiplicatorReceiving];
    } else {
        player setVariable ["tf_sendingDistanceMultiplicator", 1];
        player setVariable ["tf_receivingDistanceMultiplicator", 1];
    };
    
}, 2, []] call CBA_fnc_addPerFrameHandler;

missionNamespace setVariable ["radioDistortionHandler", _handle];