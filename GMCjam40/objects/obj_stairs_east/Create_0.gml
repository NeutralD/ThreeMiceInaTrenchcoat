/// @description
event_inherited();

function addToLevel()
{
	tex = sprite_get_texture(spr_brick, 0);
	
	//Add to colmesh
	levelColmesh.addMesh(global.mbuffStairColmesh, matrix_build(x + 128*image_xscale, y, z, 0, 0, -90, image_xscale, 1, 1));
	
	//Add to level geometry
	obj_level_geometry.addModel(global.mbuffStair, tex, matrix_build(x + 128*image_xscale, y, z, 0, 0, -90, image_xscale, 1, 1));	
	
	//Destroy
	instance_destroy();
}