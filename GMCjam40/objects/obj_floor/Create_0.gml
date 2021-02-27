/// @description
z = 0;
event_inherited();

function addToLevel()
{
	tex = sprite_get_texture(spr_brick, 0);
	
	//Add to colmesh
	levelColmesh.addShape(new colmesh_cube(x + 16, y + 16, z - 16, 32));
	
	obj_level_geometry.addModel(global.mbuffFloor, tex, matrix_build(x, y, z, 0, 0, 0, 1, 1, 1));
	
	//Destroy
	instance_destroy();
}