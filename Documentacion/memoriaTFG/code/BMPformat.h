/* JoseJimenezRincon */
/* BMPformat.h */


/*BMP_HEADER
2Bytes Type of image format
4Bytes Size of the BMP file in bytes
2Bytes Reserved
2Btyes Reserved
4Bytes The offset, starting address, of the byte where pixel array can be found.

BMP_INFO_HEADER
4Bytes infoSize The number of bytes required by the structure.
4Bytes width The width of the bitmap, in pixels.
4Bytes heigth The height of the bitmap, in pixels. If heigth is positive, the bitmap is a bottom-up DIB and its origin is the lower-left corner. If it is negative, the bitmap is a top-down DIB and its origin is the upper-left corner.
2Bytes planes The number of planes for the target device. This value must be set to 1.
2Bytes bitsPerPixel Determines the number of bits that define each pixel and the maximum number os colors in the bitmap. GREYSCALE
4Bytes compression The type of compression for a compressed bottom-up bitmap (top-down DIBs cannot be compresses). Value 0.
4Bytes imageSize The size, in bytes, of the image.
4Bytes yPixelParameter The vertical resolution, in pixels-per-meter, of the target device for the bitmap.
4Bytes xPixelParameter The horizonal resoluion.
4Bytes numColorsPallate The number of color indexes in the color table that are actually used by the bitmap.
4Bytes mostImpColor The number of color indexes that are required for displaying the bitmap. If this value is zero, all colors.

RGBQUAD
rgbBlue 0-255
rgbGreen 0-255
rgbRed 0-255
rgbReserved 0-255*/


#ifndef _BMPformat_H
#define _BMPformat_H 1

#pragma pack(1)

typedef struct {
        unsigned short type;
        unsigned int size;
        unsigned short res1;
        unsigned short res2;
        unsigned int offset;
} BMP_HEADER;

typedef struct {
        unsigned int infoSize;
        int width;
        int height;
        unsigned short planes;
        unsigned short bitsPerPixel;
        unsigned int compression;
        unsigned int imageSize;
        int yPixelParameter;
        int xPixelParameter;
        unsigned int numColorsPallatte;
        unsigned int mostImpColor;
} BMP_INFO_HEADER;

typedef struct{
        unsigned char  rgbBlue;
        unsigned char  rgbGreen;
        unsigned char  rgbRed;
        unsigned char  rgbReserved;
} RGBQUAD;

typedef struct {
        BMP_HEADER bmp_header;
        BMP_INFO_HEADER bmp_info_header;
        RGBQUAD indexedColData[256];
} BITMAP_FILE;

#endif /* _BMPformat_H */	
