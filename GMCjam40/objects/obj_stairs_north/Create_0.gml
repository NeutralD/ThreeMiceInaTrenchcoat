/// @description
event_inherited();

function addToLevel()
{
	tex = sprite_get_texture(spr_brick, 0);
	
	//Add to colmesh
	levelColmesh.addShape(new colmesh_block(colmesh_matrix_build(x + 16, y + 16, z + 32, 0, 0, 0, 16, 16, 32)));
	
	//Add to level geometry
	obj_level_geometry.addModel(global.mbuffFloor, tex, matrix_build(x, y, z + 64, 0, 0, 0, 1, 1, 1));	
	
	//Destroy
	instance_destroy();
}