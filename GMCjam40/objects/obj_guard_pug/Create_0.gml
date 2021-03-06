///@desc enemy init
event_inherited();

#region Set different stats:
//Sight arc = min + add * awareness. High when chasing
sight_arc_min = 80;
sight_arc_add = 40;
//Sight range. Increases when chasing.
sight_range_min = 128;
sight_range_add = 128;

//Odds of seeing per step
attention = 10;
//How long he waits after sighting.
focus = 50;

//Jump speed and fall speed.
speed_jump = 3;
speed_fall = 0.4;
//Default speed + chase speed.
speed_min = 1;
speed_add = 2;

//Default turning speed + chase speed.
turn_min = 0.05;
turn_add = 0.15;

//Ground friction and air friction
fric_ground = 0.3;
fric_air = 0.03;
jumpy = 3;
#endregion

scale = 6;

instance = new smf_instance(global.modPugGuard);

snd_attack = snd_pug_attack;
snd_huh = snd_pug_huh;

instance.play("Idle", .2, 1, true);