fnc_debug = {
	dbgM = true;
    while {dbgM} do
    {
    _fps = floor diag_fps;
	_hours = floor ((serverTime/60)/60);
	_mins = floor ((serverTime/60)%60);
	_blood = floor (r_player_blood/120);
	_posASL = (getPosASL player);
	_posATL = (getPosATL player);
	_posii = (getPos player);
	_temp = round(dayz_temperatur);
	_vehicle = vehicle player;
	_cursorTarget = cursorTarget;
	_typeOfCursorTarget = typeOf _cursorTarget;
	_zedcount = count ((position player) nearEntities ["zZombie_Base", 200]);
	
	if (isNil _typeOfCursorTarget) then {
		_typeOfCursorTarget = "n/a";
	};
	
	_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
	_textCity = "Wilderness";
	if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
	
	if((getPlayerUID player) in ["147505542"] && a_d) then {
		PVDZE_getFPS = player;
		publicVariableServer "PVDZE_getFPS";
		sleep 0.5;
		hintSilent parseText format ["
			<t size='1.50' font='Bitstream' color='#58827A'>Redneck Gaming</t><br/><br/>
			<br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Server Uptime: </t><t size='1.15' font='Bitstream' align='right'>%2hr %3min</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>FPS: </t><t size='1.15' font='Bitstream' align='right'>%1</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Server FPS: </t><t size='1.15' font='Bitstream' align='right'>%7</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Get Pos: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>ATL: </t><t size='1.15' font='Bitstream' align='right'>%9</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>ASL: </t><t size='1.15' font='Bitstream' align='right'>%10</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Vehicle: </t><t size='1.15' font='Bitstream' align='right'>%5</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Target: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Zed Count: </t><t size='1.15' font='Bitstream' align='right'>%8</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Random 100: </t><t size='1.15' font='Bitstream' align='right'>%11</t><br/>
			",
			_fps,
			_hours,
			_mins,
			_posii,
			_vehicle,//5
			_typeOfCursorTarget,
			serverFPS,
			_zedcount,
			_posATL,
			_posASL,//10
			random_100
		];
	} else {
		hintSilent parseText format ["
			<t size='1.50' font='Bitstream' color='#58827A'>Redneck Gaming</t><br/><br/>
			<t size='1.20' font='Bitstream' color='#5882FA'>%1</t><br/>
			<t size='1.15' font='Bitstream'>Nearest City: </t><br/>
			<t size='1.15' font='Bitstream'>%17</t><br/>
			<br/>
			<t size='1.20' font='Bitstream' color='#5882FA'>Survived %7 Days</t><br/><br/>
			<t size='1.15' font='Bitstream' align='left'>Zombies Killed: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Headshots: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%5</t><br/>
			<br/>
			<t size='1.15' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Blood: </t><t size='1.15' font='Bitstream' align='right'>%8 %12</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Infected: </t><t size='1.15' font='Bitstream' align='right'>%9</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Injured: </t><t size='1.15' font='Bitstream' align='right'>%10</t><br/>
			<t size='1.15' font='Bitstream' align='left'>In Pain: </t><t size='1.15' font='Bitstream' align='right'>%11</t><br/>
			<t size='1.15' font='Bitstream' align='left'>Temperature: </t><t size='1.15' font='Bitstream' align='right'>%18 °C</t><br/>
			<br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Server Uptime: </t><t size='1.15' font='Bitstream' align='right'>%14hr %15min</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>FPS: </t><t size='1.15' font='Bitstream' align='right'>%13</t><br/>
			<t size='1.15' font='Bitstream' align='left' color='#7777FF'>Player Coords: </t><t size='1.15' font='Bitstream' align='right'>%16</t><br/>
			<br/>
			<t size='1.15' font='Bitstream' align='center' color='#7777FF'>Press Insert to close.</t>
			",
			(name player),
			(player getVariable['zombieKills', 0]),
			(player getVariable['headShots', 0]),
			(player getVariable['humanKills', 0]),
			(player getVariable['banditKills', 0]),
			(player getVariable['humanity', 0]),
			(dayz_Survived),
			_blood,
			(r_player_infected),
			(r_player_injured),
			(r_player_inpain),
			"%", //12
			_fps,
			_hours,
			_mins,
			_posii, //16
			_textCity,
			_temp
		]; 
	};
	sleep 0.2;
	};
};
[] spawn fnc_debug;