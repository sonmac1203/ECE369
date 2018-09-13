//
// Created by mitch on 9/11/18.
//

#ifndef LAB5CMODEL_ZIGZAGTEST_H
#define LAB5CMODEL_ZIGZAGTEST_H

#include <stdio.h>
#include <string.h>
#include "zigzag.h"


#ifdef __linux__
// definitely do not modify this, this will cause trouble
#define TEST_FILE_RELATIVE_PATH "../../test_files"
#elif __APPLE__
#define TEST_FILE_RELATIVE_PATH "../../test_files"
#else
    #define TEST_FILE_RELATIVE_PATH "../test_files"
#endif


#define NUM_TESTS 20


typedef struct testDescription_struct{
    int * _frame;
    int * _window;
    int * _asize;
    int * _result;
} testDescription;


testDescription createDescription(int * frame, int * window, int * asize, int * result);
//testDescription createDescription();
void testzigzag();
#endif //LAB5CMODEL_ZIGZAGTEST_H
