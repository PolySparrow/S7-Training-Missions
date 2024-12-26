/*
 * Author: SGT.Brostrom.A
 * This function applies abilities to a player based on unit loadout or classname
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Config <CONFIG>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, (missionConfigFile >> "CfgLoadouts" >> "Cav_B_B_Atlas_Medic_TeamLeader_F")] call cScripts_fnc_gear_applyAbilities
 *
 */
 viper_table addAction ["Launch SU-57",
 {
	params ["_target", "_caller", "_actionId", "_arguments"];
	["RHS_T50_vvs_blueonblue",getMarkerPos "viper_spawn",_caller,600,270] call FTXScripts_fnc_spawn_viper;
 }];

  viper_table addAction ["Launch SU-57 KAB250",
 {
	params ["_target", "_caller", "_actionId", "_arguments"];
	["RHS_T50_vvs_blueonblue",getMarkerPos "viper_spawn",_caller,600,270,["rhs_mag_kab250_int","rhs_mag_kab250_int","rhs_mag_kab250_int","rhs_mag_kab250_int","",""]] call FTXScripts_fnc_spawn_viper;
 }];

//["rhs_mag_kab250_int","rhs_mag_kab250_int","rhs_mag_kab250_int","rhs_mag_kab250_int","",""]