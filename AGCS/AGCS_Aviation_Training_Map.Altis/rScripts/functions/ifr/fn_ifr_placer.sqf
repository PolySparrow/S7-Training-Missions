#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles when you select an option from the table how it behaves
 *
 * Arguments:
 * 0: thisTrigger
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_slinglz_placer
 *
 * Public: No
 *
 */

IFR_SELECTOR addAction ["ARE Task 3: IFR Start",  {call rScripts_fnc_ifr_start;}];  
//IFR_SELECTOR addAction ["STOP ARE Task 3: IFR STOP",{call rScripts_fnc_ifr_end;}]; 
[IFR_SELECTOR,"STOP ARE Task 3: IFR STOP", IFR_FINISH] call cScripts_fnc_teleport; 
_MarkerArray = [
	 ["RW_ARE_IFR","ARE Task 3: IFR Flight"]
];

{
	_markerName=_x select 0;
	_Title=_x select 1;
     _starttitle=format ["Toggle %1 Markers",_Title];
    _startaction=format ["[""%1""] call rScripts_fnc_toggle_marker;",_markerName];
   
    
    IFR_SELECTOR addAction [_Title,_startaction];

} forEach _MarkerArray;