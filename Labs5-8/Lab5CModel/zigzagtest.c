

#include "zigzagtest.h"



//int SAD(int * frame, int * window, int * asize, int frameX, int frameY){
testDescription createDescription(int * frame, int * window, int * asize, int * result){
    testDescription newDesc;
    newDesc._frame = frame;
    newDesc._window = window;
    newDesc._asize = asize;
    newDesc._result = result;
    return newDesc;
}

void testzigzag() {

/*
 *
 * Test 0
 *
 */


    // test 0 For the 2x2 frame size and 4X4 window size
    // small size for validation and debugging purpose
    // The result should be 0, 2
    int result0[] = {0, 2};
    int asize0[] = {4,  4,  2, 2};   //i, j, k, l
    int frame0[] = {0,  0,  1,  2,
                    0,  0,  3,  4,
                    0,  0,  0,  0,
                    0,  0,  0,  0, };
    int window0[] = {1,  2,
                     3,  4,};


    /*
     *
     * Test 1
     *
     */


    // test 1 For the 16X16 frame size and 4X4 window size
    // The result should be 12, 12
    int result1[] = {12, 12};
    int asize1[] = {16, 16, 4, 4};  //i, j, k, l

    int frame1[] = {0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
                      2, 3, 32, 1, 2, 3, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
                      3, 4, 1, 2, 3, 4, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45,
                      0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
                      0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75,
                      0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90,
                      0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105,
                      0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120,
                      0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135,
                      0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150,
                      0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165,
                      0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3,
                      0, 13, 26, 39, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4,
                      0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5,
                      0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6};

    int window1[] = {0, 1, 2, 3,
                      1, 2, 3, 4,
                      2, 3, 4, 5,};

    /*
     *
     * Test 2
     *
     */

    // test 2 For the 16X16 frame size and a 4X8 window size
    // The result should be 0, 4
    int result2[] = {0, 4};
    int asize2[] = {16, 16, 4, 8};  //i, j, k, l
    int frame2[] = {7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
               0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 0, 0, 0, 0, 70,  75,
               0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 0, 0, 0, 0, 84, 90,
               0, 4, 8, 8, 8, 8, 42, 49, 56, 63, 0, 0, 0, 0, 98, 105,
               0, 1, 8, 8, 8, 8, 48, 56, 64, 72, 0, 0, 0, 0, 112, 120,
               0, 1, 8, 8, 8, 8, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135,
               0, 10, 8, 8, 8, 8, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150,
               0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165,
               9, 9, 9, 9, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3,
               9, 9, 9, 9, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4,
               9, 9, 9, 9, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5,
               9, 9, 9, 9, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 };

    int window2[] = {0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0 };


    int * asize = asize0;
    int * frame = frame0;
    int * window = window0;
    int * result = result0;

    testDescription tests[3];

    tests[0] = createDescription(frame, window, asize, result);

    asize = asize1;
    frame = frame1;
    window = window1;
    result = result1;

    tests[1] = createDescription(frame, window, asize, result);

    asize = asize2;
    frame = frame2;
    window = window2;
    result = result2;

    tests[2] = createDescription(frame, window, asize, result);



    int *testmin;


    for(int i = 0;i < 3; i++)   {

        testmin = vbsme(tests[i]._asize, tests[i]._frame, tests[i]._window);

        printf("Test%d:\n", i);
        printf("\tResult: %d %d\n", testmin[1], testmin[2]);
        printf("\tAnswer: %d %d\n", tests[i]._result[0], tests[i]._result[1]);


    }

}
