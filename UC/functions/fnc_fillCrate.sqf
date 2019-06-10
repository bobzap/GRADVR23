
// =========================================================================================================
// PRIVATIZING LOCAL VARIABLES
// =========================================================================================================

	private ["_crate", "_index"];

// =========================================================================================================
// GETTING ARGUMENT(S)
// =========================================================================================================

	sleep 3;
	_crate = _this;
	_crate allowDamage false;

// =========================================================================================================
// FILLING CRATE
// =========================================================================================================

	if (isServer) then
		{
			// CLEARING BOX
			clearWeaponCargoGlobal _crate; clearMagazineCargoGlobal _crate; clearItemCargoGlobal _crate; clearBackpackCargoGlobal _crate;

	/////////////add create///////////////////

	OPEX_civilian_uniforms = ["U_C_Poor_1", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla2_2", "U_BG_Guerilla3_1", "U_I_C_Soldier_Bandit_3_F"]; // liste de tous les uniformes permettant de passer incognito
	OPEX_civilian_headgears = ["H_Cap_tan", "H_Cap_blk", "H_Cap_oli", "H_Cap_grn", "H_Cap_red", "H_Cap_blu", "H_Cap_surfer", "H_Hat_grey", "H_Hat_tan", "H_Hat_brown"]; // liste de tous les chapeaux permettant de passer incognito
	OPEX_friendly_vehicles = ["B_APC_Wheeled_01_cannon_F", "B_Heli_Transport_01_F", "B_MBT_01_cannon_F"]; // liste de tous les véhicules alliés



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
					] remoteExec ["Gemini_fnc_addAction", 0, _crate];
				};
		};