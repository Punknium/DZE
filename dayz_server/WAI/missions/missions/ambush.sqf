//Construction Supply

private ["_c","_width","_objPosition3","_objPosition2","_vehclass3","_vehclass2","_veh3","_veh2","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

//define vehicles
_vehclass = "Ural_UN_EP1";
_boxclass = "USVehicleBox";

_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
diag_log format["WAI:Mission Office  Ambush Started At %1",_position];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//box1
_box = createVehicle [_boxclass,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_boxdir = 0;
_box setDir _boxdir;
diag_log format["WAI: Mission Office Ambush spawned a %1",_boxclass];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
_veh = createVehicle [_vehclass,[(_position select 0) - 8,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_vehdir = 90;
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission Office Ambush spawned a %1",_vehclass];

_objPosition = getPosATL _veh;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
[_box] call Extra_Large_Gun_Box;
[_veh] call Medical_Supply_Box;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//spawn stuff
[[_position select 0, _position select 1, 0],                  //position
6,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Ins_Soldier_1",			  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true					  // Mission true or false
] call spawn_group;
///////////////////////////////////////////////////////////////////////////////////////////////////

[nil,nil,rTitleText,"The Redneck Bandits have started to build a HQ, Go, stop them, and take their supplies!", "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	[_position,"Redneck HQ"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 50)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;
	waitUntil
	{
		[_position,"Redneck HQ"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 40)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Office Ambush Ended At %1",_position];
	sleep 20;
	[nil,nil,rTitleText,"The Survivors have been ambushed by the Rednecks.", "PLAIN",10] call RE;
	[[(_position select 0) + 100, (_position select 1), 0], 10, 1, "Random", 4, "", "Ins_Soldier_1", "Random", true] call spawn_group;
	[[(_position select 0) - 100, (_position select 1), 0], 10, 1, "Random", 4, "", "Ins_Soldier_1", "Random", true] call spawn_group;
	[[(_position select 0), (_position select 1) + 100, 0], 10, 1, "Random", 4, "", "Ins_Soldier_1", "Random", true] call spawn_group;
	[[(_position select 0), (_position select 1) - 100, 0], 10, 1, "Random", 4, "", "Ins_Soldier_1", "Random", true] call spawn_group;
	///////////////////////////////////////////////////////////////////////////////////////////////////
	[[(_position select 0), (_position select 1), 0],    //Position to patrol
	[(_position select 0) + 500, (_position select 1), 0],	             // Position to spawn chopper at
	300,					//Radius of patrol
	10,                     //Number of waypoints to give
	"UH1H_DZ",		        //Classname of vehicle (make sure it has driver and two gunners)
	3						//Skill level of units 
	] spawn heli_patrol;
	///////////////////////////////////////////////////////////////////////////////////////////////////
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
	
	diag_log format["WAI: Mission Office Ambush timed out at %1",_position];
};
missionrunning = missionrunning - 1;