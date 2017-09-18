/*
 * aStar.cpp
 *
 *  Created on: 24 may. 2017
 *      Author: jose
 */


// AstarMODIFICADO
// http://en.wikipedia.org/wiki/A*
// Compiler: Dev-C++ 4.9.9.2

#include <iostream>
#include <iomanip>
#include <queue>
#include <string>
#include <math.h>
#include <ctime>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include "../SETTINGS.h"

const int n=MAP_WIDTH; // horizontal size of the map
const int m=MAP_HEIGHT; // vertical size size of the map
static int map[n][m];
static int closed_nodes_map[n][m]; // map of closed (tried-out) nodes
static int open_nodes_map[n][m]; // map of open (not-yet-tried) nodes
static int dir_map[n][m]; // map of directions
const int dir = 8;
// if dir==4
//static int dx[dir]={1, 0, -1, 0};
//static int dy[dir]={0, 1, 0, -1};
// if dir==8
static int dx[dir]={1, 1, 0, -1, -1, -1, 0, 1};
static int dy[dir]={0, 1, 1, 1, 0, -1, -1, -1};



//Clase NODO
class node
{
	// current position
	int xPos;
	int yPos;
	// total distance already travelled to reach the node
	int level;
	// priority=level+remaining distance estimate
	int priority;  // smaller: higher priority

public:
	node(int xp, int yp, int d, int p)
{xPos=xp; yPos=yp; level=d; priority=p;}

	int getxPos() const {return xPos;}
	int getyPos() const {return yPos;}
	int getLevel() const {return level;}
	int getPriority() const {return priority;}

	void updatePriority(const int & xDest, const int & yDest)
	{
		priority=level+estimate(xDest, yDest)*10; //A*
	}

	// give better priority to going strait instead of diagonally
	void nextLevel(const int & i) // i: direction
	{
		level+=(dir==8?(i%2==0?10:14):10);
	}

	// Estimation function for the remaining distance to the goal.
	const int & estimate(const int & xDest, const int & yDest) const
	{
		static int xd, yd, d;
		xd=xDest-xPos;
		yd=yDest-yPos;

		// Euclidian Distance
		//d=static_cast<int>(sqrt(xd*xd+yd*yd));

		// Manhattan distance
		d=abs(xd)+abs(yd);

		// Chebyshev distance
		//d=max(abs(xd), abs(yd));

		return(d);
	}
};

// Determine priority (in the priority queue)
bool operator<(const node & a, const node & b)
{
	return a.getPriority() > b.getPriority();
}

