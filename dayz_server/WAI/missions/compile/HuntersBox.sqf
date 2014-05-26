//Extra Large Gun Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// RIFLES
_box addWeaponCargoGlobal ["DMR_DZ", 2];
_box addWeaponCargoGlobal ["Huntingrifle", 2];

// AMMUNITION
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", 10];
_box addMagazineCargoGlobal ["5x_22_LR_17_HMR", 10];

// ITEMS
_box addWeaponCargoGlobal ["Binocular_Vector", 2];
_box addWeaponCargoGlobal ["ItemGPS", 2];

_box addMagazineCargoGlobal ["FoodmeatRaw", 10];
_box addMagazineCargoGlobal ["FoodbeefRaw", 10];
_box addMagazineCargoGlobal ["ItemSodaLvg", 10];
_box addMagazineCargoGlobal ["ItemSodaClays", 10];


//BACKPACKS
//_box addBackpackCargoGlobal ['DZ_LargeGunBag_EP1', 2];

// CLOTHING
//_box addMagazineCargoGlobal ["Skin_Drake_Light_DZ", 2];
_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", 1];
