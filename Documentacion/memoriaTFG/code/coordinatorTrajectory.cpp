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

#define LIMITE_VUELTAS

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
	int coorXchange, coorYchange;
	int direccion;
	unsigned char identifier = 0;
	unsigned char contadorMovDiagonales = 0;
	unsigned char contadorMovClasicos = 0;
	unsigned char permisoMovimiento = false;

	fgets(line, sizeof(line), file);
	sscanf(line, "X: %d Y: %d", &coorXold, &coorYold);

	while (fgets(line, sizeof(line), file)) {

		sscanf(line, "X: %d Y: %d", &coorX, &coorY);

		if( coorXold != coorX && coorYold != coorY ){ //DIAGONALES
			contadorMovDiagonales++;
		}else{
			contadorMovClasicos++;
		}

		if ( (contadorMovClasicos != 0 && contadorMovDiagonales != 0) || contadorMovClasicos == LIMITE_VUELTAS-1 || contadorMovDiagonales == LIMITE_VUELTAS-1){
			permisoMovimiento = true;
			printf("\n\nXold= %d, Yold= %d\tX= %d, Y= %d\n", coorXold, coorYold, coorX, coorY);
		}

		if ( permisoMovimiento == true || permisoMovimiento == true ){

			if(coorXold != coorXchange && coorYold != coorYchange){
				if ( coorXchange > coorXold ){
					if( coorYchange > coorYold ){

						//DIAGONAL_SUPERIOR_IZQUIERDA
						communication(identifier, DIAGONAL_SUPERIOR_IZQUIERDA, contadorMovDiagonales);
						direccion=DIAGONAL_SUPERIOR_IZQUIERDA;

					}else{	// coorYchange < coorY

						//DIAGONAL_INFERIOR_IZQUIERDA
						communication(identifier, DIAGONAL_INFERIOR_IZQUIERDA, contadorMovDiagonales);
						direccion=DIAGONAL_INFERIOR_IZQUIERDA;
					}
				}else{ // coorXchange < coorXold
					if ( coorYchange > coorYold ){

						//DIAGONAL_SUPERIOR_DERECHA
						communication(identifier, DIAGONAL_SUPERIOR_DERECHA, contadorMovDiagonales);
						direccion=DIAGONAL_SUPERIOR_DERECHA;

					}else{ //coorYchange < coorY

						//DIAGONAL_INFERIOR_DERECHA
						communication(identifier, DIAGONAL_INFERIOR_DERECHA, contadorMovDiagonales);
						direccion=DIAGONAL_INFERIOR_DERECHA;
					}
				}
			}else{

				if ( coorXchange != coorXold && coorYchange == coorYold ){ //DCHA/IZQ
					if ( coorXchange > coorXold ){

						//IZQUIERDA DELANTE
						communication(identifier, DELANTE, contadorMovClasicos);
						direccion=DELANTE;

					}else{ //coorXchange < coorXold

						//DERECHA DETRAS
						communication(identifier, DETRAS, contadorMovClasicos);
						direccion=DETRAS;
					}
				}

				if ( coorXchange == coorXold && coorYchange != coorYold ){ //ARRIBA/ABAJO
					if ( coorYchange > coorYold ) {

						//Arriba
						communication(identifier, ARRIBA, contadorMovClasicos);
						direccion=ARRIBA;

					}else{ //coorYchange < coorY

						//Abajo
						communication(identifier, ABAJO, contadorMovClasicos);
						direccion=ABAJO;
					}
				}
			}
		}
		coorXchange = coorXold; coorYchange = coorYold;
		coorXold = coorX; coorYold = coorY;

		if ( permisoMovimiento== true){
			contadorMovClasicos = 0;
			contadorMovDiagonales = 0;
			permisoMovimiento = false;
			identifier++;
		}

	}

	if(contadorMovClasicos>0){
		if ( coorXchange != coorXold && coorYchange == coorYold ){ //DCHA/IZQ
			if ( coorXchange > coorXold ){

				//IZQUIERDA DELANTE
				communication(identifier, DELANTE, contadorMovClasicos);
				direccion=DELANTE;

			}else{ //coorXchange < coorXold

				//DERECHA DETRAS
				communication(identifier, DETRAS, contadorMovClasicos);
				direccion=DETRAS;
			}
		}

		if ( coorXchange == coorXold && coorYchange != coorYold ){ //ARRIBA/ABAJO
			if ( coorYchange > coorYold ) {

				//Arriba
				communication(identifier, ARRIBA, contadorMovClasicos);
				direccion=ARRIBA;

			}else{ //coorYchange < coorY

				//Abajo
				communication(identifier, ABAJO, contadorMovClasicos);
				direccion=ABAJO;
			}
		}
	}

	if(contadorMovDiagonales>0){
		if(coorXold != coorXchange && coorYold != coorYchange){
			if ( coorXchange > coorXold ){
				if( coorYchange > coorYold ){

					//DIAGONAL_SUPERIOR_IZQUIERDA
					communication(identifier, DIAGONAL_SUPERIOR_IZQUIERDA, contadorMovDiagonales);
					direccion=DIAGONAL_SUPERIOR_IZQUIERDA;

				}else{	// coorYchange < coorY

					//DIAGONAL_INFERIOR_IZQUIERDA
					communication(identifier, DIAGONAL_INFERIOR_IZQUIERDA, contadorMovDiagonales);
					direccion=DIAGONAL_INFERIOR_IZQUIERDA;
				}
			}else{ // coorXchange < coorXold
				if ( coorYchange > coorYold ){

					//DIAGONAL_SUPERIOR_DERECHA
					communication(identifier, DIAGONAL_SUPERIOR_DERECHA, contadorMovDiagonales);
					direccion=DIAGONAL_SUPERIOR_DERECHA;

				}else{ //coorYchange < coorY

					//DIAGONAL_INFERIOR_DERECHA
					communication(identifier, DIAGONAL_INFERIOR_DERECHA, contadorMovDiagonales);
					direccion=DIAGONAL_INFERIOR_DERECHA;
				}
			}
		}
	}

	fclose(file);

	return 0;
}


