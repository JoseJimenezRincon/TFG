/*
 * deteccionObjetosOpenCV.cpp
 *
 *  Created on: 25 may. 2017
 *      Author: jose
 */

#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include "../SETTINGS.h"

using namespace cv;
using namespace std;

int objectsDetectionOpenCV(const char * scenario_img,const char * scenarioObjects_img){

	int macromap[MACROWIDTH][MACROHEIGHT];
	int blockWidth=MAPWIDTH/MACROWIDTH;
	int blockHeight=MAPHEIGHT/MACROHEIGHT;
	int x,y;

	// Cargamos la imagen de entrada
	Mat scenario;
	scenario = imread(scenario_img, CV_LOAD_IMAGE_GRAYSCALE);
	Mat scenarioObjects;
	scenarioObjects = imread(scenarioObjects_img, CV_LOAD_IMAGE_GRAYSCALE);
	Mat substract;
	subtract(scenario, scenarioObjects, substract);
	Mat dilated;

	for (x = 0; x < substract.rows; x++) {
		for (y=0; y < substract.cols; y++) {
			if(substract.at<uchar>(x,y) > THRESHOLD){
				substract.at<uchar>(x,y) = 255;
			}else{
				substract.at<uchar>(x,y) = 0;
			}
		}
	}

	Mat element = getStructuringElement(MORPH_RECT, Size(200, 200) ); //MORPH_ELLIPSE //MORPH_CROSS
	dilate(substract, dilated, element);

	std::ofstream output("map.txt");

	for (int y = 0; y < MACROHEIGHT; y++) {
		for (int x = 0; x < MACROWIDTH; x++) {
			macromap[x][y] = 0;
		}
	}

	for (int y_macromap = 0; y_macromap < MACROHEIGHT; y_macromap++) {
		for (int x_macromap = 0; x_macromap < MACROWIDTH; x_macromap++) {
			for (int y=0; y < blockHeight ; y++) {
				for (int x=0; x < blockWidth; x++) {
					macromap[x_macromap][y_macromap]+=(dilated.at<uchar>(blockHeight*y_macromap+y ,blockWidth*x_macromap+x)&0x0001);
				}
			}
			//output<<macromap[x_macromap][y_macromap]<<'\t';
			if(macromap[x_macromap][y_macromap] > 0){
				output<<1;
			}else{
				output<<0;
			}
		}
		output<<endl;
	}

	output.close();

	namedWindow("Scenario", CV_WINDOW_NORMAL);
	imshow("Scenario", scenario);
	namedWindow("Scenario Objects", CV_WINDOW_NORMAL);
	imshow("Scenario Objects", scenarioObjects);
	namedWindow("Subtract", CV_WINDOW_NORMAL);
	imshow("Subtract", substract);
	namedWindow("Dilated", CV_WINDOW_NORMAL);
	imshow("Dilated", dilated);
	imwrite("dilated.jpeg", dilated);


	waitKey(0);
}

//	for (int y_macromap = 0; y_macromap < MAPHEIGHT; y_macromap++) {
//		for (int x_macromap = 0; x_macromap < MAPWIDTH; x_macromap++) {
//			if(dilated.at<uchar>(x ,y)==0){
//				macromap[x_macromap/blockWidth][y_macromap/blockHeight] += 0;
//			}else{
//				macromap[x_macromap/blockWidth][y_macromap/blockHeight] += 1;
//			}
//		}
//	}
//
//	for (int x = 0; x < MACROHEIGHT ; x++) {
//		for (int y = 0; y < MACROWIDTH; y++) {
//			if(macromap[x][y] > 0){
//				output<<1;
//			}else{
//				output<<0;
//			}
//		}
//		output<<endl;
//	}
