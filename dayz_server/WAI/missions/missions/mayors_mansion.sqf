//Mayors Mansion

private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];
_vehclass = civil_vehicles call BIS_fnc_selectRandom;
_vehclass2 = civil_vehicles call BIS_fnc_selectRandom;
 
_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;

_veh = createVehicle [_vehclass,[(_position select 0) - 25,(_position select 1) + 25,0], [], 0, "CAN_COLLIDE"];
_vehdir = 0;
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
_veh setVariable ["permaLoot",true];
//[_veh] call Small_Medical_Supply_Box;
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission crash_spawner spawned a %1",_vehclass];

_objPosition = getPosATL _veh;

_veh2 = createVehicle [_vehclass2,[(_position select 0) + 25,(_position select 1) - 25,0], [], 0, "CAN_COLLIDE"];
_veh2 setDir _vehdir;
_veh2 setVariable ["ObjectID","1",true];
_veh2 setVariable ["permaLoot",true];
//[_veh2] call Small_Food_Supply_Box;
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh2];
diag_log format["WAI: Mission crash_spawner spawned a %1",_vehclass2];

_objPosition2 = getPosATL _veh2;

//Large Gun Box
_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1), .5], [], 0, "CAN_COLLIDE"];
[_box] call Large_Gun_Box;
 
diag_log format["WAI: Mission Mayors Mansion Started At %1",_position];

//Mayors Mansion
_baserunover = createVehicle ["Land_A_Villa_EP1",[(_position select 0), (_position select 1),0],[], 0, "CAN_COLLIDE"];

_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;

//The Mayor Himself
[[_position select 0, _position select 1, 0],1,1,"Random",4,"","Functionary1_EP1_DZ","Random",true] call spawn_group;
 
[[[(_position select 0) - 15, (_position select 1) + 15, 8]],"M2StaticMG",0.8,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) + 15, (_position select 1) - 15, 8]],"M2StaticMG",0.8,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
 

[nil,nil,rTitleText,"The Mayor of the rednecks has gone nuts, go take him and his task force out to claim the black market weapons!", "PLAIN",10] call RE;
_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
[_position,"Mayors Mansion"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
_currenttime = floor(time);
{if((isPlayer _x) AND (_x distance _position <= 200)) then {_playerPresent = true};}forEach playableUnits;
if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;
	[_veh2,[_vehdir,_objPosition2],_vehclass2,true,"0"] call custom_publish;
waitUntil
{
[_position,"Mayors Mansion"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
_playerPresent = false;
{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
(_playerPresent)
};
diag_log format["WAI: Mission Mayors Mansion Ended At %1",_position];
[nil,nil,rTitleText,"The mayor of the rednecks has been taken out, now we have a new Mayor of the rednecks!", "PLAIN",10] call RE;
} else {
clean_running_mission = True;
deleteVehicle _box;
deleteVehicle _veh1;
deleteVehicle _veh2;
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
 
diag_log format["WAI: Mission Mayors Mansion At %1",_position];
[nil,nil,rTitleText,"The redneck survivors were unable to capture the Mansion time is up!", "PLAIN",10] call RE;
};
 
missionrunning = missionrunning - 1;