// A-star algorithm.
// The route returned is a string of direction digits.
std::string pathFind(const int & xStart, const int & yStart,
		const int & xFinish, const int & yFinish)
{


	static std::priority_queue<node> pq[2]; // list of open (not-yet-tried) nodes
	static int pqi; // pq index
	static node* n0;
	static node* m0;
	static int i, j, x, y, xdx, ydy;
	static char c;
	pqi=0;


	// reset the node maps
	for(y=0;y<m;y++)
	{
		for(x=0;x<n;x++)
		{
			map[x][y]=0;
			closed_nodes_map[x][y]=0;
			open_nodes_map[x][y]=0;
		}
	}

	std::ifstream in("map.txt");
	char number;
	for(int y = 0; y < m; y++){
		for(int x = 0; x < n; x++){
			//if ( number == '\n' || number == '\r' ) continue;
			in >> number;
			if (number == 49){
				map[x][y] = 1;
			}else{
				map[x][y] = 0;

			}
		}
	}
	in.close();

	// create the start node and push into list of open nodes
	n0=new node(xStart, yStart, 0, 0);
	n0->updatePriority(xFinish, yFinish);
	pq[pqi].push(*n0);
	open_nodes_map[x][y]=n0->getPriority(); // mark it on the open nodes map

	// A* search
	while(!pq[pqi].empty())
	{
		// get the current node w/ the highest priority
		// from the list of open nodes
		n0=new node( pq[pqi].top().getxPos(), pq[pqi].top().getyPos(),
				pq[pqi].top().getLevel(), pq[pqi].top().getPriority());

		x=n0->getxPos(); y=n0->getyPos();

		pq[pqi].pop(); // remove the node from the open list
		open_nodes_map[x][y]=0;
		// mark it on the closed nodes map
		closed_nodes_map[x][y]=1;

		// quit searching when the goal state is reached
		//if((*n0).estimate(xFinish, yFinish) == 0)
		if(x==xFinish && y==yFinish)
		{
			// generate the path from finish to start
			// by following the directions
			std::string path="";
			while(!(x==xStart && y==yStart))
			{
				j=dir_map[x][y];
				c='0'+(j+dir/2)%dir;
				path=c+path;
				x+=dx[j];
				y+=dy[j];
			}

			// garbage collection
			delete n0;
			// empty the leftover nodes
			while(!pq[pqi].empty()) pq[pqi].pop();
			return path;
		}

		// generate moves (child nodes) in all possible directions
		for(i=0;i<dir;i++)
		{
			xdx=x+dx[i]; ydy=y+dy[i];

			if(!(xdx<0 || xdx>n-1 || ydy<0 || ydy>m-1 || map[xdx][ydy]==1
					|| closed_nodes_map[xdx][ydy]==1))
			{
				// generate a child node
				m0=new node( xdx, ydy, n0->getLevel(),
						n0->getPriority());
				m0->nextLevel(i);
				m0->updatePriority(xFinish, yFinish);

				// if it is not in the open list then add into that
				if(open_nodes_map[xdx][ydy]==0)
				{
					open_nodes_map[xdx][ydy]=m0->getPriority();
					pq[pqi].push(*m0);
					// mark its parent node direction
					dir_map[xdx][ydy]=(i+dir/2)%dir;
				}
				else if(open_nodes_map[xdx][ydy]>m0->getPriority())
				{
					// update the priority info
					open_nodes_map[xdx][ydy]=m0->getPriority();
					// update the parent direction info
					dir_map[xdx][ydy]=(i+dir/2)%dir;

					// replace the node
					// by emptying one pq to the other one
					// except the node to be replaced will be ignored
					// and the new node will be pushed in instead
					while(!(pq[pqi].top().getxPos()==xdx &&
							pq[pqi].top().getyPos()==ydy))
					{
						pq[1-pqi].push(pq[pqi].top());
						pq[pqi].pop();
					}
					pq[pqi].pop(); // remove the wanted node

					// empty the larger size pq to the smaller one
					if(pq[pqi].size()>pq[1-pqi].size()) pqi=1-pqi;
					while(!pq[pqi].empty())
					{
						pq[1-pqi].push(pq[pqi].top());
						pq[pqi].pop();
					}
					pqi=1-pqi;
					pq[pqi].push(*m0); // add the better node instead
				}
				else delete m0; // garbage collection
			}
		}
		delete n0; // garbage collection
	}
	return ""; // no route found
}

void imprimirMatriz(std::string route, const int & xA, const int & yA){
	std::ofstream outputTrj("trajectory.txt");

	// follow the route on the map and display it
	if(route.length()>0){
		int j; char c;
		int x=xA;
		int y=yA;
		map[x][y]=2;
		for(int i=0;i<route.length();i++)
		{
			c =route.at(i);
			j=atoi(&c);
			x=x+dx[j];
			y=y+dy[j];
			map[x][y]=3;
			outputTrj <<"X: "<<x<<" Y: "<<y<<std::endl;
		}
		map[x][y]=4;

		outputTrj.close();
		std::ofstream output("path.txt");
		// display the map with the route
		for(int y=0;y<MAP_HEIGHT;y++){
			for(int x=0;x<MAP_WIDTH;x++){
				if(map[x][y]==0){
					output << 0;
				}else if(map[x][y]==1){
					output << 1;
				}else if(map[x][y]==2){ //S
					output << 2;
				}else if(map[x][y]==3){ //R
					output << 3;
				}else if(map[x][y]==4){ //F
					output << 4;
				}
			}
			output<<std::endl;
		}
		output.close();
	}

}




