params ["_trigger"];

_position = getPos _trigger;


TREE_RISING_ACTIVATION_RADIUS = triggerArea _trigger select 0;

private _levitateTreeSpeed = 0.1;

ALL_TREES = [];
HIDDEN_TREES = [];
DEBUG_SLEEP = 3;
private _vegetation = nearestTerrainObjects [_position, ["TREE", "SMALL TREE", "BUSH"], TREE_RISING_ACTIVATION_RADIUS];

[_vegetation, _levitateTreeSpeed] spawn {
    params ["_vegetation", "_levitateTreeSpeed"];
    {
      private _scrub = _x;
      private _modelInfo = getModelInfo _scrub;
      _modelInfo params ["", "_model", ""];

      // hint (str (_simpleObjectInfo select 3));

      /*
      private _position = getPosASL _scrub;
      _position params ["_posX", "_posY", "_posZ"];
      _position set [2,_posZ+((_maxHeight)/2)];
      private _dir = getDir _scrub;
      private _vectorUp = vectorUp _scrub;

      _scrub hideObject true;
      HIDDEN_TREES pushBackUnique _scrub;
      
      private _replacement = createSimpleObject [_model, _position, true];
      _replacement setPosASL _position;
      _replacement setDir _dir;
      // _replacement setVectorUp _vectorUp;
      */

      //scan simulated object
        private _data = [_scrub] call BIS_fnc_simpleObjectData;

        //get world position, dir and vector up
        //private _pos = getPosASL _template; _pos set [2, (_pos select 2) - (_data select 3)];
        private _pos = getPosWorld _scrub;
        private _dir = getDir _scrub;
        private _vectorUp = vectorUp _scrub;

        _scrub hideObject true;
        HIDDEN_TREES pushBackUnique _scrub;

        //create simple object
        private _replacement = [_data,_pos,_dir,false,true] call BIS_fnc_createSimpleObject;

        //set position (to negate built-in auto-adjusting)
        _replacement setPosWorld _pos;

        //set vector up
        _replacement setVectorUp _vectorUp;

      _replacement setVariable ["levitateSpeed", _levitateTreeSpeed];
      _replacement setVariable ["originalPosition", _pos];
      _replacement setVariable ["rotationSpeed", random 0.2];

      ALL_TREES pushBackUnique _replacement;

      sleep random DEBUG_SLEEP;

      /*
      [{
            params ["_scrub", "_replacement"];

            _scrub hideObject false;
            deleteVehicle _replacement;
      }, [_scrub, _replacement], 5] call CBA_fnc_waitAndExecute;
      */
    } forEach _vegetation;
};


private _handle = [{
    params ["_args", "_handle"];

    {   
        private _originalPosition = _x getVariable ["originalPosition", [0,0,0]];
        private _speed = _x getVariable ["levitateSpeed", 0];
        private _rotationSpeed = _x getVariable ["rotationSpeed", 0];
        _originalPosition params ["_posX", "_posY", "_posZ"];       
        private _newPosition = [_posX, _posY, _posZ + _speed];

        _x setVariable ["originalPosition", _newPosition];
        _x setPosWorld _newPosition;
        _x setDir (getDir _x + _rotationSpeed);        
        // [_x, 0, 0] call BIS_fnc_setPitchBank;

    } forEach ALL_TREES;
    
}, 0, []] call CBA_fnc_addPerFrameHandler;

[{  
    params ["_handle"];

    [_handle] call CBA_fnc_removePerFrameHandler;
    {
        deleteVehicle _x;
        ALL_TREES deleteAt (ALL_TREES find _x);
    } forEach ALL_TREES;

    hint "safe to retry";

    {
        _x hideObject false;
    } forEach HIDDEN_TREES;
    
}, [_handle], DEBUG_DURATION] call CBA_fnc_waitAndExecute;