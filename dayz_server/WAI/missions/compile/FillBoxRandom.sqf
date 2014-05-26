_box		= _this select 0;
_tier 		= _this select 1;

//Sets up box
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

//Number of rifles in each tier
_t1count = 5;
_t2count = 8;
_t3count = 10;
_t4count = 12;

//Sets the items in each tier
_rt0 = ["M16A2"];
_pt0 = ["glock17_EP1"];
_it0 = [];

_rt1 = ["M16A2","AKS_74_kobra","LeeEnfield","Remington870_lamp","SVD"]; 
_pt1 = ["glock17_EP1","Colt1911"];
_it1 = [];

_rt2 = ["G36C","M4A1_AIM_CAMO","AK_47_M","RPK_74","M4A1_AIM_SD_camo","M4A1_HWS_GL_camo","KsvK_DZE"];
_pt2 = ["glock17_EP1","UZI_EP1"];
_it2 = [];

_rt3 = ["M4A1","G36A_camo","DMR_DZ","M14_EP1","M16A4_GL","M249_DZ","M24","M40A3","M4A3_RCO_GL_EP1","M4SPR"];
_pt3 = ["glock17_EP1","UZI_EP1","Colt1911","bizon"];
_it3 = [];

_rt4 = ["DMR_DZ","BAF_LRR_scoped_W","M4A3_CCO_EP1","M110_NVG_EP1","Mk_48_DZ","M14_EP1","SCAR_L_CQC_CCO_SD","SCAR_H_LNG_Sniper_SD","M60A4_EP1_DZE","M4A1_HWS_GL_camo"];
_pt4 = ["M9","M9SD","UZI_SD_EP1","bizon_silenced"];
_it4 = [];

_rt5 = ["m107_dz"];
_pt5 = ["UZI_SD_EP1"];
_it5 = [];

//Combines the arrays
_rifles 	= [_rt0, _rt1, _rt2, _rt3, _rt4, _rt5];
_pistols	= [_pt0, _pt1, _pt2, _pt3, _pt4, _pt5];
_items		= [_it0, _it1, _it2, _it3, _it4, _it5];
_count		= [0, _t1count, _t2count, _t3count, _t4count, 0];

//Counts the number of tiers
_tiercount = (count _rifles) - 2;

//Makes sure tier is in range
if (_tier > _tiercount) then {_tier = _tiercount};

//Sets the chance to go up or down a tier
_tierup = 100 - ((_tiercount - _tier + 1) * 5);
_tierdown = _tier * 5;

//Fills Rifles
_x = 0;
for "_x" from 1 to _count select _tier do {
	_roll = floor random 100;
	_t = _tier;
	if (_roll < _tierdow) then {
		_t = _t - 1;
	};
	if (_roll > _tierup) then {
		_t = _t + 1;
	};
	_weapon = (_rifles select _t) call BIS_fnc_selectRandom;
	_magarry = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
	_magazine = _magarry select (count _magarry - 1);
	_magcount = (floor random 3) + 3;
	_box addWeaponCargoGlobal [_weapon, 1];
	_box addMagazineCargoGlobal [_magazine, _magcount];
};

//Fills Pistols
_x = 0;
for "_x" from 1 to (_tier + (floor random 2)) do {
	_roll = floor random 100;
	_t = _tier;
	if (_roll < _tierdow) then {
		_t = _t - 1;
	};
	if (_roll > _tierup) then {
		_t = _t + 1;
	};
	_weapon = (_pistols select _t) call BIS_fnc_selectRandom;
	_magarry = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
	_magazine = _magarry select (count _magarry - 1);
	_magcount = (floor random 3) + 2;
	_box addWeaponCargoGlobal [_weapon, 1];
	_box addMagazineCargoGlobal [_magazine, _magcount];
};

call BIS_fnc_selectRandom;
getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");