timer ++

if (timer == 1) {
	song0 = mus_ch2_credits;
	music_play(song0, 0, false);
    line[0] = "DELTARUNE";
    line[1] = "Chapter " + string(global.chapter);
    line[2] = " ";
    line[3] = "by Toby Fox";
}

if (timer == 100) {
    line[0] = "Main Artist, Animator, & Cleanup";
    line[1] = "(BG, Overworld, Battle)";
    line[2] = "(Sepia and Menu Art)";
    line[3] = " ";
    line[4] = "Temmie Chang";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[2] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer == 200) {
    line[0] = "Main Team";
    line[1] = "Sarah O'Donnell";
    line[2] = "Juju (taxiderby)";
    line[3] = "Fred Wood";
    line[4] = "Jean Canellas";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
}

if (timer == 300) {
    line[0] = "Lancer, Rudinn, Hathy";
    line[1] = "Clover, King, Jevil";
    line[2] = "Original Character Designs";
    linecolor[2] = c_ltgray;
    line[3] = " ";
    line[4] = "Kanotynes";
}

if (timer == 400) {
    line[0] = "Area Concept Art";
    line[1] = "Dark World Costume Design";
    line[2] = " ";
    line[3] = "Gigi DG";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[3] = c_white;
}

if (timer == 500) {
    textalpha = 1;
    line[0] = "Programming Help";
    line[1] = "Shaun Spalding";
    line[2] = " ";
    line[3] = "Character Design Assistance";
    line[4] = "Samanthuel Gillson (splendidland)";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer == 600) {
    creditalpha = 1;
    line[0] = "Cutscene Assistance";
    line[1] = "Chess";
    line[2] = "PixelatedCrown";
    line[3] = " ";
    line[4] = "Shop and BG Pixel Assistance";
    line[5] = "Shawn (puppiesandanime)";
    line[6] = "Kenju";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[4] = c_ltgray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
}

if (timer == 700) {
    line[0] = "Music Assistance";
    line[1] = "Lena Raine";
    line[2] = "Marcy Nabors";
    line[3] = " ";
    line[4] = "Fireworks Effect";
    line[5] = "Lars Korendijk";
    line[6] = " ";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[4] = c_ltgray;
    linecolor[5] = c_white;
}

if (timer == 800) {
    line[0] = "Japanese Localization";
    line[1] = "8-4 Ltd.";
    line[2] = " ";
    line[3] = "Translator";
    line[4] = "Keiko Fukuichi";
    line[5] = " ";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer == 900) {
    line[0] = "Testers";
    line[1] = "Tester A";
    line[2] = "Tester B";
    line[3] = " ";
    line[4] = " ";
    line[5] = " ";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
}

if (timer == 1000) {
    line[0] = "Website";
    line[1] = "Ryan";
    line[2] = "Brian";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
}

if (timer == 1100) {
    line[0] = "Special Thanks";
    line[1] = "Fangamer";
    line[2] = " ";
    line[3] = "\"Temmie\" Character Design";
    line[4] = "Betty Kwong";
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer >= 1150 && timer <= 1200) {
    creditalpha -= 0.02;
    textalpha -= 0.02;
}

if (timer >= 1400) {
    if (timer <= 1560 && creditalpha < 1) {
        creditalpha += 0.01;
    }
    if (timer >= 1560 && creditalpha > 0) {
        creditalpha -= 0.01;
    }

    line[0] = "To be continued";
    line[1] = "in Chapter "+string(global.chapter+1);
    linecolor[0] = c_white;
    linecolor[1] = c_white;
    line[2] = " "
    line[3] = " "
    line[4] = " "
    textalpha -= 0.01;
}