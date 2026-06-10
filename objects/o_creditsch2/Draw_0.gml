draw_set_font(loc_font("main"));
draw_set_halign(fa_center);
draw_set_alpha(creditalpha);

for (i = 0; i < 8; i += 1) {
    draw_set_color(linecolor[i]);
    draw_text(320/2, 240/8 + (20 * i) + 50, string_hash_to_newline(line[i]));
}
draw_set_halign(fa_left);