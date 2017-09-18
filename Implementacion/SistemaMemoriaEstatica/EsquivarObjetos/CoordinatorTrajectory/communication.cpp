/*
 * communication.cpp
 *
 *  Created on: 24 may. 2017
 *      Author: jose
 */

#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <fcntl.h>  /* File Control Definitions          */
#include <termios.h>/* POSIX Terminal Control Definitions*/
#include <unistd.h> /* UNIX Standard Definitions         */
#include <errno.h>  /* ERROR Number Definitions          */

int communication(unsigned char byte1,unsigned char byte2, unsigned char byte3){

	int fd;/*File Descriptor*/

	/*------------------------------- Opening the Serial Port -------------------------------*/

	/* Change /dev/ttyUSB0 to the one corresponding to your system */

	fd = open("/dev/ttyUSB0",O_RDWR, O_NDELAY);	/* ttyUSB0 is the FT232 based USB2SERIAL Converter   */
	/* O_RDWR Read/Write access to serial port           */
	/* O_NOCTTY - No terminal will control the process   */
	/* O_NDELAY -Non Blocking Mode,Does not care about-  */
	/* -the status of DCD line,Open() returns immediatly */

	if(fd == -1)                                            /* Error Checking */
		printf("\n  Error! in Opening ttyUSB0  ");
	else
		printf("\n  ttyUSB0 Opened Successfully ");


	/*---------- Setting the Attributes of the serial port using termios structure --------- */

	struct termios SerialPortSettings;      /* Create the structure                          */

	tcgetattr(fd, &SerialPortSettings);     /* Get the current attributes of the Serial port */

	/* Setting the Baud rate */
	cfsetispeed(&SerialPortSettings,B9600); /* Set Read  Speed as 9600                       */
	cfsetospeed(&SerialPortSettings,B9600); /* Set Write Speed as 9600                       */

	/* 8N1 Mode */
	SerialPortSettings.c_cflag &= ~PARENB;   /* Disables the Parity Enable bit(PARENB),So No Parity   */
	SerialPortSettings.c_cflag &= ~CSTOPB;   /* CSTOPB = 2 Stop bits,here it is cleared so 1 Stop bit */
	SerialPortSettings.c_cflag &= ~CSIZE;    /* Clears the mask for setting the data size             */
	SerialPortSettings.c_cflag |=  CS8;      /* Set the data bits = 8                                 */

	SerialPortSettings.c_cflag &= ~CRTSCTS;       /* No Hardware flow Control                         */
	SerialPortSettings.c_cflag |= CREAD | CLOCAL; /* Enable receiver,Ignore Modem Control lines       */

	SerialPortSettings.c_iflag &= ~(IXON | IXOFF | IXANY);          /* Disable XON/XOFF flow control both i/p and o/p */
	SerialPortSettings.c_iflag &= ~ICANON;  /* Non Cannonical mode                            */

	SerialPortSettings.c_oflag &= OPOST;/*No Output Processing*/

	/* Setting Time outs */
	SerialPortSettings.c_cc[VMIN] = 0; /* Read at least 10 characters */
	SerialPortSettings.c_cc[VTIME] = 0; /* Wait indefinetly   */

	//tcflush(fd, TCIFLUSH);

	if((tcsetattr(fd,TCSANOW,&SerialPortSettings)) != 0) /* Set the attributes to the termios structure*/
		printf("\n  ERROR ! in Setting attributes");
	//else
		//printf("\n  BaudRate = 9600 \n  StopBits = 1 \n  Parity   = none");

	/*----------- Communication ------------*/

	unsigned char packet[3];
	packet[0] = byte1;
	packet[1] = byte2;
	packet[2] = byte3;

	printf("\n\n +------------Packet Sent-----------+ \n\tID: %d Orden: %d Vueltas: %d\n +----------------------------------+\n", byte1, ( byte2 & 0xE0 ) >> 5, byte3);

	int bytes_written  = 0;
	bytes_written = write(fd,packet,sizeof(packet));

	unsigned char read_char;

//	if ( read(fd,&read_char,1) <= 0){
//		printf(" +----------------------------------+\n\tERROR. Movement Timeout\n +----------------------------------+\n\n");
//		return 1;
//	}else{
//		if ( read_char == 85 ){
//			printf(" +----------------------------------+\n\tMovement Done.\n +----------------------------------+\n\n");
//			return 0;
//		}
//
//		if ( read_char == 170 ){
//			printf(" +----------------------------------+\n\tERROR. Information Outdated.\n +----------------------------------+\n\n");
//			return 1;
//		}
//	}

	close(fd); /* Close the serial port */
}

//struct termios
//{
//tcflag_t c_iflag; /* input mode flags   */
//tcflag_t c_oflag; /* output mode flags  */
//tcflag_t c_cflag; /* control mode flags */
//tcflag_t c_lflag; /* local mode flags   */
//cc_t c_line;      /* line discipline    */
//cc_t c_cc[NCCS];  /* control characters */
//};



