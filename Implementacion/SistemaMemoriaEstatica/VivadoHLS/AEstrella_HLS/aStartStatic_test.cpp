
#include "aStarStatic.h"
#include <fstream>

int main () {

	int map[HORIZONTAL][VERTICAL];
	int retval=0;
	FILE *fp;

	int xStart, yStart, xFinish, yFinish;
	FILE *file = fopen("vehicle.txt","r");
	char line[16];
	fgets(line, sizeof(line), file);
	sscanf(line, "[%d,%d]", &xStart, &yStart);

	std::ifstream in("map.txt");
	char number;
	for(int y = 0; y < VERTICAL; y++){
		for(int x = 0; x < HORIZONTAL; x++){
			in >> number;
			map[x][y] = number & 0x1;
		}
	}
	in.close();

	//switch(rand()%8)
	switch(7)
	{
	case 0: xFinish=HORIZONTAL-1;yFinish=VERTICAL-1; break;
	case 1: xFinish=HORIZONTAL-1;yFinish=0; break;
	case 2: xFinish=HORIZONTAL/2+1;yFinish=VERTICAL/2+1; break;
	case 3: xFinish=HORIZONTAL/2+1;yFinish=VERTICAL/2-1; break;
	case 4: xFinish=HORIZONTAL/2+1;yFinish=VERTICAL-1; break;
	case 5: xFinish=HORIZONTAL/2-1;yFinish=0; break;
	case 6: xFinish=HORIZONTAL-1;yFinish=VERTICAL/2+1; break;
	case 7: xFinish=0;yFinish=VERTICAL/2-1; break;
	}

	map[xStart][yStart]=3;
	map[xFinish][yFinish]=4;

	// Call the function to operate on the data
	aStar(xStart, yStart, xFinish, yFinish, map);

	fp=fopen("result.dat","w");

	for (int y = 0; y < VERTICAL; y++) {
		for (int x = 0; x < HORIZONTAL; x++) {
			fprintf(fp, "%d", map[x][y]);
		}
		fprintf(fp, "\n");
	}
	fclose(fp);

	// Compare the results file with the golden results
	retval = system("diff --brief -w result.dat result.golden.dat");
	if (retval != 0) {
		printf("Test failed  !!!\n");
		retval=1;
	} else {
		printf("Test passed !\n");
	}

	// Return 0 if the test passes
	return retval;
}
