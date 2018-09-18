#include <stdio.h>
#include "zigzag.h"

//for frameLoc[]
#define row 0
#define column 1

#define verbose 0

static int s6[3];
int temp;

int abs(int a){
    //return (a < 0) ? -1 * a : a;
    if(a < 0)
        return a * -1;
    else
        return a;
}

/*
* Arguments:
* frame - The pointer to the beginning of the frame matrix
* window - The pointer to the beginning of the window matrix
* asize - The pointer to the array of four elements containing [Frame Width, Frame Height, Window Width, Window Height]
* frameLoc - The offset location of the top left comparison value in the frame
*/
int SAD(int * frame, int * window, int * asize, int currentColumn, int currentRow){
    int frameSizeX = asize[1];
    int frameSizeY = asize[0];

    int windowSizeX = asize[3];
    int windowSizeY = asize[2];

    int t0 = 0, t1 = 0, t2 = 0, t3 = 0, t4 = 0, t7 = 0;
    int * t5, * t6;

    for(int j = 0; j < windowSizeY; j++){
        for(int i = 0; i < windowSizeX; i++) {




            t1 = j + currentRow;
            t1 = t1 * frameSizeX;
            t1 = t1 + i;
            t1 = t1 + currentColumn;

            t2 = j * windowSizeX;
            t2 = t2 + i;

            t5 = frame + t1;
            t6 = window + t2;

            t3 = *t5 - *t6;





            t4 = (t3 < 0) ? 1 : 0;

            if(t4 != 0)
                t3 = t3 * -1;

            t0 = t0 + t3;


        }
    }
    return t0;
}

/////Subroutines/////


// increment FrameLoc by one to the right
void RightSubroutine(int * frameLoc){
    frameLoc[column]++;
    if (verbose) printf("\tRight: (%d, %d) %d, %d\n", frameLoc[row], frameLoc[column], s6[0], temp);
}

void DownLeftSubroutine(int * frameLoc){
    frameLoc[row]++;
    frameLoc[column]--;
    if (verbose) printf("\tDownLeft: (%d, %d) %d, %d\n", frameLoc[row], frameLoc[column], s6[0], temp);
}


void DownSubroutine(int * frameLoc){
    frameLoc[row]++;
    if (verbose) printf("\tDown: (%d, %d) %d, %d\n", frameLoc[row], frameLoc[column], s6[0], temp);
}

void UpRightSubroutine(int * frameLoc){
    frameLoc[row]--;
    frameLoc[column]++;
    if (verbose) printf("\tUpRight: (%d, %d) %d, %d\n", frameLoc[row], frameLoc[column], s6[0], temp);
}




//if(finalLocation == FrameLoc(frameLoc[column], frameLoc[row], frameRowSize))
int FrameLoc(int x, int y, int frameWidth){
    return x + y * frameWidth;
}







int * vbsme(int * asize, int * frame, int * window){
    // frame[] = {  0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    //                  1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
    //                  2, 3, 32, 1, 2, 3, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
    //                  3, 4, 1, 2, 3, 4, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45,
    //                  0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
    //                  0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75,
    //                  0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90,
    //                  0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105,
    //                  0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120,
    //                  0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135,
    //                  0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150,
    //                  0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165,
    //                  0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3,
    //                  0, 13, 26, 39, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4,
    //                  0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5,
    //                  0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 };

    //    window[] = {0, 1, 2, 3,
    //                  1, 2, 3, 4,
    //                  2, 3, 4, 5,
    //                  3, 4, 5, 6 };

    //    asize[] = {16, 16, 4, 4};


    int s1 = asize[1];  //frame columns
    int s0 = asize[0];  //frame rows

    int s3 = asize[3];  //window columns
    int s2 = asize[2];  //window rows

    int s4[] = {0, 0};  //window x,y

    int s5 = (s1 - s3) + (s0 - s2)*s1;

    //  2,147,483,647 for initial number because max 32 bit signed integer.
    //          number, frameX, frameY

    s6[0] = 2147483647;    //minimum SAD
    s6[1] = 0;             //s6[1] = s4[row]
    s6[2] = 0;             //s6[2] = s4[column]



    int t0 = 0, t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0, t6 = 7, t7 = 0;


//    if((s1 > s3) || (s0 > s2)){

    t0 = (s3 < s1) ? 1 : 0; // slt, $t0, $s3, $s1  # is window column less than frame column
    t2 = (s2 < s0) ? 1 : 0; // slt, $t0, $s2, $s0  # is window row less than frame row

    t0 = (t0 | t2);  //or $t0, $t0, $t2    # t0 = 1 if t0 or t2 is 1

    if (t0) {   // bne, $t0, $0 main

    //main


        //int SAD(int * frame, int * window, int * asize, int frameX, int frameY){
        if ((temp = SAD(frame, window, asize, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}

        //error detect right
        if (s4[column] < s1 - s3){
            //no collision
            RightSubroutine(s4);
        }
        else{//right collision
            //error detect down
            if (s4[row] < s0 - s2){
                //no collision
                DownSubroutine(s4);
            }
            else{//down collision
                printf("%d %d\n", s6[1], s6[2]);
                return s6;
            }
        }

        if ((temp = SAD(frame, window, asize, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}


        //start going through zig zag pattern
        while ((s4[column] + s4[row] * s1) < s5){

            //DOWN-LEFT COLLISION DETECTION
            int loopflag = 1;
            while(loopflag){

                //Check down
                if(s4[row] < s0 - s2){
                    //no down collision
                    //check left
                    if(s4[column] > 0){
                        //no left collision
                        DownLeftSubroutine(s4);
                    }
                    else{
                        //down collision
                        DownSubroutine(s4);
                        loopflag = 0;
                    }
                }
                else{
                    //down collision
                    RightSubroutine(s4);
                    loopflag = 0;
                }

                if ((temp = SAD(frame, window, asize, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}
            }

            if ((temp = SAD(frame, window, asize, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}
            if(s5 == FrameLoc(s4[column], s4[row], s1))
                break;

            //UP-RIGHT COLLISION DETECTION
            loopflag = 1;
            while(loopflag){

                //Check up
                if(s4[row] > 0){
                    //no up collision
                    //check right
                    if(s4[column] < s1 - s3){
                        //no right collision
                        UpRightSubroutine(s4);
                    }
                    else{
                        //right collision
                        DownSubroutine(s4);
                        loopflag = 0;
                    }
                }
                else{
                    //up collision
                    //check right
                    if(s4[column] < s1 - s3){
                        //no right collision
                        RightSubroutine(s4);
                    }
                    else{
                        //right collision
                        DownSubroutine(s4);
                    }

                    loopflag = 0;
                }

                if ((temp = SAD(frame, window, asize, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}
            }

            if ((temp = SAD(frame, window, asize, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}
            if(s5 == FrameLoc(s4[column], s4[row], s1))
                break;
        }
    }
    return s6;
}