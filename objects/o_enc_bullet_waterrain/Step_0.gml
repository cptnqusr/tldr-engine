if place_meeting(x,y,o_enc_bullet_watercooler){
    instance_destroy()
}

if (image_alpha<1)
    image_alpha+=0.15

speed = lerp(speed,3,0.05)

if (type==1){
    direction=point_direction(x,y,o_enc_bullet_watercooler.x,o_enc_bullet_watercooler.y)
    image_angle=direction
}

if (type==2)||(type==3){
    timer+=orbit_speed
    orbit_radius=max(0,orbit_radius-speed)
    var base_angle=base_dir
    var final_angle=sin(current_time / 800) * 100+base_angle
    
    x=o_enc_bullet_watercooler.x+lengthdir_x(orbit_radius,final_angle)
    y=o_enc_bullet_watercooler.y+lengthdir_y(orbit_radius,final_angle)
    
    direction=point_direction(x,y,o_enc_bullet_watercooler.x,o_enc_bullet_watercooler.y)
    image_angle=direction
}