if(!isServer) exitWith {};

diag_log "WAI: Starting AI Missions Moniter";

markerready = true;
missionrunning = 0;
_startTime = floor(time);
_result = 0;
maxmissioncount = 2;
runtestmission = false;

while {true} do
{
	_cnt = {alive _x} count playableUnits;
	_currTime = floor(time);
	
	//diag_log format ["WAI: CurrTime: %1, StartTime %2", _currTime, _startTime];
	
	if((_currTime - _startTime >= wai_mission_timer) AND (missionrunning < maxmissioncount)) then {_result = 1};
	
	if(missionrunning >= maxmissioncount) then
	{
		_startTime = floor(time);
	};
	
	if((_result == 1) AND (_cnt >= 1))  then // AND (markerready)
    {
		_startTime = floor(time);
		clean_running_mission = False;
        _mission = wai_missions call BIS_fnc_selectRandom;
		if(runtestmission) then {
			_mission = "zombies";
			runtestmission = false;
		};
        execVM format ["\z\addons\dayz_server\WAI\missions\missions\%1.sqf",_mission];
		missionrunning = missionrunning + 1;
        diag_log format["WAI: Starting Mission %1",_mission];
        _startTime = floor(time);
        _result = 0;
    } else {
    	sleep 60;
    };    
};
