draw_set_font(loc_font("main"));
draw_set_halign(fa_center);
draw_set_alpha(creditalpha);

var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var y_offset = 0;

if (timer >= 573 && timer < 668)
    y_offset = -16;

for (i = 0; i < 8; i++)
{
    draw_set_color(linecolor[i]);
    draw_text(cam_x + (cam_w * 0.5),cam_y + 50 + (20 * i) + y_offset,string_hash_to_newline(line[i])
    );
}

draw_set_alpha(textalpha);
draw_set_color(c_yellow);

draw_text(cam_x + (cam_w * 0.5),cam_y + cam_h - 40,string_hash_to_newline(lyric));

draw_set_alpha(1);
draw_set_halign(fa_left);