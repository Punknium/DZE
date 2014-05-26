_target = _this select 0;
_caller = _this select 1;
_id		= _this select 2;
_args	= _this select 3;

_command = _args select 0;

_target removeAction _id;

//Turns admin debug on
if (_command == "ad1") then {
	a_d = true;
	s_admin_debug = -1;
};
if (_command == "ad0") then {
	a_d = false;
	s_admin_debug = -1;
};
if (_command == "startmission") then {
	createDialog "RscDisplayPassword";
	ctrlSetText [1001,"BroadCast Message Plugin"];
	ctrlSetText [101,""];
	ctrlshow [1002,false];

	buttonSetAction [1,"PVDZE_startMission = [ctrlText 101]; publicVariableServer ""PVDZE_startMission"";"];
	s_admin_startmission = -1;
};
if (_command == "boom") then {
	s_admin_boom = -1;
	for "_xc" from -10 to 10 do {
		for "_yc" from -10 to 10 do {
			_nil = createVehicle ["Bo_GBU12_LGB", [(getPos player select 0) + _xc, (getPos player select 1) + 100, (getPos player select 2) + _yc], [], 0, "CAN_COLLIDE"];
		};
	};

};