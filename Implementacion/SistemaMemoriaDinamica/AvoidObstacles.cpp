//============================================================================
// Name        : AvoidObstacles.cpp
// Author      : JoseJiménezRincón
// Version     :
// Copyright   : ARCO 2017
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "VehicleDetection/vehicleDetection.h"
#include "CalculateTrajectory/calculateTrajectory.h"
#include "CoordinatorTrajectory/coordinatorTrajectory.h"
#include "ObjectsDetectionOpenCV/objectsDetectionOpenCV.h"
#include "MonitoringResults/monitoringResults.h"
#include "SETTINGS.h"

int main(int argc, char *argv[]) {

	//Calculate where is the car against other objects.
	clock_t start = clock();
	vehicleDetection("images/scenarioVehicle.jpg");
	clock_t end = clock();
	double time_elapsed = double(end - start)/(double)CLOCKS_PER_SEC;
	std::cout<<"Detección vehículo"<<time_elapsed<<std::endl;


	//Calculate where are the objects of map.
	start = clock();
	objectsDetectionOpenCV("images/scenario.jpg", "images/scenarioObjects.jpg");
	end = clock();
	time_elapsed = double(end - start)/(double)CLOCKS_PER_SEC;
	std::cout<<"Detección objetos"<<time_elapsed<<std::endl;

	//Calculate Trajectory
	start = clock();
	calculateTrajectory();
	end = clock();
	time_elapsed = double(end - start)/(double)CLOCKS_PER_SEC;
	std::cout<<"Cálculo trayectoria"<<time_elapsed<<std::endl;

	//Show route like a image
	monitoringResults();

	//Coordinate movements of vehicle
	start = clock();
	coordinatorTrajectory();
	end = clock();
	time_elapsed = double(end - start)/(double)CLOCKS_PER_SEC;
	std::cout<<"Coordinador trayectoria"<<time_elapsed<<std::endl;

	return 0;
}
