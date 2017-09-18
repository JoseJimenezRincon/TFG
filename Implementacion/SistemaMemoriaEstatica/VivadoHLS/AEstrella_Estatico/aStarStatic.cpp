/*
 * aStarStatic.cpp
 *
 *  Created on: 12 jun. 2017
 *      Author: jose
 */

#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <ctime>

#define HORIZONTAL 60
#define VERTICAL 34

using namespace std;

typedef struct{
	int coordinates[2]; //coordinates
	int father; //position
	int cost; //value
	int heuristic; //value
	int costPlusHeuristic; //value
	int visited; // 1 true, 0 false
}Nodes;

static int map[HORIZONTAL][VERTICAL];
static Nodes node[HORIZONTAL*VERTICAL];
static int adjacentPosition[8][3];
static int openNodes[HORIZONTAL*VERTICAL]; // Open = 0 || Close = 1

void initNodes(int horizontal, int vertical){
	int size = horizontal*vertical;
	int x=0;
	int y=0;

	for (int i = 0; i < size; i++) {
		openNodes[i]=1;//Initialize openNodes

		x=i%horizontal;
		if (x==0 && i!=0) y++;

		if(map[x][y]!=1){
			node[i].coordinates[0]=x;
			node[i].coordinates[1]=y;
			node[i].visited=0;
		}else{
			node[i].visited=1;
		}
	}
}

void calculateFather(int position, int xFather, int yFather){
	int positionFather = xFather+(yFather*HORIZONTAL);
	node[position].father= positionFather;
}

void openNode(int position){
	openNodes[position]=0;
}

void closeNode(int position){
	openNodes[position]=1;
	node[position].visited=1;
}

void adjacentNodes(int x, int y){
	int initPosition = x+(y*HORIZONTAL);
	//Left
	adjacentPosition[0][2] = initPosition-1; //Position
	//Right
	adjacentPosition[1][2] = initPosition+1; //Position
	//Top
	adjacentPosition[2][2]= initPosition-HORIZONTAL; //Position
	//Bot
	adjacentPosition[3][2] = initPosition+HORIZONTAL; //Position
	//Upper Left Diagonal
	adjacentPosition[4][2]= initPosition-HORIZONTAL-1; //Position
	//Upper Right Diagonal
	adjacentPosition[5][2] = initPosition-HORIZONTAL+1; //Position
	//Bottom Left Diagonal
	adjacentPosition[6][2] = initPosition+HORIZONTAL-1; //Position
	//Bottom Right Diagonal
	adjacentPosition[7][2] = initPosition+HORIZONTAL+1; //Position

	//if nodes are not adjacent set -1 on position.
	if(x==0){
		//Left
		adjacentPosition[0][2] = -1; //NotAdjacent
		//Right
		adjacentPosition[1][0] = x+1; //X
		//Top
		adjacentPosition[2][0] = x; //X
		//Bot
		adjacentPosition[3][0] = x; //X
		//Upper Left Diagonal
		adjacentPosition[4][2]= -1; //Not adjacent
		//Upper Right Diagonal
		adjacentPosition[5][0] = x+1; //X
		//Bottom Left Diagonal
		adjacentPosition[6][2] = -1; //Not adjacent
		//Bottom Right Diagonal
		adjacentPosition[7][0] = x+1; //X
	}else if(x==HORIZONTAL-1){
		//Left
		adjacentPosition[0][0] = x-1; //X
		//Right
		adjacentPosition[1][2] = -1; //NotAdjacent
		//Top
		adjacentPosition[2][0] = x; //X
		//Bot
		adjacentPosition[3][0] = x; //X
		//Upper Left Diagonal
		adjacentPosition[4][0]= x-1; //X
		//Upper Right Diagonal
		adjacentPosition[5][2] = -1; //Not Adjacent
		//Bottom Left Diagonal
		adjacentPosition[6][0] = x-1; //X
		//Bottom Right Diagonal
		adjacentPosition[7][2] = -1; //NotAdjacent
	}else{
		//Left
		adjacentPosition[0][0] = x-1; //X
		//Right
		adjacentPosition[1][0] = x+1; //X
		//Top
		adjacentPosition[2][0] = x; //X
		//Bot
		adjacentPosition[3][0] = x; //X
		//Upper Left Diagonal
		adjacentPosition[4][0] = x-1; //X
		//Upper Right Diagonal
		adjacentPosition[5][0] = x+1; //X
		//Bottom Left Diagonal
		adjacentPosition[6][0] = x-1; //X
		//Bottom Right Diagonal
		adjacentPosition[7][0] = x+1; //X
	}

	if(y==0){
		//Left
		adjacentPosition[0][1] = y; //Y
		//Right
		adjacentPosition[1][1] = y; //Y
		//Top
		adjacentPosition[2][2]= -1; //NotAdjacent
		//Bot
		adjacentPosition[3][1] = y+1; //Y
		//Upper Left Diagonal
		adjacentPosition[4][2]= -1; //NotAdjacent
		//Upper Right Diagonal
		adjacentPosition[5][2] = -1; //NotAdjacent
		//Bottom Left Diagonal
		adjacentPosition[6][1] = y+1; //Y
		//Bottom Right Diagonal
		adjacentPosition[7][1] = y+1; //Y
	}else if(y==VERTICAL-1 ){
		//Left
		adjacentPosition[0][1] = y; //Y
		//Right
		adjacentPosition[1][1] = y; //Y
		//Top
		adjacentPosition[2][1]= y-1; //Y
		//Bot
		adjacentPosition[3][2] = -1; //NotAdjacent
		//Upper Left Diagonal
		adjacentPosition[4][1]= y-1; //Y
		//Upper Right Diagonal
		adjacentPosition[5][1] = y-1; //Y
		//Bottom Left Diagonal
		adjacentPosition[6][2] = -1; //NotAdjacent
		//Bottom Right Diagonal
		adjacentPosition[7][2] = -1; //NotAdjacent
	}else{
		//Left
		adjacentPosition[0][1] = y; //Y
		//Right
		adjacentPosition[1][1] = y; //Y
		//Top
		adjacentPosition[2][1] = y-1; //Y
		//Bot
		adjacentPosition[3][1] = y+1; //Y
		//Upper Left Diagonal
		adjacentPosition[4][1] = y-1; //Y
		//Upper Right Diagonal
		adjacentPosition[5][1] = y-1; //Y
		//Bottom Left Diagonal
		adjacentPosition[6][1] = y+1; //Y
		//Bottom Right Diagonal
		adjacentPosition[7][1] = y+1; //Y
	}

}

