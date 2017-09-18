/*
 * monitoringResults.cpp
 *
 *  Created on: 29 may. 2017
 *      Author: jose
 */

#include <fstream>
#include <opencv2/opencv.hpp>
#include "../SETTINGS.h"

using namespace cv;
using namespace std;

int monitoringResults(){

	string pixel;
	Mat output(MAP_HEIGHT,MAP_WIDTH, CV_8UC3, Scalar(0,0,0));
	ifstream file("path.txt");

	for (int i = 0; i < MAP_HEIGHT; i++) {
		getline(file, pixel);
		for (int j = 0; j < MAP_WIDTH; j++) {
			if(pixel[j] == '1'){
				Vec3b& rgb = output.at<Vec3b>(i,j);
				rgb[0] = 255; //RED
				rgb[1] = 255; //GREEN
				rgb[2] = 255; //BLUE
			}else if(pixel[j] == '2'){
				Vec3b& rgb = output.at<Vec3b>(i,j);
				rgb[2] = 255;
			}else if(pixel[j] == '3'){
				Vec3b& rgb = output.at<Vec3b>(i,j);
				rgb[1] = 255;
			}else if(pixel[j] == '4'){
				Vec3b& rgb = output.at<Vec3b>(i,j);
				rgb[0] = 255;
			}
		}
	}

	imwrite("path.jpeg", output);

	return 0;
}



