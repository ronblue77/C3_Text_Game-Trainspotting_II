module game;  // Module name should match the file name

import bass;

import libc;
import std::io;
import std::time;
import std::math;
import std::math::random;
import std::os::win32; // Uncomment if needed


// extern fn CBool bass_init(CInt device, DWORD freq, DWORD flags, HWND win, void *clsid) @extern("BASS_Init");
// extern fn void bass_Free() @extern("BASS_Free");
// extern fn HSTREAM bass_StreamCreateFile(CBool mem, char *file, DWORD offset, DWORD length, Win32_Dword flags) @extern("BASS_StreamCreateFile");
// extern fn CBool bass_ChannelPlay(DWORD handle, CBool restart) @extern("BASS_ChannelPlay");
// extern fn CBool bass_ChannelFree(DWORD handle) @extern("BASS_ChannelFree");
// extern fn CBool bass_StreamFree(HSTREAm handle) @extern("BASS_StreamFree");

// Constants using String instead of char*
const String DESC1 = "data\\des1.txt";
const String OPENBANNER1 = "banners\\opening1.txt";
const String OPENINGPOINT1 = "data\\opening1.txt";
const String MENU = "data\\mainmenu.txt";
const String MONEYMENU = "data\\moneyMenu.txt";
const String FRIENDSMENNU = "data\\friendsmenu.txt";
const String OVER = "data\\suicide.txt";
const String THEEND = "data\\theend.txt";

const Win32_DWORD BASS_SAMPLE_LOOP = 4;

const String[12] SONGSRAND = {
    "sound\\walrus1.ogg",
    "sound\\walrus2.ogg",
    "sound\\walrus3.ogg",
    "sound\\walrus4.ogg",
    "sound\\walrus5.ogg",
    "sound\\walrus6.ogg",
    "sound\\walrus7.ogg",
    "sound\\walrus8.ogg",
    "sound\\walrus9.ogg",
    "sound\\walrus10.ogg",
    "sound\\walrus11.ogg",
    "sound\\walrus12.ogg"
}; //0-11

const String[5] MARY = {
    "data\\mary1.txt",
    "data\\mary2rehab.txt",
    "data\\mary3pregnant.txt",
    "data\\mary4jail.txt",
    "data\\mary5dead.txt"
}; // 0-4

const String[5] JOE = {
    "data\\joe1.txt",
    "data\\joe2rehab.txt",
    "data\\joe3jail.txt",
    "data\\joe4.txt",
    "data\\joe5prison.txt"
}; // 0-4

const String[5] FELIX = {
    "data\\felix1.txt",
    "data\\felix2.txt",
    "data\\felix3jail.txt",
    "data\\felix4rehab.txt",
    "data\\felix5crazy.txt"
}; // 0-4

const String[5] DRUGS = {
    "data\\drug1.txt",
    "data\\drug2.txt",
    "data\\drug3.txt",
    "data\\drug4.txt",
    "data\\drug5.txt"
}; //0-4

const String[12] MONTHS = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

const String FAMILY1 = "data\\family1.txt";
const String SCHOOL1 = "data\\school1.txt";

const String[5] SHOP = {
    "data\\shop1.txt",
    "data\\shop2.txt",
    "data\\shop3.txt",
    "data\\shop4.txt",
    "data\\shop5.txt"
}; // 0-4

const String[5] CAR = {
    "data\\car1.txt",
    "data\\car2.txt",
    "data\\car3.txt",
    "data\\car4.txt",
    "data\\car5.txt"
}; // 0-4

const String[5] BURGLUR = {
    "data\\burglur1.txt",
    "data\\burglur2.txt",
    "data\\burglur3.txt",
    "data\\burglur4.txt",
    "data\\burglur5.txt"
}; // 0-4

const String[6] REHAB = {
    "data\\rehab1.txt",
    "data\\rehab2.txt",
    "data\\rehab3.txt",
    "data\\rehab4.txt",
    "data\\rehab5.txt",
    "data\\rehab6.txt"
}; // 0-5

const String[10] MIRROR = {
    "data\\mirror1.txt",
    "data\\mirror2.txt",
    "data\\mirror3.txt",
    "data\\mirror4.txt",
    "data\\mirror5.txt",
    "data\\mirror6.txt",
    "data\\mirror7.txt",
    "data\\mirror8.txt",
    "data\\mirror9.txt",
    "data\\mirror10.txt"
}; // 0-9

bool isOver = false;
bool isMary = true;
bool isJoe = true;
bool isFelix = true;
bool isSuicide = false;
int year = 1991;

