///@desc Clean surfaces and set light

deferred_surface();

if (instance_exists(obj_player))
{
	var _cx,_cy,_cz;
	_cx = global.camX+(obj_player.x-global.camX)*2;
	_cy = global.camY+(obj_player.y-global.camY)*2;
	_cz = global.camZ+(obj_player.z-global.camZ)*2;
	light_follow(_cx,_cy,_cz);
}