int calculateBestOption(){
	int bestOption = 2147483647;
	int positionBestOption;

	for (int i = 0; i < (HORIZONTAL*VERTICAL); i++) {
		if(openNodes[i]==0){ //If it is an open node
			if( node[i].costPlusHeuristic < bestOption ){ //If is a better option...
				bestOption = node[i].costPlusHeuristic;
				positionBestOption = i;
			}
		}
	}

	return positionBestOption;
}

void manhattanHeuristic(int x, int y, int position, int xFinish, int yFinish){
	int xDistance, yDistance;
	xDistance = xFinish - x;
	yDistance= yFinish - y;

	node[position].heuristic = abs(xDistance)+abs(yDistance);
}

void calculateCost(int i, int position){
	if(i<4){
		node[position].cost = node[node[position].father].cost + 10; //Orthogonal
	}else{
		node[position].cost += node[node[position].father].cost + 14; //Diagonal
	}
}

void costPlusHeuristic(int position){
	node[position].costPlusHeuristic = node[position].cost + (node[position].heuristic)*10;
}

int aStar(int xStart, int yStart, int xFinish, int yFinish){

	//Initializes coordinates and sets to closed if the node is an obstacle.
	initNodes(HORIZONTAL,VERTICAL);

	//Starts the initial node search
	int position = xStart+(yStart*HORIZONTAL);
 	node[position].father=-1;
	node[position].cost=0;
 	node[position].heuristic=0;
	node[position].costPlusHeuristic=0;
	node[position].visited=1;

	//Compute adjacent nodes of the initial node
	adjacentNodes(xStart, yStart);

	//Insert Node information like... FatherPosition, cost and heuristic.
	for (int i = 0; i < 8; i++) {
		if(node[adjacentPosition[i][2]].visited==0 && adjacentPosition[i][2]!=-1 ){
			openNode(adjacentPosition[i][2]); //Add node to list of open nodes.
			calculateFather(adjacentPosition[i][2], xStart, yStart);//Set position of father to adjacent node
			manhattanHeuristic(adjacentPosition[i][0], adjacentPosition[i][1], adjacentPosition[i][2], xFinish, yFinish);
			calculateCost(i, adjacentPosition[i][2]);//Set cost of movement to adjacent node
			costPlusHeuristic(adjacentPosition[i][2]);//Cost plus heuristic
		}
	}

	//Calculate position of best option from adjacent nodes.
	position = calculateBestOption();
	//Close node of best position.
	closeNode(position);

	//Calculate final position
	int finalPosition = xFinish+(yFinish*HORIZONTAL);

	//Recursive pathfinding
	do{
		adjacentNodes(node[position].coordinates[0], node[position].coordinates[1]);
		for (int i = 0; i < 8; i++) {
			if(node[adjacentPosition[i][2]].visited==0 && adjacentPosition[i][2]!=-1){
				openNode(adjacentPosition[i][2]); //Add node to list of open nodes.
				calculateFather(adjacentPosition[i][2], node[position].coordinates[0], node[position].coordinates[1]);//Set position of father to adjacent node
				manhattanHeuristic(adjacentPosition[i][0], adjacentPosition[i][1], adjacentPosition[i][2], xFinish, yFinish);
				calculateCost(i, adjacentPosition[i][2]);//Set cost of movement to adjacent node
				costPlusHeuristic(adjacentPosition[i][2]);//Cost plus heuristic
			}else{
				//If node is closed or if position is outside map, break. if(node[adjacentPosition[i][2]].closed == 1)
			}
		}
		//Calculate position of best option from adjacent nodes.
		position = calculateBestOption();
		//Close node of best position.
		closeNode(position);
	}while(position!=finalPosition);


	while(node[position].father!=-1){
		map[node[position].coordinates[0]][node[position].coordinates[1]]=2;
		position=node[position].father;
	}

	map[xFinish][yFinish]=4;

	return 0;
}

