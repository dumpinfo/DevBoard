/*
*******************************************************************************
*       Filename:  preoprocess.h
*    Description:  header file
*       
*        Version:  1.0
*        Created:  2018-10-10
*         Author:  chencheng
*
*        History:  initial draft
*******************************************************************************
*/

#ifndef __PREPROCESS_H
#define __PREPROCESS_H

#define UINT8 unsigned char

int normalize_data_to_float(UINT8 * char_data, float * float_data, int size);

int convert_float_to_char(float * float_data, UINT8 * char_data, int size);

int resize(float * src, float * dst, int src_height, int src_width, int dst_height, int dst_width);


#endif // __PREPROCESS_H