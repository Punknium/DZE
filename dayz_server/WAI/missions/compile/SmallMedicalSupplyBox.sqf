//Medical Supply Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

//MEDICAL SUPPLIES
_box addMagazineCargoGlobal ["ItemBandage", 10];
_box addMagazineCargoGlobal ["ItemMorphine", 5];
_box addMagazineCargoGlobal ["ItemEpinephrine", 2];
_box addMagazineCargoGlobal ["ItemPainkiller", 13];
_box addMagazineCargoGlobal ["ItemAntibiotic", 5];
_box addMagazineCargoGlobal ["ItemBloodbag", 15];