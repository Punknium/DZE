//Construction Supply

private ["_c","_width","_objPosition3","_objPosition2","_vehclass3","_vehclass2","_veh3","_veh2","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

//define vehicles
_zombletypes = ["zZombie_Base", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3"];
_boxclass = "USVehicleBox";
_wreckclass = "Lada1";
_civ1 = "Farmwife1";
_civ2 = "RU_Doctor";
_civ3 = "RU_Priest";
_civ4 = "SchoolTeacher";

_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
diag_log format["WAI: Zombies Started At %1",_position];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
[nil,nil,rTitleText,"A group a survivors has crashed, go and save them.", "PLAIN",10] call RE;
_aciv1 = createAgent [_civ1, _position, [], 5, "None"];
_aciv2 = createAgent [_civ2, _position, [], 5, "None"];
_aciv3 = createAgent [_civ3, _position, [], 5, "None"];
_aciv4 = createAgent [_civ4, _position, [], 5, "None"];

_aciv1 playMove "AmovPercMstpSnonWnonDnon_idle72lehSedy";
_aciv2 playMove "NavigationHeli";
_aciv3 playMove "AidlPpneMstpSnonWnonDnon_SleepC_lookAround";
_aciv4 playMove "aidlppnemstpsraswrfldnon0s";

_wreck = createVehicle [_wreckclass,[(_position select 0)+10,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_wreckdir = 0;
_wreck setDir _wreckdir;
_wreck setvectorup [0,0.1,0.01];
_wreck setdamage 1;
diag_log format["WAI: Mission Zombies spawned a %1",_wreckclass];

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
_nearplayer = nil;
while {_missiontimeout} do {
	[_position,"Stranded Survivors"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 50)) then {_nearplayer = _x; _playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};	
if (_playerPresent) then {
	sleep 3;
	[nil,nil,rTitleText,"Protect the Survivors.", "PLAIN",10] call RE;
	diag_log format["WAI: Mission Zombies Stage 2 started by %1",getPlayerUID _nearplayer];
	{
		if((isPlayer _x) AND (_x distance _position <= 800)) then {
			_i = 1;
			for "_i" from 1 to 75 do
			{
				if (_x distance _position > 300) then {
					_zomblesposition = [getPosASL _x,50,100,10,0,0,0] call BIS_fnc_findSafePos;
					PVDZE_spawnZed = [_zomblesposition,0,getPosASL _x];
					(owner _x) publicVariableClient "PVDZE_spawnZed";
				} else {
					_zomblesposition = [_position,50,100,10,0,0,0] call BIS_fnc_findSafePos;
					PVDZE_spawnZed = [_zomblesposition,0,_position];
					(owner _x) publicVariableClient "PVDZE_spawnZed";
				};
			};
		};
	}forEach playableUnits;
	sleep 2;
	//_nil = createVehicle ["SmokeShellRed", [_position select 0, _position select 1, (_position select 2) + 200], [], 0, "CAN_COLLIDE"];
	waitUntil
	{
		[_position,"Stranded Survivors"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
		_zombies = _position nearEntities ["zZombie_Base", 300];
		{
			if((_x distance _position) < (floor random 10) + 5 && alive _x) then {
				_nil = createVehicle ["G_Camel_HE", getPos _x, [], 0, "CAN_COLLIDE"];
			};
		} forEach _zombies;
		_count = count _zombies;
		(_count < 15)
	};
	diag_log format["WAI: Mission Zombies Ended At %1",_position];
	_civcount = 0;
	if (alive _aciv1) then {_civcount = _civcount + 1;};
	if (alive _aciv2) then {_civcount = _civcount + 1;};
	if (alive _aciv3) then {_civcount = _civcount + 1;};
	if (alive _aciv4) then {_civcount = _civcount + 1;};
	_playerPresent = false;
	{if((isPlayer _x) AND (_x distance _position <= 300)) then {_playerPresent = true};}forEach playableUnits;
	
	if (_civcount > 0 && _playerPresent) then {
	[nil,nil,rTitleText,"The survivors have spawned you a gift.", "PLAIN",10] call RE;
		//box1
		_box = createVehicle [_boxclass,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
		_boxdir = 0;
		_box setDir _boxdir;
		diag_log format["WAI: Mission Zombies spawned a %1",_boxclass];
		[_box] call Extra_Large_Gun_Box;
	} else {
		[nil,nil,rTitleText,"The survivors did not survive.", "PLAIN",10] call RE;
	};
	
} else {
	clean_running_mission = True;
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
	
	diag_log format["WAI: Mission Zombies timed out at %1",_position];
	[nil,nil,rTitleText,"They survivors were not saved in time, and were ate by the zombies.", "PLAIN",10] call RE;
};
missionrunning = missionrunning - 1;