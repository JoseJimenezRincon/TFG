#ifndef ASTARSTATIC_H_
#define ASTARSTATIC_H_

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

using namespace std;

#define HORIZONTAL 64
#define VERTICAL 36
#define SIZE_FOR 2048

typedef struct{
	int coordinates[2]; //coordinates
	int father; //position
	int cost; //value
	int heuristic; //value
	int costPlusHeuristic; //value
	int visited; // 1 true, 0 false
}Nodes;

//static int map[HORIZONTAL][VERTICAL];
static Nodes node[HORIZONTAL*VERTICAL];
static int adjacentPosition[8][3];
static int openNodes[HORIZONTAL*VERTICAL]; // Open = 0 || Close = 1

void initNodes(int horizontal, int vertical, int map[HORIZONTAL][VERTICAL]);
void calculateFather(int position, int xFather, int yFather);
void openNode(int position);
void closeNode(int position);
void adjacentNodes(int x, int y);
int calculateBestOption();
void manhattanHeuristic(int x, int y, int position, int xFinish, int yFinish);
void calculateCost(int i, int position);
void costPlusHeuristic(int position);
int aStar(int xStart, int yStart, int xFinish, int yFinish, int map[HORIZONTAL][VERTICAL]);

#endif
