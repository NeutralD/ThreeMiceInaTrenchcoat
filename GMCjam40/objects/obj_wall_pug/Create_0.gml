/// @description
event_inherited();

floorModel = global.mbuffFloor;
wallModel = global.mbuffWallHor32;
floorTex = sprite_get_texture(spr_brick, 0);
wallTex = sprite_get_texture(spr_pug, 0);
//tile = checkNeighbours();
width = 64;
height = 64;
deleteAfterUse = true;

//The parent contains addToLevel(), which adds this tileable wall to the level

function addToLevel()
{
	//Add to colmesh
	levelColmesh.addShape(new colmesh_block(colmesh_matrix_build(x + width / 2, y + width / 2, z + height / 2, 0, 0, 0, width / 2, width / 2, height / 2)));
	
	//Add to level geometry
	obj_level_geometry.addModel(wallModel, wallTex, matrix_build(x + width, y + height, z, 0, 0, 90, 2, 2, 2));
	obj_level_geometry.addModel(wallModel, wallTex, matrix_build(x + width, y, z, 0, 0, 180, 2, 2, 2));
	obj_level_geometry.addModel(wallModel, wallTex, matrix_build(x, y, z, 0, 0, -90, 2, 2, 2));
	obj_level_geometry.addModel(wallModel, wallTex, matrix_build(x, y + height, z, 0, 0, 0, 2, 2, 2));
	
	obj_level_geometry.addModel(floorModel, floorTex, matrix_build(x, y, z + height, 0, 0, 0, 2, 2, 2));	
	
	//Destroy
	instance_destroy();
}