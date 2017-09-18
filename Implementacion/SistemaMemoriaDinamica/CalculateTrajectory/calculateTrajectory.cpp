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
#include "aStar.h"
#include "../MonitoringResults/monitoringResults.h"


using namespace std;

int calculateTrajectory() {

	//Espera a que se presione una tecla
	srand(time(NULL));

	/* MAIN AESTRELLA */

	FILE *file = fopen("vehicle.txt","r");
	char line[16];


	int xA, yA, xB, yB;

	fgets(line, sizeof(line), file);
	sscanf(line, "[%d,%d]", &xA, &yA);


	//	randomly select start and finish locations
	//switch(rand()%8){
	switch(7){
	case 0: xB=MAP_WIDTH-1;yB=MAP_HEIGHT-1; break;
	case 1: xB=MAP_WIDTH-1;yB=0; break;
	case 2: xB=MAP_WIDTH/2+1;yB=MAP_HEIGHT/2+1; break;
	case 3: xB=MAP_WIDTH/2+1;yB=MAP_HEIGHT/2-1; break;
	case 4: xB=MAP_WIDTH/2+1;yB=MAP_HEIGHT-1; break;
	case 5: xB=MAP_WIDTH/2-1;yB=0; break;
	case 6: xB=MAP_WIDTH-1;yB=MAP_HEIGHT/2+1; break;
	case 7: xB=0;yB=MAP_HEIGHT/2-1; break;
	}


	cout<<"Map Size (X,Y): "<<MAP_WIDTH<<","<<MAP_HEIGHT<<endl;
	cout<<"Start: "<<xA<<","<<yA<<endl;
	cout<<"Finish: "<<xB<<","<<yB<<endl;

	string route = pathFind(xA, yA, xB, yB);
	imprimirMatriz( route, xA, yA);

	return 0;
}





