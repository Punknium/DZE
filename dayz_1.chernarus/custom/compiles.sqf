fnc_usec_selfActions 	= compile preprocessFileLineNumbers "custom\fn_selfActions.sqf";
player_build			= compile preprocessFileLineNumbers "custom\snap_build\player_build.sqf";
player_buildControls	= compile preprocessFileLineNumbers "custom\snap_build\player_buildControls.sqf";
snap_object				= compile preprocessFileLineNumbers "custom\snap_build\snap_object.sqf";
dayz_spaceInterrupt 	= compile preprocessFileLineNumbers "custom\dayz_spaceInterrupt.sqf";
zedSpawn = {
	_position 	= _this select 0;
	_unitTypes 	= []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	_agent 		= objNull;
	_type 		= _unitTypes call BIS_fnc_selectRandom;
	_radius 	= _this select 1;
	_method 	= "NONE";
	_agent 		= createAgent [_type, _position, [], _radius, _method];
	_agent 		setVariable ["myDest",_this select 2];
	_id 		= [_position,_agent] execFSM "\z\addons\dayz_code\system\zombie_agent.fsm";
};
sendFPS = {
		PVDZE_recFPS = diag_fps;
		_id = owner (_this);
		_id publicVariableClient "PVDZE_recFPS";
};
//fnc_usec_damageHandler  = compile preprocessFileLineNumbers "custom\fn_damageHandler.sqf";