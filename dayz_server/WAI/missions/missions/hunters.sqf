//Construction Supply

private ["_box","_c","_width","_objPosition3","_objPosition2","_vehclass3","_vehclass2","_veh3","_veh2","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

//define vehicles
_vehclass = "Pickup_PK_GUE_EP1_DZE";
_buildclass = "Land_Misc_deerstand";
_buildclass2 = "Land_Misc_deerstand";
_boxclass = "LocalBasicWeaponsBox";

_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
diag_log format["WAI: Hunters Started At %1",_position];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Stand 1
_build = createVehicle [_buildclass,[(_position select 0) + 10,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_builddir = 0;
_build setDir _builddir;
diag_log format["WAI: Mission Hunters spawned a %1",_buildclass];

//Stand 2
_build2 = createVehicle [_buildclass2,[(_position select 0) - 10,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_builddir2 = 0;
_build2 setDir _builddir2;
diag_log format["WAI: Mission Hunters spawned a %1",_buildclass2];

//box1
_box = createVehicle [_boxclass,[(_position select 0),(_position select 1) - 5,0], [], 0, "CAN_COLLIDE"];
[_box] call Hunter_Box;
_boxdir = 0;
_box setDir _boxdir;
diag_log format["WAI: Mission Hunters spawned a %1",_boxclass];
/////////////////////////////////////////////////////////////////////////////////////////////////////////
_veh = createVehicle [_vehclass,[(_position select 0) - 18,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_vehdir = 90;
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission Hunters spawned a %1",_vehclass];

_objPosition = getPosATL _veh;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//spawn stuff
[[_position select 0, _position select 1, 0],                  //position
3,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
5,			     		 //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Worker2",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
3,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
5,			    		  //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Worker2",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
///////////////////////////////////////////////////////////////////////////////////////////////////

[nil,nil,rTitleText,"The local rednecks have went hunting. Go, ambush them, and take their stuff.", "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	[_position,"Hunting Party"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 200)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;
	waitUntil
	{
		[_position,"Hunting Party"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 40)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Hunters Ended At %1",_position];
	[nil,nil,rTitleText,"The rednecks were ambushed and didn't get to finsh hunting.", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _veh;
	deleteVehicle _box;
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
	
	diag_log format["WAI: Mission Hunters timed out At %1",_position];
	[nil,nil,rTitleText,"The rednecks got their game, and have left.", "PLAIN",10] call RE;
};
missionrunning = missionrunning - 1;