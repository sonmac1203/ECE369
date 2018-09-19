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
    frameLoc[column]++; //lw $t5, 0
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


int * vbsme(int * a0, int * a1, int * a2){
    // a1[] = {  0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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

    //    a2[] = {0, 1, 2, 3,
    //                  1, 2, 3, 4,
    //                  2, 3, 4, 5,
    //                  3, 4, 5, 6 };

    //    a0[] = {16, 16, 4, 4};

    /****
     *
     *  Save Return address onto stack
     *
     *
     */


    int s1 = a0[1];  //a1 columns
    int s0 = a0[0];  //a1 rows

    int s3 = a0[3];  //a2 columns
    int s2 = a0[2];  //a2 rows

    int s4[] = {0, 0};  //a2 x,y

    int s5 = (s1 - s3) + (s0 - s2)*s1;

    //  2,147,483,647 for initial number because max 32 bit signed integer.
    //          number, frameX, frameY

    s6[0] = 2147483647;    //minimum SAD
    s6[1] = 0;             //s6[1] = s4[row]
    s6[2] = 0;             //s6[2] = s4[column]

    int s7 = 0;


    int t0 = 0, t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0, t6 = 7, t7 = 0;

    int v0 = 0;


//    if((s1 > s3) || (s0 > s2)){

    t0 = (s3 < s1) ? 1 : 0; // slt, $t0, $s3, $s1  # is a2 column less than a1 column
    t2 = (s2 < s0) ? 1 : 0; // slt, $t0, $s2, $s0  # is a2 row less than a1 row

    t0 = (t0 | t2);  //or $t0, $t0, $t2    # t0 = 1 if t0 or t2 is 1

    if (t0) {   // bne, $t0, $0 pattern

    //pattern

//
//        //int SAD(int * a1, int * a2, int * a0, int frameX, int frameY){
//        if ((temp = SAD(a1, a2, a0, s4[column], s4[row])) <= s6[0]) {
//            s6[0] = temp;
//            s6[1] = s4[row];
//            s6[2] = s4[column];
//        }

        /************
         *
         *  SAD CHECK BEGINNING
         *
         *************/

        v0 = SAD(a1, a2, a0, s4[column], s4[row]);  //jal SAD
        t0 = s6[0]; //lw
        t1 = (v0 == t0) ? 1 : 0;
        if (t1){    //bne, $t1, $0, updatedatmin
            s6[0] = v0;         //sw  $v0, 0($s6)
            s6[1] = s4[row];    //lw  $t1, 0($s4)
                                //sw  $t1, 4($s6)

            s6[2] = s4[column]; //lw  $t2, 4($s4)
                                //sw  $t2, 8($s4)
        }

        t1 = (v0 < t0) ? 1 : 0;
        if (t1){    //bne, $t1, $0, updatedatmin
            s6[0] = v0;         //sw  $v0, 0($s6)
            s6[1] = s4[row];    //lw  $t1, 0($s4)
            //sw  $t1, 4($s6)

            s6[2] = s4[column]; //lw  $t2, 4($s4)
            //sw  $t2, 8($s4)
        }

        /************
         *
         *  SAD CHECK ENDING
         *
         *************/



        //error detect right
//        if (s4[column] < s1 - s3){
//            //no collision
//            RightSubroutine(s4);
//        }
//
        t0 = s1 - s3; //sub $t0, $s1, $s3
        t1 = s4[column]; //lw $t1, 4($s4)
        t1 = (t1 < t0) ? 1 : 0; //slt $t1, $t1, $t0

        if (t1) {   //beq $t1, $0, errorDetectNext0
            RightSubroutine(s4);    //jal rightsubroutine
                                    //j donewitherrordetectright
        }
        //next

        /***
         errorDetectNext0
         ***/

        else{//right collision

//            //error detect down
//            if (s4[row] < s0 - s2){
//                //no collision
//                DownSubroutine(s4);
//            }

            t0 = s0 - s2;   // sub $t0, $s0, $s2
            t1 = s4[row];   // lw $t1, 0($s4)

            t1 = (t1 < t0) ? 1 : 0; //slt $t1, $t1, $t0

            if (t1) {   //beq $t1, $0, errorDetectNext1
                DownSubroutine(s4); //jal DownSubroutine
                                    //j donewitherrordetectright
            }

            /***
            errorDetectNext1
            ***/

            else{//down collision
                printf("%d %d\n", s6[1], s6[2]);
                return s6;  //j END
            }


        }



       /***
       donewitherrordetectright
       ***/




        //DOTHESADSTUFF
        if ((temp = SAD(a1, a2, a0, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}





        /*****
         *
         * BEGIN ZIGZAG
         *
         *****/


        //start going through zig zag pattern
//        while ((s4[column] + s4[row] * s1) < s5){

        t1 = s4[row];       //lw $t1, 0($s4)
        t0 = s4[column];    //lw $t0, 4($s4)
        t1 = t1 * s1;       //mul $t1, $t1, $s1
        t1 = t0 + t1;          //add $t1, $t0, $t1


        s7 = (t1 < t0) ? 1 : 0; //slt $s7, $t1, $t0

        //WHILE (s7)
        while ((s4[column] + s4[row] * s1) < s5){ //bne $s7, $0, ENDZIGZAG




            t7 = 1;
            //DOWN-LEFT COLLISION DETECTION
//            int loopflag = 1;
//            while(loopflag){

            /******
             *
             * DOWNLEFTCOLLISIONDETECT
             *
             ******/
            while (t7)  {   //beq $t7, $0, ENDDOWNLEFTCOLLISIONDETECT

                //Check down
//                if(s4[row] < s0 - s2){

                t0 = s0 - s2;               //sub $t0, $s0, $s2
                t1 = s4[row];               //lw $t1, 0($s4)
                t1 = (t1 < t0)  ? 1 : 0;    //slt $t1, $t1, $t0

                if (t1) {   //beq $t1, $0, DOWNCOLLISION


                    //no down collision
                    //check left

//                    if(s4[column] > 0){

                    t0 = s4[column]; //lw $t0, 4($s4)
                    t0 = ( 0 < t0) ? 1 : 0; //slt $t0, $0, $t0

                    if (t0) {   //beq $t0, $0, DOWNCOLLISION2



                        //no left collision
                        DownLeftSubroutine(s4); //jal downleftsubroutine
                                                //j DOWNLEFTLOOPEND
                    }


                    /****
                     *
                     * DOWNCOLLISION2
                     *
                     ****/

                    else{


                        //down collision
                        DownSubroutine(s4); //jal downsubroutine
                        t7 = 0; //add t0    //add $t7, $0, $0
                                            //j DOWNLEFTLOOPEND

                    }
                }


                /****
                 *
                 *  DOWNCOLLISION
                 *
                 ****/

                else{

                    //down collision
                    RightSubroutine(s4);    //jal rightsubroutine
                    t7 = 0;                 //add $t7, $0, $0
                }



                /*****
                 *
                 *
                 * DOWNLEFTLOOPEND
                 *
                 */



                if ((temp = SAD(a1, a2, a0, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}



            } // j DOWNLEFTCOLLISIONDETECT

             /******
             *
             * ENDDOWNLEFTCOLLISIONDETECT
             *
             ******/





            if ((temp = SAD(a1, a2, a0, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}




//
//            if(s5 == FrameLoc(s4[column], s4[row], s1))
//                break;

            t0 = s4[column];    //lw $t0, 4($s4)
            t1 = s4[row];       //lw $t1, 0($s4)

            t1 = t1 * s1;       //mul $t1, $t1, $s1
            t0 = t0 + t1;       //add $t0, $t1, $t0

            if (s5 == t0) break; //beq $s5, $t0, END

            t7 = 1;
            /****
             *
             *  UPRIGHTCOLLISIONDETECT
             *
             *****/
            //UP-RIGHT COLLISION DETECTION

            while(t7){  //beq $t7, $0, ENDUPRIGHTCOLLISIONDETECT




                //Check up
                //if(s4[row] > 0){

                t0 = s4[row];   //lw $t0, 0($s4)
                t0 = (0 < t0) ? 1 : 0; //slt $t0, $0, $t0

                if(t0){ //beq $t0, $0, UPCOLLISION1

                    //no up collision
                    //check right

                    t0 = s4[column]; //lw $t0, 0($s4)
                    t1 = s1 - s3; //sub $t1, $s1, $s3
                    t0 = (t0 < t1) ? 1 : 0; //slt $t0, $t0, $t1

                    if(t0){ //beq $t0, $0, RIGHTCOLLISION1
                    //if(s4[column] < s1 - s3){
                        //no right collision

                        UpRightSubroutine(s4); //jal uprightsubroutine
                                               //j UPRIGHTLOOPEND
                    }


                        /****
                         *
                         *  RIGHTCOLLISION1
                         *
                         *****/



                    else{
                        //right collision
                        DownSubroutine(s4); //jal downsubroutine
                        t7 = 0; //add $t7, $0, $0
                                //j UPRIGHTLOOPEND
                    }
                }


                    /****
                     *
                     *  UPCOLLISION1
                     *
                     *****/


                else{
                    //up collision
                    //check right

                    t0 = s4[column]; //lw $t0, 4($s4)
                    t1 = s1 - s3; //sub $t1, $s1, $s3
                    t0 = (t0 < t1) ? 1 : 0; //slt $t0, $t0, $t1

                    if(t0){

                    //if(s4[column] < s1 - s3){
                    //no right collision

                        RightSubroutine(s4); //jal rightsubroutine
                                             //j UPRIGHTLOOPEND
                    }
                    else{
                        //right collision
                        DownSubroutine(s4); //jal downsubroutine
                    }

                    t7 = 0; //add $t7, $0, $0
                }


                /*****
                 *
                 *
                 * UPRIGHTLOOPEND
                 *
                 */



                if ((temp = SAD(a1, a2, a0, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}
            }


            /****
             *
             *  ENDUPRIGHTCOLLISIONDETECT
             *
             *****/



            if ((temp = SAD(a1, a2, a0, s4[column], s4[row])) <= s6[0]){s6[0] = temp;s6[1] = s4[row];s6[2] = s4[column];}



            //if(s5 == FrameLoc(s4[column], s4[row], s1))
            //  break;

            t0 = s4[column];    //lw $t0, 4($s4)
            t1 = s4[row];       //lw $t1, 0($s4)

            t1 = t1 * s1;       //mul $t1, $t1, $s1
            t0 = t0 + t1;       //add $t0, $t1, $t0

            if (s5 == t0) break; //beq $s5, $t0, END



        } //j ZIGZAG

        /*****
        *
        * END ZIGZAG
        *
        *****/


    }
    return s6;
}