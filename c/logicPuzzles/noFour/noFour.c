#include <stdio.h>
#include <stdlib.h>

int w;
int h;
char* data;

char* getData(FILE* file) {
	char* buffer = malloc(36 * 36); //max possible board size
	int r = fgetc(file);
	w = 0;
	while(r != '\n') {
		buffer[w] = r;
		r = fgetc(file);
		w++;
	}
	h++;
	int i = w;
	r = fgetc(file);
	while(r != EOF && r != '$') {
		if(r == '\n') {
			h++;
		} else {
			buffer[i] = r;
			i++;
		}
		r = fgetc(file);
	}
	return realloc(buffer, w * h);
}

void draw() {
	printf("\n");
	for(int i = 0; i < w * h; i++) {
		if(i % w == 0 && i != 0) {
			printf("\n\n");
		}
		if(data[i] == 'x') {
			printf(" >< ");
		} else if(data[i]== 'o') {
			printf(" () ");
		} else if(data[i] == '#') {
			printf(" ## ");
		} else {
			printf(" -- ");
		}
	}
	printf("\n\n");
	return;
}

int value(char c) {
	if(c == 'o') {
		return 1;
	} else if(c == 'x') {
		return -1;
	} else {
		return 0;
	}
}

char add(int x1, int y1, int x2, int y2, int x3, int y3) {
	if(x1 < 0 || y1 < 0 || x3 >= h || y3 >= h) {
		return '-';
	}
	int v = value(data[y1 * w + x1]) + value(data[y2 * w + x2]) + value(data[y3 * w + x3]);
	if(v >= 3) {
		return 'x';
	}
	if (v <= -3) {
		return 'o';
	}	
	return '-';
}

char search(int x, int y) { //there is proboly a better way to do this but im stupid
	char c;
	if(                           (c = add(x - 3, y + 0, x - 2, y + 0, x - 1, y + 0)) != '-') { printf("left far"); return c; } //left far
	if(                           (c = add(x - 2, y + 0, x - 1, y + 0, x + 1, y + 0)) != '-') { printf("left close"); return c; } //left close
	if(                           (c = add(x + 1, y + 0, x + 2, y + 0, x + 3, y + 0)) != '-') { printf("right far"); return c; } //right far
	if(                           (c = add(x - 1, y + 0, x + 1, y + 0, x + 2, y + 0)) != '-') { printf("right close"); return c; } //right close
	if(                           (c = add(x + 0, y - 3, x + 0, y - 2, x + 0, y - 1)) != '-') { printf("up far"); return c; } //up far
	if(                           (c = add(x + 0, y - 2, x + 0, y - 1, x + 0, y + 1)) != '-') { printf("up close"); return c; } //up close
	if(                           (c = add(x + 0, y + 1, x + 0, y + 2, x + 0, y + 3)) != '-') { printf("down far"); return c; } //down far
	if(                           (c = add(x + 0, y - 1, x + 0, y + 1, x + 0, y + 2)) != '-') { printf("down close"); return c; } //down close
	if(                           (c = add(x - 3, y - 3, x - 2, y - 2, x - 1, y - 1)) != '-') { printf("up left far"); return c; } //up left far
	if(                           (c = add(x - 2, y - 2, x - 1, y - 1, x + 1, y + 1)) != '-') { printf("up left close"); return c; } //up left close
	if(                           (c = add(x + 1, y + 1, x + 2, y + 2, x + 3, y + 3)) != '-') { printf("down right far"); return c; } //down right far
	if(                           (c = add(x - 1, y - 1, x + 1, y + 1, x + 2, y + 2)) != '-') { printf("down right close"); return c; } //down right close
	if(x + 3 < w &&               (c = add(x + 3, y - 3, x + 2, y - 2, x + 1, y - 1)) != '-') { printf("up right far"); return c; } //up right far
	if(x + 2 < w && x - 1 >= 0 && (c = add(x + 2, y - 2, x + 1, y - 1, x - 1, y + 1)) != '-') { printf("up right close"); return c; } //up right close
	if(y + 3 < h &&               (c = add(x - 3, y + 3, x - 2, y + 2, x - 1, y + 1)) != '-') { printf("down left far"); return c; } //down left far
	if(y + 2 < h && y - 1 >= 0 && (c = add(x - 2, y + 2, x - 1, y + 1, x + 1, y - 1)) != '-') { printf("down left close"); return c; } //down left close
	return '-';
}

int process() {
	int done = 0;
	for(int y = 0; y < h; y++) {
		for(int x = 0; x < w; x++) {
			if(data[y * w + x] == '-' || data[y * w + x] == ' ') {
				done = 1;
				data[y * w + x] = search(x, y);
				printf("----------------\n");
				draw();
			}
		}
	}
	return done;
}

int main(int argc, char** argv) {
	
	char* fileName = "./data.txt";
	if(argc > 1) {
		fileName = argv[1];
	}
	FILE* file = fopen(fileName, "r");
	data = getData(file);
	draw();
	process();
	printf("%d\n", w);
	return 0;
}
