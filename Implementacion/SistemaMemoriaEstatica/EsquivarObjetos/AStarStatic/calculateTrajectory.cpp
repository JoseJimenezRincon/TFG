 /*
 * calculateTrajectory.cpp
 *
 *  Created on: 24 may. 2017
 *      Author: jose
 */

#include <iostream>
#include <string>
#include <vector>
#include <stdlib.h>
#include <fstream>
#include "../SETTINGS.h"
#include "aStarStatic.h"

using namespace std;

int calculateTrajectory() {

	int xStart, yStart, xFinish, yFinish;
	FILE *file = fopen("vehicle.txt","r");
	char line[16];
	int map[MACROWIDTH][MACROHEIGHT];


	std::ifstream in("map.txt");
	char number;
	for(int y = 0; y < MACROHEIGHT; y++){
		for(int x = 0; x < MACROWIDTH; x++){
			in >> number;
			if (number == 49){
				map[x][y] = 1;
			}else{
				map[x][y] = 0;

			}
		}
	}
	in.close();

	fgets(line, sizeof(line), file);
	sscanf(line, "[%d,%d]", &xStart, &yStart);

	//	randomly select start and finish locations
	//switch(rand()%8){
	switch(7){
	case 0: xFinish=MACROWIDTH-1;yFinish=MACROHEIGHT-1; break;
	case 1: xFinish=MACROWIDTH-1;yFinish=0; break;
	case 2: xFinish=MACROWIDTH/2+1;yFinish=MACROHEIGHT/2+1; break;
	case 3: xFinish=MACROWIDTH/2+1;yFinish=MACROHEIGHT/2-1; break;
	case 4: xFinish=MACROWIDTH/2+1;yFinish=MACROHEIGHT-1; break;
	case 5: xFinish=MACROWIDTH/2-1;yFinish=0; break;
	case 6: xFinish=MACROWIDTH-1;yFinish=MACROHEIGHT/2+1; break;
	case 7: xFinish=0;yFinish=MACROHEIGHT/2-1; break;
	case 8: xFinish=0; yFinish=0; break;
	}


	cout<<"Map Size (X,Y): "<<MACROWIDTH<<","<<MACROHEIGHT<<endl;
	cout<<"Start: "<<xStart<<","<<yStart<<endl;
	cout<<"Finish: "<<xFinish<<","<<yFinish<<endl;

	aStar(xStart, yStart, xFinish, yFinish, map);

	map[xStart][yStart]=3;
	map[xFinish][yFinish]=4;


	std::ofstream output("path.txt");
	int x=0; int y=0;
	for (int i = 0; i < MACROWIDTH*MACROHEIGHT; i++) {
		x=i%MACROWIDTH;
		if (x==0 && i!=0) {
			y++;
			cout<<endl;
			output<<endl;
		}
		cout<<map[x][y];
		output<<map[x][y];
	}
	output.close();

	return 0;
}





