#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <sys/types.h>
#include <dirent.h>

#define MINIAUDIO_IMPLEMENTATION
#define MA_ENABLE_MP3
#include "miniaudio.h"

int repeat = 0;
int shuffle = 0;

int dir(char* name) {
	struct stat path_stat;
	if(stat(name, &path_stat) != 0) {
		printf("\"%s\" is not a valid directory or file\n", name);
		exit(-3);
	}
	if(S_ISREG(path_stat.st_mode)) {
		return 0;
	} else {
		return 1;
	}	
}

char** parseDir(char* name) {
	DIR* dir = opendir(name);
	if(dir == NULL) {
		printf("could not open directory\n");
		exit(-4);
	}
}

char** parseIn(int argc, char** argv) {
	char** out = NULL;
	for(int i = 1; i < argc; i++) {
		if(strcmp(argv[i], "-s") == 0) {
			shuffle = true;
		} else if(strcmp(argv[i], "-r") == 0) {
			repeat = 1;
		} else {
			if(dir(argv[i]) == 0) {
				out = &argv[i];
			} else {
				out = paseDir(argv[i]);
			}
		}
	}
	printf("shuffle: %d repeat %d\n", shuffle, repeat);
	return out;
}

int main(int argc, char** argv) {
	parseIn(argc, argv);
	return 0;

	ma_engine engine;
	if(ma_engine_init(NULL, &engine) != MA_SUCCESS) {
		printf("failed to initalize engine\n");
		return -1;
	}

	ma_engine_play_sound(&engine, "rickRoll.MP3", NULL);
	
	printf("press enter to return");
	getchar();

	ma_engine_uninit(&engine);
	return 0;
}
