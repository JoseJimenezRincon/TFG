/*
 * aStarStatic.cpp
 *
 *  Created on: 12 jun. 2017
 *      Author: jose
 */
#include "aStarStatic.h"

void initNodes(int horizontal, int vertical, int map[HORIZONTAL][VERTICAL]){
	int size = horizontal*vertical;
	int x=0;
	int y=0;

	ForinitNodes:for (int i = 0; i < size; i++) {
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

	FORcalculateBestOption:for (int i = 0; i < (HORIZONTAL*VERTICAL); i++) {
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

int aStar(int xStart, int yStart, int xFinish, int yFinish, int map[HORIZONTAL][VERTICAL]){

	//Initializes coordinates and sets to closed if the node is an obstacle.
	initNodes(HORIZONTAL,VERTICAL, map);

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
	FOR1:for (int i = 0; i < 8; i++) {
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
		FOR2:for (int i = 0; i < 8; i++) {
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



