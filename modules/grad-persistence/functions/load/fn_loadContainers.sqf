if (!isServer) exitWith {};

_missionTag = [] call grad_persistence_fnc_getMissionTag;
_containersTag = _missionTag + "_containers";
_containersData = [_containersTag] call grad_persistence_fnc_getSaveData;

{

    _thisContainerHash = _x;
    _type = [_thisContainerHash,"type"] call CBA_fnc_hashGet;
    _side = [_thisContainerHash,"side"] call CBA_fnc_hashGet;

    _thisContainer = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];

    [{!isNull (_this select 0)}, {
        params ["_thisContainer","_thisContainerHash"];

        _posASL = [_thisContainerHash,"posASL"] call CBA_fnc_hashGet;
        _vectorDirAndUp = [_thisContainerHash,"vectorDirAndUp"] call CBA_fnc_hashGet;
        _damage = [_thisContainerHash,"damage"] call CBA_fnc_hashGet;
        _inventory = [_thisContainerHash,"inventory"] call CBA_fnc_hashGet;
        _isGradFort = [_thisContainerHash,"isGradFort"] call CBA_fnc_hashGet;

        _thisContainer setVectorDirAndUp _vectorDirAndUp;
        _thisContainer setPosASL _posASL;
        _thisContainer setDamage _damage;

        [_thisContainer,_inventory] call grad_persistence_fnc_loadVehicleInventory;

        if (_isGradFort && {isClass (missionConfigFile >> "CfgFunctions" >> "GRAD_fortifications")}) then {
            [_thisContainer,objNull] remoteExec ["grad_fortifications_fnc_initFort",0,true];
        };

    }, [_thisContainer,_thisContainerHash]] call CBA_fnc_waitUntilAndExecute;

    false
} count _containersData;
