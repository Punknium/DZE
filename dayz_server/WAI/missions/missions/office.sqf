//Construction Supply

private ["_c","_width","_objPosition3","_objPosition2","_vehclass3","_vehclass2","_veh3","_veh2","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

//define vehicles
_vehclass = "Ural_UN_EP1";
_vehclass2 = "Ural_UN_EP1";
_vehclass3 = "Ural_TK_CIV_EP1";
_buildclass = "Land_A_Office01";
_buildclass2 = "Land_A_CraneCon";
_buildclass3 = "Land_A_CraneCon";
_buildclass4 = "Land_Mil_Barracks_i";
_fenceclass = "Fence_Ind_long";
_boxclass = "USVehicleBox";

_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
diag_log format["WAI: Office Started At %1",_position];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Office
_build = createVehicle [_buildclass,[(_position select 0),(_position select 1) + 30,0], [], 0, "CAN_COLLIDE"];
_builddir = 0;
_build setDir _builddir;
diag_log format["WAI: Mission Office spawned a %1",_buildclass];

//Crane1
_build2 = createVehicle [_buildclass2,[(_position select 0) + 45,(_position select 1) + 25,0], [], 0, "CAN_COLLIDE"];
_builddir2 = 0;
_build2 setDir _builddir2;
diag_log format["WAI: Mission Office spawned a %1",_buildclass2];

//Crane2
_build3 = createVehicle [_buildclass3,[(_position select 0) - 45,(_position select 1) + 25,0], [], 0, "CAN_COLLIDE"];
_builddir3 = 0;
_build3 setDir _builddir3;
diag_log format["WAI: Mission Office spawned a %1",_buildclass3];

//barracks
_build4 = createVehicle [_buildclass4,[(_position select 0),(_position select 1) - 40,0], [], 0, "CAN_COLLIDE"];
_builddir4 = 90;
_build4 setDir _builddir4;
diag_log format["WAI: Mission Office spawned a %1",_buildclass4];

//box1
_box = createVehicle [_boxclass,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_boxdir = 0;
_box setDir _boxdir;
diag_log format["WAI: Mission Office spawned a %1",_boxclass];

//box2
_box2 = createVehicle [_boxclass,[(_position select 0),(_position select 1) + 30,0], [], 0, "CAN_COLLIDE"];
_boxdir2 = 0;
_box2 setDir _boxdir2;
diag_log format["WAI: Mission Office spawned a %1",_boxclass];
/////////////////////////////////////////////////////////////////////////////////////////////////////////
_width = 8*8;
_c = _width * -1;
while { _c <= _width } do {
	if (_c <= -4 || _c >= 4) then { 
		_fence = createVehicle [_fenceclass,[(_position select 0) + _c,(_position select 1) + _width,0], [], 0, "CAN_COLLIDE"];
		_fence setDir 0;
		diag_log format["WAI: Mission Office spawned a %1",_fenceclass];
	};
	
	_fence = createVehicle [_fenceclass,[(_position select 0) + _c,(_position select 1) - _width,0], [], 0, "CAN_COLLIDE"];
	_fence setDir 180;
	diag_log format["WAI: Mission Office spawned a %1",_fenceclass];
	
	_fence = createVehicle [_fenceclass,[(_position select 0) + _width,(_position select 1) + _c,0], [], 0, "CAN_COLLIDE"];
	_fence setDir 90;
	diag_log format["WAI: Mission Office spawned a %1",_fenceclass];
	
	_fence = createVehicle [_fenceclass,[(_position select 0) - _width,(_position select 1) + _c,0], [], 0, "CAN_COLLIDE"];
	_fence setDir 270;
	diag_log format["WAI: Mission Office spawned a %1",_fenceclass];
	
	_c = _c + 8
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////
_veh = createVehicle [_vehclass,[(_position select 0) - 8,(_position select 1) - 32,0], [], 0, "CAN_COLLIDE"];
_vehdir = 90;
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission Office spawned a %1",_vehclass];

_objPosition = getPosATL _veh;

_veh2 = createVehicle [_vehclass2,[(_position select 0) - 8,(_position select 1) - 36,0], [], 0, "CAN_COLLIDE"];
_vehdir2 = 90;
_veh2 setDir _vehdir2;
_veh2 setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh2];
diag_log format["WAI: Mission Office spawned a %1",_vehclass2];

_objPosition2 = getPosATL _veh2;

_veh3 = createVehicle [_vehclass3,[(_position select 0) - 8,(_position select 1) - 40,0], [], 0, "CAN_COLLIDE"];
_vehdir3 = 90;
_veh3 setDir _vehdir3;
_veh3 setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh3];
diag_log format["WAI: Mission Office spawned a %1",_vehclass3];

_objPosition3 = getPosATL _veh3;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
[_box] call Extra_Large_Gun_Box;
[_box2] call Extra_Large_Gun_Box;
[_veh] call Construction_Supply_Box;
[_veh2] call Construction_Supply_Box;
[_veh3] call Medical_Supply_Box;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//spawn stuff
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
8,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
8,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
[[_position select 0, _position select 1, 0],                  //position
8,						  //Number Of units
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
3						//Skill level of units 
] spawn heli_patrol;
///////////////////////////////////////////////////////////////////////////////////////////////////

[nil,nil,rTitleText,"The redneck bandits have started to build a HQ, Go, stop them, and take their supplies!", "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	[_position,"Redneck HQ"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 200)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;
	[_veh2,[_vehdir,_objPosition2],_vehclass2,true,"0"] call custom_publish;
	[_veh3,[_vehdir,_objPosition3],_vehclass3,true,"0"] call custom_publish;
	waitUntil
	{
		[_position,"Redneck HQ"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 40)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Office Ended At %1",_position];
	[nil,nil,rTitleText,"The Survivors have planted a bomb, and destoryed, the Redneck HQ!", "PLAIN",10] call RE;
	sleep 30;
	_build setDamage 2;
	sleep 0.5;
	//[[_position select 0, _position select 1, 0], 8, 1, "Random", 4, "", "Ins_Soldier_1", "Random", true] call spawn_group;
	[[(_position select 0), (_position select 1), 0], [(_position select 0) - 1000, (_position select 1), 0], 250, 10, "UH1H_DZ", 3] spawn heli_patrol;
	_veh setDamage 0;
	_veh2 setDamage 0;
	_veh3 setDamage 0;
} else {
	clean_running_mission = True;
	deleteVehicle _veh;
	deleteVehicle _veh2;
	deleteVehicle _build2;
	deleteVehicle _build3;
	deleteVehicle _box;
	deleteVehicle _box2;
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
	
	diag_log format["WAI: Mission Office timed out at %1",_position];
	[nil,nil,rTitleText,"The Rednecks have finshed their HQ, go, find, and loot it!", "PLAIN",10] call RE;
};
missionrunning = missionrunning - 1;