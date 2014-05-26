if(!isServer) exitWith {};
private ["_dot","_position","_Marker","_name","_markname","_dotname"];
_position = _this select 0;
_name = _this select 1;

_markname = format["%1 %2, %3", _name, _position select 0, _position select 1];
_dotname = format["%1 %2, %3", "dot", _position select 0, _position select 1];

_Marker = "";
_dot = "";
markerready = false;
_Marker = createMarker [_markname, _position];
_Marker setMarkerColor "ColorRed";
_Marker setMarkerShape "ELLIPSE";
_Marker setMarkerBrush "Solid";
_Marker setMarkerSize [300,300];
_Marker setMarkerText _name;
_dot = createMarker [_dotname, _position];
_dot setMarkerColor "ColorBlack";
_dot setMarkerType "mil_dot";
_dot setMarkerText _markname;
sleep 5;
deleteMarker _Marker;
deleteMarker _dot;
markerready = true;

_tanks = (_position nearEntities ["Tank", 300]) + (_position nearEntities ["LandVehicle", 50 + random_100]);
{
	if(isPlayer _x) then {
		_x setDamage 2;
	};
}foreach _tanks;