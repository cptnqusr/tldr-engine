if place_meeting(x,y,o_enc_bullet_waterrain){
    image_xscale+=0.03
    image_yscale+=0.03
}
if (type==1)||(type==3){
    timer+=0.05
    if place_meeting(x,y,o_enc_bullet_waterrain)
        amplitude+=0.5
    x=center_x+sin(timer)*amplitude
}