

private ["_debug", "_unit"];

_debug = false;
_unit = _this select 0;

///////////////////////////////
// DÉFINITION DES VARIABLES //
/////////////////////////////

	// DÉFINITION DES ÉQUIPEMENTS
	OPEX_civilian_uniforms = ["U_C_Poor_1","SWOP_RebF_FRI_CombatUniform", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla_6_1", "U_BG_Guerilla3_1", "U_I_C_Soldier_Bandit_3_F"]; // liste de tous les uniformes permettant de passer incognito
	OPEX_civilian_headgears = ["H_Cap_tan", "H_Cap_blk", "H_Cap_oli", "H_Cap_grn", "H_Cap_red", "H_Cap_blu", "H_Cap_surfer", "H_Hat_grey", "H_Hat_tan", "H_Hat_brown"]; // liste de tous les chapeaux permettant de passer incognito
	OPEX_friendly_vehicles = ["B_APC_Wheeled_01_cannon_F", "B_Heli_Transport_01_F", "B_MBT_01_cannon_F"]; // liste de tous les véhicules alliés

	// DÉFINITION DU CAMP ENNEMI
	OPEX_enemy_side1 = east;

/////////////////////////////
/////////////////////////////
/////////////////////////////




while {alive _unit} do

	{
		sleep 3;
		if
			(
				(
					(primaryWeapon _unit == "")
					&&
					(secondaryWeapon _unit == "")
					&&
					(currentWeapon _unit == "")
					&&
					(backpack _unit == "")
					&&
					((uniform _unit) in OPEX_civilian_uniforms)
					&&
					((headgear _unit == "") || ((headgear _unit) in OPEX_civilian_headgears))
					&&
					(hmd _unit == "")
					&&
					(speed _unit < 10)
					&&
					(stance _unit != "CROUCH")
					&&
					(stance _unit != "PRONE")
					&&
					(!((typeOf vehicle _unit) in OPEX_friendly_vehicles))
					&&
					(!((vehicle player) isKindOf "air"))
					&&
					({(side _x == OPEX_enemy_side1) && (_unit distance _x < 15)} count (allUnits - allPlayers) == 0)
					&&
					(count (attachedObjects _unit) == 0)
					&&
					(OPEX_enemy_side1 knowsAbout _unit < 3.9)
				) 
			||
				(
					(vehicle _unit != _unit)
					&&
					(!((typeOf vehicle _unit) in OPEX_friendly_vehicles))
					&&
					({(side _x == OPEX_enemy_side1) && (_unit distance _x < 15)} count (allUnits - allPlayers) == 0)
					&&
					(OPEX_enemy_side1 knowsAbout _unit < 3.9)
				)   
			)
		then 
			{_unit setCaptive true; if (_debug) then {hint "INCOGNITO !!!"}} else {_unit setCaptive false; if (_debug) then {hint "NOT INCOGNITO !!!"}};

};

hint "fini";

	



	/*/////////////add create///////////////////

	// CIVILIAN CLOTHES
			if (typeOf _crate == "Box_CSAT_Uniforms_F") then
				{
					_index = 0; for "_i" from 1 to (count OPEX_civilian_uniforms) do {_crate addItemCargoGlobal [(OPEX_civilian_uniforms select _index), 1]; _index = _index + 1};
					_index = 0; for "_i" from 1 to (count OPEX_civilian_headgears) do {_crate addItemCargoGlobal [(OPEX_civilian_headgears select _index), 1]; _index = _index + 1};

					// TEMPORARY ! ADDING ACTION TO AUTO ASSIGN CIVILIAN CLOTHES TO THE PLAYER (because ArmA doesn't allow military units to get other faction clothes manually through the inventory)
					[
						_crate, // object which action is attached
						"Se déguiser en civil", // action name
						{
							private ["_crate", "_unit", "_items", "_uniform", "_vest", "_headgear"];
							_crate = _this select 0;
							_unit = _this select 1;
							_items = (vestItems _unit) + (uniformItems _unit);
							_uniform = uniform _unit;
							_vest = vest _unit;
							_headgear = headgear _unit;
							{_crate addItemCargoGlobal [_x, 1]} forEach _items;
							if (!(_uniform in OPEX_civilian_uniforms)) then {_crate addItemCargoGlobal [_uniform, 1]};
							_crate addItemCargoGlobal [_vest, 1];
							if (!(_uniform in OPEX_civilian_headgears)) then {_crate addItemCargoGlobal [_headgear, 1]};
							removeUniform _unit;
							removeVest _unit;
							removeHeadgear _unit;
							_unit forceAddUniform (selectRandom OPEX_civilian_uniforms);
							_unit addHeadgear (selectRandom OPEX_civilian_headgears);
							hintC localize "Vous êtes incognito !";
						}, // script to call
						nil, // additionnal arguments
						6
					] //remoteExec ["Gemini_fnc_addAction", 0, _crate];
				};*/