#ifndef ASTARSTATIC_H_
#define ASTARSTATIC_H_

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include "../SETTINGS.h"

using namespace std;

typedef struct{
	int coordinates[2]; //coordinates
	int father; //position
	int cost; //value
	int heuristic; //value
	int costPlusHeuristic; //value
	int visited; // 1 true, 0 false
}Nodes;

//static int map[MACROHEIGHT][MACROHEIGHT];
static Nodes node[MACROWIDTH*MACROHEIGHT];
static int adjacentPosition[8][3];
static int openNodes[MACROWIDTH*MACROHEIGHT]; // Open = 0 || Close = 1

void initNodes(int horizontal, int vertical, int map[MACROWIDTH][MACROHEIGHT]);
void calculateFather(int position, int xFather, int yFather);
void openNode(int position);
void closeNode(int position);
void adjacentNodes(int x, int y);
int calculateBestOption();
void manhattanHeuristic(int x, int y, int position, int xFinish, int yFinish);
void calculateCost(int i, int position);
void costPlusHeuristic(int position);
int aStar(int xStart, int yStart, int xFinish, int yFinish, int map[MACROWIDTH][MACROHEIGHT]);

#endif
