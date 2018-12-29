//soldat de base 
// Land_WoodPile_F
// Land_Trench_01_grass_F
// Land_Bunker_01_blocks_1_F
// Land_FirePlace_F
// ShootingMat_01_Olive_F
// ACE_ConcertinaWireCoil
// Land_Target_Dueling_01_F
// Land_Camping_Light_F
// TargetPopup_ACR

//gradé

// CamoNet_BLUFOR_F
// Land_TripodScreen_01_large_F
// Land_OPTRE_ConstructionBarrier1
// Land_OPTRE_M72_barrierBlk
// Downy_Barricade
// SWOP_Barricade
// Land_OPTRE_blast_barrier_dest

//mass effect

// Land_MEOP_build_Colony_wallOp
// Land_MEOP_build_Turian_Barrier
// Land_MEOP_build_Colony_ParDoor
// Land_MEOP_build_Turian_WallGateUpright
// Land_MEOP_build_Turian_WallGate

//if ([player] call grad_lbm_fnc_getPermissionLevel < 3 ) then  
//{ 

//[player,"CamoNet_BLUFOR_F"] call grad_fortifications_fnc_addFort;
//[player,"Land_Campfire_F"] call grad_fortifications_fnc_addFort;


//};  

#include "TER_targetGUI\addEH.sqf"

if ([player] call grad_lbm_fnc_getPermissionLevel < 3 ) then 

 
{ 

[player,"Land_WoodPile_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Trench_01_grass_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Bunker_01_blocks_1_F"] call grad_fortifications_fnc_addFort;
[player,"Land_FirePlace_F"] call grad_fortifications_fnc_addFort;
[player,"ShootingMat_01_Olive_F"] call grad_fortifications_fnc_addFort;
[player,"ACE_ConcertinaWireCoil"] call grad_fortifications_fnc_addFort;
[player,"Land_Target_Dueling_01_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Camping_Light_F"] call grad_fortifications_fnc_addFort;
[player,"TargetPopup_ACR"] call grad_fortifications_fnc_addFort;

}


else 


{
[player,"Land_WoodPile_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Trench_01_grass_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Bunker_01_blocks_1_F"] call grad_fortifications_fnc_addFort;
[player,"Land_FirePlace_F"] call grad_fortifications_fnc_addFort;
[player,"ShootingMat_01_Olive_F"] call grad_fortifications_fnc_addFort;
[player,"ACE_ConcertinaWireCoil"] call grad_fortifications_fnc_addFort;
[player,"Land_Target_Dueling_01_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Camping_Light_F"] call grad_fortifications_fnc_addFort;
[player,"TargetPopup_ACR"] call grad_fortifications_fnc_addFort;

[player,"CamoNet_BLUFOR_F"] call grad_fortifications_fnc_addFort;
[player,"Land_TripodScreen_01_large_F"] call grad_fortifications_fnc_addFort;
[player,"Land_OPTRE_ConstructionBarrier1"] call grad_fortifications_fnc_addFort;
[player,"Land_OPTRE_M72_barrierBlk"] call grad_fortifications_fnc_addFort;
[player,"Downy_Barricade"] call grad_fortifications_fnc_addFort;
[player,"SWOP_Barricade"] call grad_fortifications_fnc_addFort;
[player,"Land_OPTRE_blast_barrier_dest"] call grad_fortifications_fnc_addFort;

};  