Win32_HSTREAM stream = 0;
Win32_HSTREAM stream2 = 0;

int health = 100;
int money = 5000;
int turns = 0;

String temp = "";
String inpt = "";


fn int randomizetimer(int num) {
    return random::rand(num);
}

fn String readFile(String filename) {
      String content = (String)file::load_temp(filename)!!;
    return content;
}

fn void playSound(String path) {
    stream2 = bass::bass_StreamCreateFile(CBool.FALSE, path, 0, 0, 0);
    bass::bass_ChannelPlay(stream2, CBool.FALSE);
}

fn void playMusic(String path) {
    stream = bass::bass_StreamCreateFile(CBool.FALSE, path, 0, 0, BASS_SAMPLE_LOOP);
    bass::bass_ChannelPlay(stream, CBool.FALSE);
}

fn void stopMusic() {
    bass::bass_ChannelFree(stream);
}

fn void freeMusic() {
    bass::bass_StreamFree(stream);
}

fn void bassFree() {
    bass::bass_Free();
}


fn void friends() {
    libc::system("cls");
    String input = "";
    io::printfn("date: %s, %d health: %d money: %d\n\n%s\n", MONTHS[turns], year, health, money, readFile(FRIENDSMENNU));
    input = io::treadline()!!;

    if (input == "1") {
        if (isMary == false) {
            libc::system("cls");
            io::printfn("%s\n", readFile(MARY[4]));
            temp = io::treadline()!!;
        } else {
            int r = randomizetimer(5);
            if (r == 4) {
                isMary = false;
            }
            libc::system("cls");
            io::printfn("%s\n", readFile(MARY[r]));
            temp = io::treadline()!!;
        }
    } else if (input == "2") {
        if (isJoe == false) {
            libc::system("cls");
            io::printfn("%s\n", readFile(JOE[4]));
            temp = io::treadline()!!;
        } else {
            int r = randomizetimer(5);
            if (r == 4) {
                isJoe = false;
            }
            libc::system("cls");
            io::printfn("%s\n", readFile(JOE[r]));
            temp = io::treadline()!!;
        }
    } else if (input == "3") {
        if (isFelix == false) {
            libc::system("cls");
            io::printfn("%s\n", readFile(FELIX[4]));
            temp = io::treadline()!!;
        } else {
            int r = randomizetimer(5);
            if (r == 4) {
                isFelix = false;
            }
            libc::system("cls");
            io::printfn("%s\n", readFile(FELIX[r]));
            temp = io::treadline()!!;
        }
    } else if (input == "4") {
        libc::system("cls");
        io::printfn("%s\n", readFile(SCHOOL1));
        temp = io::treadline()!!;
    } else if (input == "5") {
        libc::system("cls");
        io::printfn("%s\n", readFile(FAMILY1));
        temp = io::treadline()!!;
    } else {
        io::printfn("\n%s", "INVALID INPUT!");
        // time::sleep(5000);
        temp = io::treadline()!!;
    }
}

fn void drugs() {
    int index = randomizetimer(5);  // Get random index 0-4
    libc::system("cls");
    io::printfn("%s\n", readFile(DRUGS[index]));  // Display the scenario text

    // Handle different scenarios effects
    if (index == 0) {
        money -= 170;  // Basic drug purchase
    } else if (index == 3) {
        health -= 5;   // Health impact
        money -= 350;  // More expensive purchase
    } else if (index == 4) {
        health -= 5;   // Overdose health impact
        money -= 250;  // Hospital and drug costs
    }
    temp = io::treadline()!!; // Wait for user input
}

fn void shoplist() {
    int index = randomizetimer(5);
    libc::system("cls");
    io::printfn("%s\n", readFile(SHOP[index]));
    if (index == 0) {
        money += 200;
    } else if (index == 1) {
        money += 150;
    } else if (index == 2) {
        health -= 3;
    } else if (index == 3) {
        money += 200;
    } else if (index == 4) {
        health -= 3;
    }
    temp = io::treadline()!!;
}

fn void car() {
    int index = randomizetimer(5);
    libc::system("cls");
    io::printfn("%s\n", readFile(CAR[index]));
    if (index == 0) {
        money += 1000;
    } else if (index == 1) {
        money += 2000;
    } else if (index == 2) {
        health -= 5;
    } else if (index == 3) {
        money += 1500;
    } else if (index == 4) {
        health -= 5;
    }
    temp = io::treadline()!!;
}

