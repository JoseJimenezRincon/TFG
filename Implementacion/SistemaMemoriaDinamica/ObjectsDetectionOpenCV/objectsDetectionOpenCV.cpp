/*
 * objectsDetectionOpenCV.cpp
 *
 *  Created on: 29 may. 2017
 *      Author: jose
 */

#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace cv;
using namespace std;

int objectsDetectionOpenCV(const char * scenario_img,const char * scenarioObjects_img){

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
			if(substract.at<uchar>(x,y) > 55){
				substract.at<uchar>(x,y) = 255;
			}else{
				substract.at<uchar>(x,y) = 0;
			}
		}
	}

	Mat element = getStructuringElement(MORPH_RECT, Size(200, 200) ); //MORPH_ELLIPSE //MORPH_CROSS
	dilate(substract, dilated, element);

	std::ofstream output("map.txt");

	for (x = 0; x < substract.rows; x++) {
		for (y=0; y < substract.cols; y++) {
			//printf("%d",substract.at<uchar>(x,y));
			if(dilated.at<uchar>(x,y) == 0){
				output<<0;
			}else{
				output<<1;
			}
		}
		//printf("\n");
		output<<endl;
	}

	namedWindow("Scenario", CV_WINDOW_NORMAL);
	imshow("Scenario", scenario);
	namedWindow("Scenario Objects", CV_WINDOW_NORMAL);
	imshow("Scenario Objects", scenarioObjects);
	namedWindow("Subtract", CV_WINDOW_NORMAL);
	imshow("Subtract", substract);
	namedWindow("Dilated", CV_WINDOW_NORMAL);
	imshow("Dilated", dilated);

	waitKey(0);

	return 0;
}






