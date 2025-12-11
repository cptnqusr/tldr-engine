timer += 1;

if (timer == 1)
{
    song0 = mus_dontforget;
    music_play(song0, 0, false);
}

if (timer == 60)
    lyric = "When the";

if (timer == 108)
{
    lyric = "light is running low";
    line[0] = "DELTARUNE";
    line[1] = "Chapter 1";
    line[2] = " ";
    line[3] = "by Toby Fox";
}

if (timer == 180)
    lyric = "And the shadows start to grow";

if (timer == 201)
{
    line[0] = "Main Artist, Animator, & Cleanup";
    line[1] = "(BG, Overworld, Battle)";
    line[2] = "(Sepia and Menu Art, Borders)";
    line[3] = " ";
    line[4] = "Temmie Chang";

    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[2] = c_ltgray;
    linecolor[4] = c_white;

    lyric = "And the shadows start to grow";
}

if (timer == 278)
    lyric = "And the places that you know";

if (timer == 298)
{
    line[0] = "Lancer, Rudinn, Hathy";
    line[1] = "Clover, King, Jevil";
    line[2] = "Original Character Designs";
    line[3] = " ";
    line[4] = "Kanotynes";

    linecolor[2] = c_ltgray;

    lyric = "And the places that you know";
}

if (timer == 366)
    lyric = "Seem like fantasy";

if (timer == 390)
{
    line[0] = "Japanese Localization"; 
    line[1] = "8-4, Ltd.";
    line[2] = " ";
    line[3] = "Translator";
    line[4] = "Keiko Fukuichi";

    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;

    lyric = "Seem like fantasy";
}

if (timer >= 480 && timer <= 520)
{
    creditalpha -= 0.025;
    textalpha -= 0.025;
}

if (timer == 526)
{
    textalpha = 1;
    lyric = "There's a";
}

if (timer == 573)
{
    creditalpha = 1;

    line[0] = "Localization Producers";
    line[1] = "John Ricciardi";
    line[2] = "Graeme Howard";
    line[3] = "Additional Programming";
    line[4] = "Gregg Tavares (PC)";
    line[5] = "Sarah O'Donnell (Console)";
    line[6] = "Fred Wood";
    line[7] = "Henri Beeres (Enjl)";

    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;

    lyric = "Light inside your soul";
}

if (timer == 645)
    lyric = "That's still shining in the cold";

if (timer == 668)
{
    line[0] = "Don't Forget (Vocal Excerpt)";
    line[1] = "Piano Arranged & Vocals Performed by";
    line[2] = "Laura Shigihara";
    line[3] = "Snowdrake & Monster Kid Design";
    line[4] = "Magnolia Porter";
    line[5] = "";
    line[6] = "";
    line[7] = "";

    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[2] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;

    lyric = "That's still shining in the cold";
}

if (timer == 735)
    lyric = "With the truth";

if (timer == 765)
{
    line[0] = "Special Thanks";
    line[1] = "Gigi DG (Outfit & Color Assist)";
    line[2] = "Betty Kwong (Temmie Design)";
    line[3] = "256graph (JP Graphics)";
    line[4] = "Ryan Alyea (Website)";
    line[5] = "Brian Coia (Website)";

    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
}

if (timer == 798)
    lyric = "The promise in our hearts";

if (timer == 870)
{
    line[0] = "Special Thanks";
    line[1] = "Chess (Support)";
    line[2] = "Fontworks Inc.";
    line[3] = "Yutaka Sato (Happy Ruika)";
    line[4] = "Hiroko Minamoto";
    line[5] = "All 8-4 & Fangamer Staff";

    linecolor[1] = c_white;
}

if (timer >= 960 && timer <= 1030)
{
    creditalpha -= 0.02;
    textalpha -= 0.02;
}

if (timer == 1033)
{
    textalpha = 1;
    lyric = "Don't forget";
}

if (timer == 1086)
    lyric = "I'm with you in the dark";

if (timer >= 1300)
{
    if (timer <= 1560 && creditalpha < 1)
        creditalpha += 0.01;
    
    if (timer >= 1560 && creditalpha > 0)
        creditalpha -= 0.01;
    
    line[0] = "To be continued";
    line[1] = " ";
    line[2] = " ";
    line[3] = " ";
    line[4] = " ";
    line[5] = " ";

    linecolor[0] = c_white;
    linecolor[1] = c_white;

    textalpha -= 0.01;
}
/*
if (timer == 1660)

if (timer == 1680)
    room_goto(room_chapter_continue);