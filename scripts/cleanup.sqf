
//_params = _this select 3;
_side = civilian;
_radius = 600;

_nearMen = player nearEntities ["C_man_shorts_4_F", _radius];
{
 if (side _x == _side) then {
   _x setDamage 1.0;
 };
} forEach (_nearMen - [player]);