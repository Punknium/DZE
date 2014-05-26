//Medical Supply Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

//MEDICAL SUPPLIES
_box addMagazineCargoGlobal ["ItemSodaRbull", 2];
_box addMagazineCargoGlobal ["ItemSodaMdew", 3];
_box addMagazineCargoGlobal ["FoodCanBakedBeans", 5];
_box addMagazineCargoGlobal ["FoodCanFrankBeans", 5];
_box addMagazineCargoGlobal ["ItemSodaCoke", 8];
_box addMagazineCargoGlobal ["ItemSodaPepsi", 7];
_box addMagazineCargoGlobal ["FoodbaconCooked", 5];
_box addMagazineCargoGlobal ["FoodbeefCooked", 5];
_box addMagazineCargoGlobal ["FoodMRE", 5];
_box addMagazineCargoGlobal ["FoodmuttonCooked", 5];