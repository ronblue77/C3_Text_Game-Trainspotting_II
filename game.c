#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>
#include <windows.h>
#include <ctype.h>
#include <math.h>
#include <time.h>
#include "bass.h"

/* initialization of game constants and arrays and variables */

const char* DESC1 = "data\\des1.txt";
const char* OPENBANNER1 = "banners\\opening1.txt";
const char* OPENINGPOINT1 = "data\\opening1.txt";
const char* MENU = "data\\mainmenu.txt";
const char* MONEYMENU = "data\\moneyMenu.txt";
const char* FRIENDSMENNU = "data\\friendsmenu.txt";
const char* OVER = "data\\suicide.txt";
const char* THEEND = "data\\theend.txt";

const char* SONGSRAND[] = {
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



const char* MARY[] = {
	"data\\mary1.txt",
	"data\\mary2rehab.txt",
	"data\\mary3pregnant.txt",
	"data\\mary4jail.txt",
	"data\\mary5dead.txt"
}; // 0-4

const char* JOE[] = {
	"data\\joe1.txt",
	"data\\joe2rehab.txt",
	"data\\joe3jail.txt",
	"data\\joe4.txt",
	"data\\joe5prison.txt"
}; // 0-4

const char* FELIX[] = {
	"data\\felix1.txt",
	"data\\felix2.txt",
	"data\\felix3jail.txt",
	"data\\felix4rehab.txt",
	"data\\felix5crazy.txt"
}; // 0-4

const char* DRUGS[] = {
	"data\\drug1.txt",
	"data\\drug2.txt",
	"data\\drug3.txt",
	"data\\drug4.txt",
	"data\\drug5.txt"
}; //0-4

const char* months[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

const char* FAMILY1 ="data\\family1.txt";
const char* SCHOOL1 = "data\\school1.txt";

const char* SHOP[] = {
    "data\\shop1.txt",
    "data\\shop2.txt",
    "data\\shop3.txt",
    "data\\shop4.txt",
    "data\\shop5.txt"
}; // 0-4

const char* CAR[] = {
    "data\\car1.txt",
    "data\\car2.txt",
    "data\\car3.txt",
    "data\\car4.txt",
    "data\\car5.txt"
}; // 0-4

const char* BURGLUR[] = {
    "data\\burglur1.txt",
    "data\\burglur2.txt",
    "data\\burglur3.txt",
    "data\\burglur4.txt",
    "data\\burglur5.txt"
}; // 0-4

const char* REHAB[] = {
    "data\\rehab1.txt",
    "data\\rehab2.txt",
    "data\\rehab3.txt",
    "data\\rehab4.txt",
    "data\\rehab5.txt",
    "data\\rehab6.txt"
}; // 0-5

const char* MIRROR[] = {
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

HSTREAM stream = 0;
HSTREAM stream2 = 0;

int health = 100, money = 5000, turns = 0;

int randomizetimer(int num) {
	// srand((unsigned int) time(NULL));
	return rand()%num;
}

void playSound(const char* path) {
	stream2=BASS_StreamCreateFile(false,path, 0,0,0);
	BASS_ChannelPlay(stream2, false);
}

void playMusic(const char* path) {
	 // BASS_SetVolume(1);
    stream=BASS_StreamCreateFile(false,path , 0, 0, BASS_SAMPLE_LOOP);
    BASS_ChannelPlay(stream, false);
	// system("pause");
}

void stopMusic() {
	BASS_ChannelFree(stream);
}

void freeMusic() {
	BASS_StreamFree(stream);
}

void bassFree() {
	BASS_Free();
}

char* read(const char* filename){
    FILE* f = fopen(filename, "rb");
    if (f == NULL){
        printf("file %s is not found or missing!", filename);
		exit(1);
    }
    fseek(f, 0L, SEEK_END);
    long size = ftell(f)+1;
    fclose(f);
    f = fopen(filename, "r");
    void* content = memset(malloc(size), '\0', size);
    fread(content, 1, size-1, f);
    fclose(f);
    return (char*) content;
}

void friends() {
	system("cls");
	
	int input = 0;
	// char* pmessage = NULL;
		
	printf("date: %s, %d health: %d money: %d\n\n%s\n", months[turns], year, health, money, read(FRIENDSMENNU));
		
	scanf("%i", &input);
	
	if (input == 1) {
		if (isMary == false) {
			system("cls");
			printf("%s\n", read(MARY[4]));
			// system("pause");
			getchar();
			getchar();
		} else {
			int r = randomizetimer(5);
			if (r == 4) {
				isMary = false;
			}
			system("cls");
			printf("%s\n", read(MARY[r]));
			// system("pause");
			getchar();
			getchar();
		}
	} else if (input == 2) {
		if (isJoe == false) {
			system("cls");
			printf("%s\n", read(JOE[4]));
			getchar();
			getchar();
		} else {
			int r = randomizetimer(5);
			if (r == 4) {
				isJoe = false;
			}
			system("cls");
			printf("%s\n", read(JOE[r]));
			getchar();
			getchar();
		}
	} else if (input == 3) {
		if (isFelix == false) {
			system("cls");
			printf("%s\n", read(FELIX[4]));
			getchar();
			getchar();
		} else {
			int r = randomizetimer(5);
			if (r == 4) {
				isFelix = false;
			}
			system("cls");
			printf("%s\n", read(FELIX[r]));
			getchar();
			getchar();
		}
	} else if (input == 4) {
		system("cls");
		printf("%s\n", read(SCHOOL1));
		getchar();
		getchar();
	} else if (input == 5) {
		system("cls");
		printf("%s\n", read(FAMILY1));
		getchar();
		getchar();
	} else {
		printf("\n%s", "INVALID INPUT!");
		Sleep(5000);
	}
		
		
	

}

void drugs() {
    int index = randomizetimer(5);  // Get random index 0-4
    system("cls");
    printf("%s\n", read(DRUGS[index]));  // Display the scenario text
    
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
    getchar();
    getchar();
}

void shoplist() {
    int index = randomizetimer(5);
    system("cls");
    printf("%s\n", read(SHOP[index]));
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
    getchar();
    getchar();
}

void car() {
    int index = randomizetimer(5);
    system("cls");
    printf("%s\n", read(CAR[index]));
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
    getchar();
    getchar();
}

void burglury() {
    int index = randomizetimer(5);
    system("cls");
    printf("%s\n", read(BURGLUR[index]));
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
    getchar();
    getchar();
}

void getmoney() {
    system("cls");
    int input = 0;
    printf("date: %s, %d health: %d money: %d\n\n%s\n", months[turns], year, health, money, read(MONEYMENU));
    scanf("%i", &input);
    
    if (input == 1) {
        shoplist();
    } else if (input == 2) {
        car();
    } else if (input == 3) {
        burglury();
    }
}

void rehab() {
    if (money < 2800) {
        system("cls");
        printf("\nYOU DON'T HAVE ENOUGH MONEY FOR REHAB...\nIT COSTS 2800 AND YOU ONLY HAVE %d\n", money);
        getchar();
        getchar();
        return;
    }
    
    money -= 2800;  // Pay for rehab
    
    for(int i = 0; i < 6; i++) {
        system("cls");
        printf("%s\n", read(REHAB[i]));
        getchar();
        getchar();
    }
    
    // Improve health after completing rehab
    health += 65;
    if (health > 100) {
        health = 100;
    }
}

void mirror() {
    system("cls");
    if (health >= 90) {
        printf("%s\n", read(MIRROR[0]));
    } else if (health >= 80) {
        printf("%s\n", read(MIRROR[1]));
    } else if (health >= 70) {
        printf("%s\n", read(MIRROR[2]));
    } else if (health >= 60) {
        printf("%s\n", read(MIRROR[3]));
    } else if (health >= 50) {
        printf("%s\n", read(MIRROR[4]));
    } else if (health >= 40) {
        printf("%s\n", read(MIRROR[5]));
    } else if (health >= 30) {
        printf("%s\n", read(MIRROR[6]));
    } else if (health >= 20) {
        printf("%s\n", read(MIRROR[7]));
    } else if (health >= 10) {
        printf("%s\n", read(MIRROR[8]));
    } else {
        printf("%s\n", read(MIRROR[9]));
    }
    
    // Check if health is low enough to enable suicide option
    if (health < 35) {
        isSuicide = true;
    }
    
    getchar();
    getchar();
}

void suicide() {
    system("cls");
    printf("%s\n", read(OVER));
    getchar();
    getchar();
    isOver = true;
}

int main() {
    // Initialize BASS
    if (!BASS_Init(-1, 44100, 0, 0, NULL)) {
        printf("Error initializing BASS library: %d\n", BASS_ErrorGetCode());
        return 1;
    }
	srand((unsigned int) time(NULL));
	printf("%s\n", read(DESC1));
	system("pause");
	system("cls");
	playMusic(SONGSRAND[randomizetimer(12)]);
	printf("%s\n", read(OPENBANNER1));
	system("pause");
	system("cls");
	printf("%s\n", read(OPENINGPOINT1));
	system("pause");
	system("cls");
	
	while (health > 0 && isOver == false) {
		system("cls");
		int input = 0;
		char* pmessage = NULL;
		if (turns > 11) {
			turns = 0;
			year++;
		}
		if (money < 0) {
			money = 0;
		}
		printf("date: %s, %d health: %d money: %d\n\n%s\n", months[turns], year, health, money, read(MENU));
		if (isSuicide == true) {
			printf("%s\n", "PRESS 8 TO TRY AND SUICIDE");
		}
		scanf("%i", &input);
		
		if (input == 1) {
			stopMusic();
			freeMusic();
			playMusic(SONGSRAND[randomizetimer(12)]);
		} else if (input == 7) {
			isOver = true;
		} else if (input == 2) {
			friends();
		} else if (input == 3) {
			drugs();
		} else if (input == 4) {
			getmoney();
		} else if (input == 5) {
			rehab();
		} else if (input == 6) {
			mirror();
		} else if (input == 8 && isSuicide == true) {
			suicide();
		}
		
		
		
		
		turns++;
	}
	
	// Show the ending
    system("cls");
    printf("%s\n", read(THEEND));
    system("pause");
	
	 // Free BASS resources
    stopMusic();
	freeMusic();
	
	return 0;
}