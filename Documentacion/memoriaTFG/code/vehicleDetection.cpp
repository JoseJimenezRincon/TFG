/*
 * deteccionVehiculo.cpp
 *
 *  Created on: 19/12/2016
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

int vehicleDetection(const char* path) {

	// Cargamos la imagen de entrada
	Mat bgr_image = imread(path);

	// Clonamos la imagen
	Mat orig_image = bgr_image.clone();

	// Convert input image to HSV
	Mat hsv_image;
	cvtColor(bgr_image, hsv_image, COLOR_BGR2HSV);

	// Threshold the HSV image, keep only the red pixels
	Mat red_vehicule;
	inRange(hsv_image, Scalar(170, 100, 100), Scalar(179, 255, 255), red_vehicule);

	//Gaussian filter to detect better circlesg
	GaussianBlur(red_vehicule, red_vehicule, cv::Size(9, 9), 2, 2);

	// Use the Hough transform to detect circles in the combined threshold image
	vector<Vec3f> circles;
	HoughCircles(red_vehicule, circles, CV_HOUGH_GRADIENT, 1, red_vehicule.rows/8, 100, 20, 0, 0);

	std::ofstream output("vehicle.txt");

	int blockWidth=MAPWIDTH/MACROWIDTH;
	int blockHeight=MAPHEIGHT/MACROHEIGHT;

	// Loop over all detected circles and outline them on the original image
	if(circles.size() == 0) std::exit(-1);
	for(size_t current_circle = 0; current_circle < circles.size(); ++current_circle) {
		Point center(round(circles[current_circle][0]), round(circles[current_circle][1]));
		int radius = round(circles[current_circle][2]);
		circle(orig_image, center, radius, Scalar(0, 255, 0), 5);

		center.x=center.x/blockWidth; //1920
		center.y=center.y/blockHeight; //1080
		output<<center;
	}

	output.close();

	//namedWindow("Imagen", CV_WINDOW_AUTOSIZE);
	namedWindow("Imagen", CV_WINDOW_NORMAL);
	imshow("Imagen", red_vehicule);
	namedWindow("Detected red circles on the input image", CV_WINDOW_NORMAL);
	imshow("Detected red circles on the input image", orig_image);

	waitKey(0);

	return 0;
}


