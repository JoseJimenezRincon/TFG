/*
 * coordinatorTrajectory.cpp
 *
 *  Created on: 24 may. 2017
 *      Author: jose
 */


#include <stdio.h>
#include "communication.h"

#define true 1
#define false 0

#define LIMITE_VUELTAS 100

unsigned char ARRIBA = 0;
unsigned char DIAGONAL_INFERIOR_DERECHA = 1 << 5;
unsigned char DETRAS = 2 << 5;
unsigned char DIAGONAL_INFERIOR_IZQUIERDA = 3 << 5;
unsigned char ABAJO = 4 << 5;
unsigned char DIAGONAL_SUPERIOR_IZQUIERDA = 5 << 5;
unsigned char DELANTE = 6 << 5;
unsigned char DIAGONAL_SUPERIOR_DERECHA = 7 << 5;

int coordinatorTrajectory(){

	FILE *file = fopen("trajectory.txt","r");
	char line[16];
	int coorX, coorY;
	int coorXold, coorYold;
	unsigned char identifier = 0;
	unsigned char contadorMovDiagonales = 0;
	unsigned char contadorMovClasicos = 0;
	unsigned char permisoMovimientoCambio = false;
	unsigned char permisoMovimientoLimite = false;

//	fseek(file, 0, SEEK_END);
//	long size = ftell(file);
//	fseek(file, 0, SEEK_SET);


	fgets(line, sizeof(line), file);
	sscanf(line, "X: %d Y: %d", &coorXold, &coorYold);

	while (fgets(line, sizeof(line), file)) {
		if (permisoMovimientoCambio == true){
			permisoMovimientoCambio = false;
			sscanf(line-1, "X: %d Y: %d", &coorX, &coorY);
			sscanf(line-2, "X: %d Y: %d", &coorXold, &coorYold);
		}else{
			sscanf(line, "X: %d Y: %d", &coorX, &coorY);
		}

		if ( contadorMovClasicos != 0 && contadorMovDiagonales != 0 ){
			permisoMovimientoCambio = true;
			printf("\nXold= %d, Yold= %d\tX= %d, Y= %d\n", coorXold, coorYold, coorX, coorY);
		}

		if ( contadorMovClasicos == LIMITE_VUELTAS-1 || contadorMovDiagonales == LIMITE_VUELTAS-1 ){
			printf("\nXold= %d, Yold= %d\tX= %d, Y= %d\n", coorXold, coorYold, coorX, coorY);
			permisoMovimientoLimite = true;
		}

		if( coorXold != coorX && coorYold != coorY ){ //DIAGONALES
			contadorMovDiagonales++;

			if ( permisoMovimientoCambio == true || permisoMovimientoLimite == true ){

				if ( coorXold > coorX ){
					if( coorYold > coorY ){

						//DIAGONAL_SUPERIOR_IZQUIERDA
						communication(identifier, DIAGONAL_SUPERIOR_IZQUIERDA, contadorMovDiagonales);

					}else{	// coorYold < coorY

						//DIAGONAL_INFERIOR_IZQUIERDA
						communication(identifier, DIAGONAL_INFERIOR_IZQUIERDA, contadorMovDiagonales);
					}
				}else{ // coorXold < coorX
					if ( coorYold > coorY ){

						//DIAGONAL_SUPERIOR_DERECHA
						communication(identifier, DIAGONAL_SUPERIOR_DERECHA, contadorMovDiagonales);

					}else{ //coorYold < coorY

						//DIAGONAL_INFERIOR_DERECHA
						communication(identifier, DIAGONAL_INFERIOR_DERECHA, contadorMovDiagonales);
					}
				}

			}

		}else{
			contadorMovClasicos++;

			if ( permisoMovimientoCambio == true || permisoMovimientoLimite == true ){

				if ( coorXold != coorX && coorYold == coorY ){ //DCHA/IZQ
					if ( coorXold > coorX ){

						//IZQUIERDA DELANTE
						communication(identifier, DELANTE, contadorMovClasicos);

					}else{ //coorXold < coorX

						//DERECHA DETRAS
						communication(identifier, DETRAS, contadorMovClasicos);
					}
				}

				if ( coorXold == coorX && coorYold != coorY ){ //ARRIBA/ABAJO
					if ( coorYold > coorY ) {

						//Arriba
						communication(identifier, ARRIBA, contadorMovClasicos);

					}else{ //coorYold < coorY

						//Abajo
						communication(identifier, ABAJO, contadorMovClasicos);
					}
				}

			}

		}


		coorXold = coorX; coorYold = coorY;


		if ( permisoMovimientoLimite == true || permisoMovimientoCambio == true){
			contadorMovClasicos = 0;
			contadorMovDiagonales = 0;
			permisoMovimientoLimite = false;
			identifier++;
		}


	}

	fclose(file);

	return 0;
}