fn void burglury() {
    int index = randomizetimer(5);
    libc::system("cls");
    io::printfn("%s\n", readFile(BURGLUR[index]));
    if (index == 0) {
        money += 2500;
    } else if (index == 1) {
        health -= 7;
    } else if (index == 2) {
        health -= 7;
    } else if (index == 3) {
        money += 2500;
    } else if (index == 4) {
        health -= 7;
    }
    temp = io::treadline()!!;
}

fn void getmoney() {
    libc::system("cls");
    String input = "";
    io::printfn("date: %s, %d health: %d money: %d\n\n%s\n", MONTHS[turns], year, health, money, readFile(MONEYMENU));
    input = io::treadline()!!;

    if (input == "1") {
        shoplist();
    } else if (input == "2") {
        car();
    } else if (input == "3") {
        burglury();
    }
}

fn void rehab() {
    if (money < 2800) {
        libc::system("cls");
        io::printfn("\nYOU DON'T HAVE ENOUGH MONEY FOR REHAB...\nIT COSTS 2800 AND YOU ONLY HAVE %d\n", money);
        temp = io::treadline()!!;
        return;
    }

    money -= 2800;  // Pay for rehab

    for (int i = 0; i < 6; i++) {
        libc::system("cls");
        io::printfn("%s\n", readFile(REHAB[i]));
        temp = io::treadline()!!;
    }

    // Improve health after completing rehab
    health += 65;
    if (health > 100) {
        health = 100;
    }
}

fn void mirror() {
    libc::system("cls");
    if (health >= 90) {
        io::printfn("%s\n", readFile(MIRROR[0]));
    } else if (health >= 80) {
        io::printfn("%s\n", readFile(MIRROR[1]));
    } else if (health >= 70) {
        io::printfn("%s\n", readFile(MIRROR[2]));
    } else if (health >= 60) {
        io::printfn("%s\n", readFile(MIRROR[3]));
    } else if (health >= 50) {
        io::printfn("%s\n", readFile(MIRROR[4]));
    } else if (health >= 40) {
        io::printfn("%s\n", readFile(MIRROR[5]));
    } else if (health >= 30) {
        io::printfn("%s\n", readFile(MIRROR[6]));
    } else if (health >= 20) {
        io::printfn("%s\n", readFile(MIRROR[7]));
    } else if (health >= 10) {
        io::printfn("%s\n", readFile(MIRROR[8]));
    } else {
        io::printfn("%s\n", readFile(MIRROR[9]));
    }

    // Check if health is low enough to enable suicide option
    if (health < 35) {
        isSuicide = true;
    }

    temp = io::treadline()!!;
}

fn void suicide() {
    libc::system("cls");
    io::printfn("%s\n", readFile(OVER));
    temp = io::treadline()!!;
    isOver = true;
}

// Corrected main function
fn int main() {
    if (bass::bass_init(-1, 44100, 0, null, null) == CBool.FALSE) {
        io::printfn("Error initializing BASS library");
        return 1;
    }
    defer bass::bass_Free();
    
    

    io::printn(readFile(DESC1));
    temp = io::treadline()!!;
    libc::system("cls");

    playMusic(SONGSRAND[randomizetimer(12)]);
    io::printn(readFile(OPENBANNER1));
    temp = io::treadline()!!;
    libc::system("cls");
    io::printn(readFile(OPENINGPOINT1));
    temp = io::treadline()!!;
    libc::system("cls");

    while (health > 0 && !isOver) {
        libc::system("cls");
        String input = "";
        if (turns > 11) {
            turns = 0;
            year++;
        }
        if (money < 0) {
            money = 0;
        }
        io::printfn("date: %s, %d health: %d money: %d\n\n%s\n", MONTHS[turns], year, health, money, readFile(MENU));
        if (isSuicide == true) {
            io::printfn("%s\n", "PRESS 8 TO TRY AND SUICIDE");
        }
        input = io::treadline()!!;

        if (input == "1") {
            stopMusic();
            freeMusic();
            playMusic(SONGSRAND[randomizetimer(12)]);
        } else if (input == "7") {
            isOver = true;
        } else if (input == "2") {
            friends();
        } else if (input == "3") {
            drugs();
        } else if (input == "4") {
            getmoney();
        } else if (input == "5") {
            rehab();
        } else if (input == "6") {
            mirror();
        } else if (input == "8" && isSuicide == true) {
            suicide();
        }

        turns++;
    }

    // Show the ending
    libc::system("cls");
    io::printn(readFile(THEEND));
    temp = io::treadline()!!;

    // Free resources
    stopMusic();
    freeMusic();

    return 0;
}