int main()
{
	srand(time(NULL));

	for (int x = 0; x < HORIZONTAL; x++) {
		for (int y = 0; y < VERTICAL; y++) {
			map[x][y]=0;
		}
	}

	// fillout the map matrix with a '+' pattern
	for(int x=HORIZONTAL/8;x<HORIZONTAL*7/8;x++)
	{
		map[x][VERTICAL/2]=1;
	}
	for(int y=VERTICAL/8;y<VERTICAL*7/8;y++)
	{
		map[HORIZONTAL/2][y]=1;
	}

	// randomly select start and finish locations
	int xStart, yStart, xFinish, yFinish;
	//switch(rand()%8)
	switch(7)
	{
	case 0: xStart=0;yStart=0;xFinish=HORIZONTAL-1;yFinish=VERTICAL-1; break;
	case 1: xStart=0;yStart=VERTICAL-1;xFinish=HORIZONTAL-1;yFinish=0; break;
	case 2: xStart=HORIZONTAL/2-1;yStart=VERTICAL/2-1;xFinish=HORIZONTAL/2+1;yFinish=VERTICAL/2+1; break;
	case 3: xStart=HORIZONTAL/2-1;yStart=VERTICAL/2+1;xFinish=HORIZONTAL/2+1;yFinish=VERTICAL/2-1; break;
	case 4: xStart=HORIZONTAL/2-1;yStart=0;xFinish=HORIZONTAL/2+1;yFinish=VERTICAL-1; break;
	case 5: xStart=HORIZONTAL/2+1;yStart=VERTICAL-1;xFinish=HORIZONTAL/2-1;yFinish=0; break;
	case 6: xStart=0;yStart=VERTICAL/2-1;xFinish=HORIZONTAL-1;yFinish=VERTICAL/2+1; break;
	case 7: xStart=HORIZONTAL-1;yStart=VERTICAL/2+1;xFinish=0;yFinish=VERTICAL/2-1; break;
	}

	map[xStart][yStart]=3;
	map[xFinish][yFinish]=4;

	cout<<"Map Size (X,Y): "<<HORIZONTAL<<","<<VERTICAL<<endl;
	cout<<"Start: "<<xStart<<","<<yStart<<endl;
	cout<<"Finish: "<<xFinish<<","<<yFinish<<endl;
	clock_t start = clock();
	aStar(xStart, yStart, xFinish, yFinish);
	clock_t end = clock();
	double time_elapsed = double(end - start);
	cout<<"Time to calculate the route (ms): "<<time_elapsed<<endl;

	int x=0;
	int y=0;

	for (int i = 0; i < HORIZONTAL*VERTICAL; i++) {
		x=i%HORIZONTAL;
		if (x==0 && i!=0) {
			y++;
			cout<<endl;
		}
		cout<<map[x][y];
	}

	return(0);
}


