//Weapon Cache

private ["_position","_box","_box2","_box3","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];

_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
diag_log format["WAI: Mission Weapon Cache Started At %1",_position];

_tier = (floor random 3) + 1;

_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
[_box, _tier] call Random_Box;


[nil,nil,rTitleText,"Box " + _tier, "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	[_position,"Box " + _tier] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 200)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	waitUntil
	{
		[_position,"Weapon cache"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Weapon cache Ended At %1",_position];
	[nil,nil,rTitleText,"Redneck survivors have secured the Weapon Cache!", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
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
	
	diag_log format["WAI: Mission Weapon cache timed out At %1",_position];
	[nil,nil,rTitleText,"Redneck survivors did not secure the Weapon Cache in time!", "PLAIN",10] call RE;
};

missionrunning = missionrunning - 1;