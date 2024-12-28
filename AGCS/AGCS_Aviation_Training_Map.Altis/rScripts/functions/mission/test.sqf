_MarkerArray = [
	// ["RW_ARE_IFR","ARE Task 3: IFR Flight"]
	,["RW_ARE_PIN","ARE Task 4: Pinnicle Extract"]
	//,["RW_ARE_KAV","ARE Task 9: Kavala"]
	//,["RW_ARE_GA","ARE Task 5-7: Flight Planning, Escort, and Ground Attack"]
	//,["RW_ARE_A2A","ARE Task 10: Air to Air"]
	,["FW_AFWE_A2A","AFWE Task 5: Air to Air"]
	//,["RW_BRE_DOR","BRE Task 10: Dorida"]
	,["RW_BRE_AR","BRE Task: Auto Rotation"]
	,["RW_BRE_TRF","BRE Task: Tail Rotor Failure"]
	,["OTHER_RR","Rocket Range"]
];

{
	_markerName=_x select 0;
	_Title=_x select 1;
     _starttitle=format ["Toggle %1 Markers",_Title];
    _startaction=format ["[""%1""] call rScripts_fnc_toggle_marker;",_markerName];
   
    
    master_marker addAction [_Title,_startaction];

} forEach _MarkerArray;

this addAction ["ARE Task 9: Kavala",    
       {     
       _vehicle ="RHS_MELB_H6M" createVehicle (getpos KAVALA_SPAWN);  
    _vehicle setDir 300; 
       }    
      ]; 

	  this addAction ["Toggle ARE Task 9: Kavala Markers",    
       {     
       ["RW_ARE_KAV"] call rScripts_fnc_toggle_marker;
       }    
      ]; 