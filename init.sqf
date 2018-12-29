//player addAction ["Kill Civilian", "scripts\cleanup.sqf", [civilian, 200]];




_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};

[] spawn _EndSplashScreen;


execVM "ACL\ACL_initialization.sqf";


//-------------------------------------Data cible----------------------------------------
_actionDataCible = ["DataCible","Data Cible","",{
	
	_ok = createDialog "TER_target";

    if (!_ok) then {hint "Dialog couldn't be opened!"};
	
},{true}] call ace_interact_menu_fnc_createAction;

//Ajout de l'action sur le joueur
["Land_TripodScreen_01_dual_v2_F", 0, ["ACE_MainActions"], _actionDataCible] call ace_interact_menu_fnc_addActionToClass;



//-----------------------------END Data cible----------------------------------------














