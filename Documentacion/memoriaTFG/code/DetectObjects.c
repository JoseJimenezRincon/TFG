/* Jose Jimenez Rincon */
/* DetectObjects.c */

#include <stdio.h>
#include "SETTINGS.h"

void subtraction ( unsigned char *pixelData_Output, unsigned char *pixelData_Base, unsigned char *pixelData_Obj, int imageSize){

	int x, subtraction_value;

	for (x=0; x<imageSize; x++){

		subtraction_value = abs(pixelData_Base[x]-pixelData_Obj[x]);        

		if ( subtraction_value > THRESHOLD ){

			pixelData_Output[x] = BLACK;

		} else {

			pixelData_Output[x] = WHITE;

		}
	}

} //end subtraction

void square (unsigned char *pixelData_Output, int imageSize, int width, int height){ 

	int reference_y = HEIGHT_CAR;
	int reference_x = WIDTH_CAR;
	int x,y,z,j;
	int inicializar_x = FALSE;
	int inicializar_y = FALSE;
	int y1 = FALSE;
	int y2 = FALSE;
	int y_last = FALSE;
	int y_now = FALSE;
	int x1 = FALSE;
	int x2 = FALSE;
	int x3 = FALSE;
	int count_objects = 0;
	int objects_now= 0;
	int objects_last = 0;
	int accountant_x = 0;
	int accountant_y = 0;
	int accountant_buffer_y = 0;
	int accountant_buffer_x = 0;
	int objects_coordinates_y[height/HEIGHT_CAR];
	int objects_coordinates_x[height/HEIGHT_CAR];
	int buffer_y[height/HEIGHT_CAR];
	int buffer_x[height/HEIGHT_CAR];

	for (x=0; x<width; x++){ //Recorre el eje X hasta el ancho de la imagen

		if ( count_objects > 0 ){ // Si el numero de objetos es mayor que 0
			accountant_buffer_y = 0;

			while ( count_objects > 0 ){ //Mientras el numero de objetos sea mayor que 0

				if ( x1 == TRUE ) { //Si el primer valor de la izq se ha encontrado.

					if ( objects_last != objects_now ){ //Si el numero de objetos de la pasada anterior es distinto del numero de objetos de la pasada actual.

						if ( objects_last < objects_now ) { //Si el numero de objetos de la pasada anterior es menor que la actual implica que hay nuevo x1, y1 e y2.

							if ( x3 == FALSE ){ //Si no hay dos o mas objetos en la misma columna hasta el momento.

								if ( abs(buffer_y[accountant_buffer_y+(objects_now*2-2)] - y_last) / width >= HEIGHT_CAR && count_objects > 1
										|| x - objects_coordinates_x[accountant_x-1] >= WIDTH_CAR && count_objects > 1 )  {
									/* Si la distancia entre el valor y2 del objeto de abajo y el valor y1 del objeto de arriba es mayor que la referencia,
                                                                significa que es un nuevo objeto.*/
									objects_coordinates_y[accountant_y++] = buffer_y[accountant_buffer_y++];
									objects_coordinates_y[accountant_y++] = buffer_y[accountant_buffer_y++];
									objects_coordinates_x[accountant_x++] = x - 1;
									objects_coordinates_x[accountant_x++] = x - 1;
									x3 = TRUE;
								}else{
									objects_coordinates_x[accountant_x-1] = x2;
									objects_coordinates_y[accountant_y-1] = buffer_y[accountant_buffer_y];
								}
							}else{ //x3 == TRUE

								if ( objects_coordinates_y[accountant_y-2] < buffer_y[count_objects] ){
									objects_coordinates_y[accountant_y-2] = buffer_y[count_objects];
								}

								if ( objects_coordinates_y[accountant_y-1] > buffer_y[count_objects-1] ){
									objects_coordinates_y[accountant_y-1] = buffer_y[count_objects-1];
								}

							}

						}else{ //objects_last > object_now

							y_now = buffer_y[accountant_buffer_y];
							if ( x3 == TRUE ){
								objects_coordinates_x[accountant_x - 3] = x2;
							}else{
								objects_coordinates_x[accountant_x - 1] = x2;
							}
							x3 = FALSE;
						}

					}else{ // objects_last == objects_now
						if ( x3 == FALSE ) {
							if ( objects_coordinates_y[accountant_y-2] < buffer_y[count_objects] ){
								objects_coordinates_y[accountant_y-2] = buffer_y[count_objects];
							}

							if ( objects_coordinates_y[accountant_y-1] > buffer_y[count_objects-1] ){
								objects_coordinates_y[accountant_y-1] = buffer_y[count_objects-1];
							}
						}
						x2 = x;
					}

				}else{ // x1 == FALSE
					objects_coordinates_y[accountant_y++] = buffer_y[accountant_buffer_y++];
					objects_coordinates_y[accountant_y++] = buffer_y[accountant_buffer_y++];
					if ( x - objects_coordinates_x[accountant_x-1] >= WIDTH_CAR ){
						objects_coordinates_x[accountant_x++] = x - 1;
						objects_coordinates_x[accountant_x++] = x - 1;
					}
				}
				count_objects--;
			}

			x1 = TRUE;

		}else{ // Si no hay objetos en la columna.

			if ( reference_x == 0 ) {
				objects_coordinates_x[accountant_x - 1] = x2;
				x1 = FALSE;
			}


			if ( objects_last > objects_now && x - objects_coordinates_x[accountant_x-1] >= WIDTH_CAR && objects_now == 0){
				objects_coordinates_x[accountant_x - 1] = x2;
				x1 = FALSE;
			}
			reference_x--;
		}

		y_last = y_now;
		objects_last = objects_now; //Guardo la variable de la etapa anterior, antes de actualizarla de nuevo en la fase de captura.

		for (y=x; y<imageSize ;y=y+width){

			if ( pixelData_Output[y] == BLACK ){  //Si el pixel es negro.

				reference_x = WIDTH_CAR;
				if ( y1 == FALSE ){ // Si no se ha encontrado ningun objeto hasta el momento.
					buffer_y[count_objects++] = y;
					pixelData_Output[y] = BLACK;
					y1 = TRUE;

				}else{ //y1 == TRUE
					pixelData_Output[y] = WHITE;
					y2 = y;
				}

				reference_y = HEIGHT_CAR;

			}else{  //pixelData_y == WHITE

				if ( y1 == TRUE ){

					if (reference_y == 0 || y + width >= imageSize){ //Si la referencia es igual a 0 o se encuentra en el limite de la coordenada Y.
						pixelData_Output[y2] = BLACK;
						buffer_y[count_objects++] = y2;
						reference_y = HEIGHT_CAR;
						y1 = FALSE;
					}
					reference_y--;
				}
			}
		}
		objects_now = count_objects / 2; //Guardo la variable para que no se destruya en la fase de analisis.
		count_objects = objects_now;
		y1 = FALSE;
		y2 = FALSE;
	}

	for (z = 0; z<accountant_x; z=z+2){
		for ( x = objects_coordinates_x[z];  x < objects_coordinates_x[z+1]; x++){
			for ( y = (x+((objects_coordinates_y[z+1]/width)*width)); y < (objects_coordinates_y[z]/width*width)+(objects_coordinates_x[z+1]); y=y+width){
				pixelData_Output[y] = BLACK;
			}
		}
	}


} // end square
