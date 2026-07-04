event_inherited()

if (timer % 3 == 0 && timer > 6 && timer < timer_end-20) {
    var amount = 1 // bullet_waterrain amount
    var radius = 80 // circle radius thingy idk
    
    for (var i=0; i<amount; i++){
        var ang = random(360);
        var xx = o_enc_bullet_watercooler.x+lengthdir_x(radius,ang)
        var yy = o_enc_bullet_watercooler.y+lengthdir_y(radius,ang)
        
        var bullet = instance_create(o_enc_bullet_waterrain, xx, yy, DEPTH_ENCOUNTER.BULLETS_OUTSIDE)
        bullet.direction = point_direction(xx,yy,o_enc_bullet_watercooler.x,o_enc_bullet_watercooler.y)
        bullet.image_angle = bullet.direction
        bullet.image_xscale = 0.5
        bullet.image_yscale = 0.5
        bullet.type = type
    }
}