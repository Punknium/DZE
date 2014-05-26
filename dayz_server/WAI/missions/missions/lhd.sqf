//Construction Supply

private ["_c","_width","_objPosition3","_objPosition2","_vehclass3","_vehclass2","_veh3","_veh2","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

//define vehicles
_boxclass = "USVehicleBox";

_lhdclass1 = "Land_LHD_1";
_lhdclass2 = "Land_LHD_2";
_lhdclass3 = "Land_LHD_3";
_lhdclass4 = "Land_LHD_4";
_lhdclass5 = "Land_LHD_5";
_lhdclass6 = "Land_LHD_6";
_lhdclass7 = "Land_LHD_house_1";
_lhdclass8 = "Land_LHD_house_2";
_lhdclass9 = "Land_LHD_elev_R";

_position = [getMarkerPos "center",0,7000,10,2,2000,0] call BIS_fnc_findSafePos;
diag_log format["WAI: LHD Started At %1",_position];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//LHD
_lhd1 = createVehicle [_lhdclass1,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir1 = 0;
_lhd1 setDir _lhddir1;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass1];

_lhd2 = createVehicle [_lhdclass2,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir2 = 0;
_lhd2 setDir _lhddir2;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass2];

_lhd3 = createVehicle [_lhdclass3,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir3 = 0;
_lhd3 setDir _lhddir3;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass3];

_lhd4 = createVehicle [_lhdclass4,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir4 = 0;
_lhd4 setDir _lhddir4;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass4];

_lhd5 = createVehicle [_lhdclass5,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir5 = 0;
_lhd5 setDir _lhddir5;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass5];

_lhd6 = createVehicle [_lhdclass6,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir6 = 0;
_lhd6 setDir _lhddir6;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass6];

_lhd7 = createVehicle [_lhdclass7,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir7 = 0;
_lhd7 setDir _lhddir7;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass7];

_lhd8 = createVehicle [_lhdclass8,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir8 = 0;
_lhd8 setDir _lhddir8;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass8];

_lhd9 = createVehicle [_lhdclass9,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_lhddir9 = 0;
_lhd9 setDir _lhddir9;
diag_log format["WAI: Mission LHD spawned a %1",_lhdclass9];

//box1
_box = createVehicle [_boxclass,[(_position select 0),(_position select 1),10], [], 0, "CAN_COLLIDE"];
_boxdir = 0;
_box setDir _boxdir;
_box setPosASL [(_position select 0),(_position select 1) - 5,9];
diag_log format["WAI: Mission LHD spawned a %1",_boxclass];
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//_veh = createVehicle [_vehclass,[(_position select 0) - 8,(_position select 1) - 32,0], [], 0, "CAN_COLLIDE"];
//_vehdir = 90;
//_veh setDir _vehdir;
//_veh setVariable ["ObjectID","1",true];
//PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
//diag_log format["WAI: Mission LHD spawned a %1",_vehclass];

//_objPosition = getPosATL _veh;

/////////////////////////////////////////////////////////////////////////////////////////////////////////
[_box] call Extra_Large_Gun_Box;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//spawn stuff
/*[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
///////////////////////////////////////////////////////////////////////////////////////////////////
//Spawn 50cals
[[[(_position select 0) - (_width - 5), (_position select 1) - (_width - 5), 0]], //position(s) (can be multiple).
"M2StaticMG",             //Classname of turret
0.7,					  //Skill level 0-1. Has no effect if using custom skills
"Ins_Soldier_Pilot",				          //Skin "" for random or classname here.
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random",				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
true						// mission true
] call spawn_static;
[[[(_position select 0) + (_width - 5), (_position select 1) + (_width - 5), 0]], //position(s) (can be multiple).
"M2StaticMG",             //Classname of turret
0.7,					  //Skill level 0-1. Has no effect if using custom skills
"Ins_Soldier_Pilot",				          //Skin "" for random or classname here.
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random",				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
true						// mission true
] call spawn_static;
[[[(_position select 0) - (_width - 5), (_position select 1) + (_width - 5), 0]], //position(s) (can be multiple).
"M2StaticMG",             //Classname of turret
0.7,					  //Skill level 0-1. Has no effect if using custom skills
"Ins_Soldier_Pilot",				          //Skin "" for random or classname here.
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random",				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
true						// mission true
] call spawn_static;
[[[(_position select 0) + (_width - 5), (_position select 1) - (_width - 5), 0]], //position(s) (can be multiple).
"M2StaticMG",             //Classname of turret
0.7,					  //Skill level 0-1. Has no effect if using custom skills
"Ins_Soldier_Pilot",				          //Skin "" for random or classname here.
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random",				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
true						// mission true
] call spawn_static;
///////////////////////////////////////////////////////////////////////////////////////////////////
[[(_position select 0), (_position select 1), 0],   //Position to patrol
[(_position select 0) + _width + 30, (_position select 1) + _width + 30, 0],	// Position to spawn at
_width+30,						//Radius of patrol
10,                     //Number of waypoints to give
"HMMWV_Armored",		//Classname of vehicle (make sure it has driver and gunner)
1						//Skill level of units 
] spawn vehicle_patrol;
///////////////////////////////////////////////////////////////////////////////////////////////////
[[(_position select 0), (_position select 1), 0],    //Position to patrol
[(_position select 0) + 1000, (_position select 1), 0],	             // Position to spawn chopper at
300,					//Radius of patrol
10,                     //Number of waypoints to give
"UH1H_DZ",		        //Classname of vehicle (make sure it has driver and two gunners)
2						//Skill level of units 
] spawn heli_patrol;
[[(_position select 0), (_position select 1), 0],    //Position to patrol
[(_position select 0) - 1000, (_position select 1), 0],	       // Position to spawn chopper at
250,					//Radius of patrol
10,                     //Number of waypoints to give
"UH1H_DZ",		        //Classname of vehicle (make sure it has driver and two gunners)
2						//Skill level of units 
] spawn heli_patrol;*/
///////////////////////////////////////////////////////////////////////////////////////////////////

[nil,nil,rTitleText,"The redneck stop their lhd, go and kill them.", "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	[_position,"Redneck LHD"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 200)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	//[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;
	//[_veh2,[_vehdir,_objPosition2],_vehclass2,true,"0"] call custom_publish;
	//[_veh3,[_vehdir,_objPosition3],_vehclass3,true,"0"] call custom_publish;
	waitUntil
	{
		[_position,"Redneck LHD"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 40)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission LHD Ended At %1",_position];
	[nil,nil,rTitleText,"The Survivors have sunk their battleship.", "PLAIN",10] call RE;
	sleep 30;
	//_build setDamage 2;
	//sleep 0.5;
	//_veh setDamage 0;
	//_veh2 setDamage 0;
	//_veh3 setDamage 0;
} else {
	clean_running_mission = True;
	//deleteVehicle _veh;
	//deleteVehicle _veh2;
	//deleteVehicle _build2;
	//deleteVehicle _build3;
	//deleteVehicle _box;
	{_cleanunits = _x getVariable "missionclean";
	if (!isNil "_cleanunits") then {
		switch (_cleanunits) do {
			case "ground" : {ai_ground_units = (ai_ground_units -1);};
			case "air" : {ai_air_units = (ai_air_units -1);};
			case "vehicle" : {ai_vehicle_units = (ai_vehicle_units -1);};
			case "static" : {ai_emplacement_units = (ai_emplacement_units -1);};
		};
		deleteVehicle _x;
		sleep 0.05;
	};	
	} forEach allUnits;
	
	diag_log format["WAI: Mission LHD timed out At %1",_position];
	[nil,nil,rTitleText,"The Rednecks raided the LHD.", "PLAIN",10] call RE;
};
missionrunning = missionrunning - 1;