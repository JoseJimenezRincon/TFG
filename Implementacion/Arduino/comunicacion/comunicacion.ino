//
#define TIME 2000

#define AR 0 // Sentido agujas reloj
#define NAR 1 // Sentido contrario agujas reloj

#define MAX_VELOCIDAD 255
#define MEDIA_VELOCIDAD 127
#define STOP 0

#define DERECHA 0
#define IZQUIERDA 1

const byte LED_DCHA = 6;
const byte SENSOR_DCHA = 5;
const byte LED_IZQ = 8;
const byte SENSOR_IZQ = 7;
const byte PWM_DCHA = 3;                  // Señal PWM control velocidad Motor DCHA 0=off, 255=max.
const byte PWM_IZQ = 11;                 // Señal PWM velocidad Motor IZQ 0=off, 255=max.
const byte DIR_DCHA = 12;                 // Señal digital dirección rotación motor DCHA (HIGH/LOW -> AR/NAR)
const byte DIR_IZQ = 13;                 // Señal digital dirección rotación motor IZQ (HIGH/LOW -> AR/NAR)

boolean bandera = false;
unsigned char data[3];
unsigned char action;
unsigned char turns;
int bytes = 0;
int movements = 0;
int accountant;
boolean direccion = false;
int ultimaDireccion = 6;

void setup() {
  Serial.begin(9600);
  Serial.setTimeout(TIME);
}

void loop() {
  while (Serial.available() > 0) {
    Serial.readBytes(data, 3);
    if ( data[0] == accountant ) {
      action = ( data[1] & 0xE0 ) >> 5;
      turns = data[1] & 0x1F;
      movements = (turns * 256) + data[2];
      movements = data[2];
      movimientos(action, movements);
      ultimaDireccion = action;
      accountant++;
    } else {
      Serial.write(170);
    }
  }
}

void movimientos(unsigned char action, int movements) {
  switch (action) {
    case 0:
      if (ultimaDireccion != action) {
        digitalWrite(DIR_DCHA, AR);
        digitalWrite(DIR_IZQ, NAR);
        comprobacion(10, IZQUIERDA);
      }
      movimiento(5);
      break;
    case 1: //DIAGONAL INFERIOR DERECHA
      if (ultimaDireccion != action) {
        digitalWrite(DIR_DCHA, AR);
        digitalWrite(DIR_IZQ, NAR);
        comprobacion(3, IZQUIERDA);
      }
      movimiento(movements);
      break;
    case 2: //DETRAS
      break;
    case 3: //DIAGONAL INFERIOR IZQUIERDA
      if (ultimaDireccion != action) {
        digitalWrite(DIR_DCHA, NAR);
        digitalWrite(DIR_IZQ, AR);
        comprobacion(4, IZQUIERDA);
      }
      movimiento(movements);
      break;
    case 4: //ABAJO
      break;
    case 5: //DIAGONAL SUPERIOR IZQUIERDA
      break;
    case 6: //DELANTE
      if (ultimaDireccion == 5) {
        digitalWrite(DIR_DCHA, NAR);
        digitalWrite(DIR_IZQ, AR);
        comprobacion(14, DERECHA);
      }
      if (ultimaDireccion == 3) {
        digitalWrite(DIR_DCHA, AR);
        digitalWrite(DIR_IZQ, NAR);
        comprobacion(4, IZQUIERDA);
      }
      movimiento(movements - 15);
      break;
    case 7: //DIAGONAL SUPERIOR DERECHA
      break;
  }
}

void comprobacion (int contadorVueltas, int motor) {
  analogWrite(PWM_DCHA, MEDIA_VELOCIDAD);
  analogWrite(PWM_IZQ, MEDIA_VELOCIDAD);

  if ( motor == 0) { //DERECHA
    while (contadorVueltas > 0) {
      if (digitalRead (SENSOR_DCHA) == HIGH) {
        digitalWrite (LED_DCHA, HIGH);
        bandera = false;
      }
      if (digitalRead (SENSOR_DCHA) == LOW && bandera == false) {
        bandera = true;
        digitalWrite (LED_DCHA, LOW);
        contadorVueltas--;
      }
    }
  } else {
    while (contadorVueltas > 0) {
      if (digitalRead (SENSOR_IZQ) == HIGH) {
        digitalWrite (LED_IZQ, HIGH);
        bandera = false;
      }
      if (digitalRead (SENSOR_IZQ) == LOW && bandera == false && digitalRead(SENSOR_IZQ) == LOW) {
        digitalWrite (LED_IZQ, LOW);
        contadorVueltas--;
        bandera = true;
      }
    }
  }
  analogWrite(PWM_DCHA, STOP);
  analogWrite(PWM_IZQ, STOP);
}

void movimiento(int contadorVueltas) {
  digitalWrite(DIR_DCHA, NAR);
  digitalWrite(DIR_IZQ, NAR);
  analogWrite(PWM_DCHA, MEDIA_VELOCIDAD);
  analogWrite(PWM_IZQ, MEDIA_VELOCIDAD);
  comprobacion( contadorVueltas, 0);
  Serial.write(85);
}

