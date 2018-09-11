#include <stdio.h>

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
int SAD(int * frame, int * window, int * asize, int frameX, int frameY){
	int frameSizeX = asize[0];
	int frameSizeY = asize[1];

	int windowSizeX = asize[2];
	int windowSizeY = asize[3];

	int sum = 0;

	for(int j = 0; j < windowSizeY; j++){
		for(int i = 0; i < windowSizeX; i++)
			//sum += abs(frame[frameX + (frameY * framesizeX) + i + (j * frameSizeX)] - window[i + j * windowSizeX]);

            sum += abs(frame[(j+frameY) * frameSizeX + i + frameX] - window[i + j * windowSizeX]);
	}
	
	return sum;
}

/////Subroutines/////

// increment FrameLoc by one to the right
void RightSubroutine(int * frameLoc){
    frameLoc[0]++;
}

void DownLeftSubroutine(int * frameLoc){
    frameLoc[0]--;
    frameLoc[1]++;
}


void DownSubroutine(int * frameLoc){
    frameLoc[1]++;
}

void UpRightSubroutine(int * frameLoc){
    frameLoc[0]++;
    frameLoc[1]--;
}

int FrameLoc(int x, int y, int frameWidth){
    return x + y * frameWidth;
}



int main(int * asize, int * frame, int * window){
	// frame[] = {	0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 //         			1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
 //         			2, 3, 32, 1, 2, 3, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 
 //         			3, 4, 1, 2, 3, 4, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 
 //         			0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
 //         			0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
 //         			0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
 //         			0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
 //         			0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
 //         			0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
 //         			0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
 //         			0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
 //         			0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3, 
 //         			0, 13, 26, 39, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4, 
 //         			0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5, 
 //         			0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 };

 //    window[] = {0, 1, 2, 3, 
 //         			1, 2, 3, 4, 
 //         			2, 3, 4, 5, 
 //         			3, 4, 5, 6 };

 //    asize[] = {16, 16, 4, 4};


    int frameSizeX = asize[0];
    int frameSizeY = asize[1];

    int windowSizeX = asize[2];
    int windowSizeY = asize[3];

    int frameLoc[] = {0, 0};

    int finalLocation = (frameSizeX - windowSizeX) + (frameSizeY - windowSizeY)*frameSizeX;

    //  2,147,483,647 for initial number because max 32 bit signed integer.
    //          number, frameX, frameY
    int min[] = {2147483647, 0, 0};
    int temp;



    if(frameSizeX > windowSizeX && frameSizeY > windowSizeY){
        //int SAD(int * frame, int * window, int * asize, int frameX, int frameY){
        if ((temp = SAD(frame, window, asize, frameLoc[0], frameLoc[1])) <= min[0]){min[0] = temp;min[1] = frameLoc[0];min[2] = frameLoc[1];}

        //error detect right
        if (frameLoc[0] < frameSizeX - windowSizeX){
            //no collision
            RightSubroutine(frameLoc);
        }
        else{//right collision
            //error detect down        
            if (frameLoc[1] < frameSizeY - windowSizeY){
                //no collision
                DownSubroutine(frameLoc);
            }
            else{//down collision
                printf("%d %d\n", min[1], min[2]);
                return 0;
            }
        }

        if ((temp = SAD(frame, window, asize, frameLoc[0], frameLoc[1])) <= min[0]){min[0] = temp;min[1] = frameLoc[0];min[2] = frameLoc[1];}



        //start going through zig zag pattern
        while ((frameLoc[0] + frameLoc[1] * frameSizeX) < finalLocation){

            //DOWN-LEFT COLLISION DETECTION
            int loopflag = 1;
            while(loopflag){
                
                //Check down
                if(frameLoc[1] < frameSizeY - windowSizeY){
                    //no down collision
                    //check left
                    if(frameLoc[0] >= 0){
                        //no left collision
                        DownLeftSubroutine(frameLoc);
                    }
                    else{
                        //down collision
                        DownSubroutine(frameLoc);
                        loopflag = 0;
                    }
                }
                else{
                    //down collision
                    RightSubroutine(frameLoc);
                    loopflag = 0;
                }
            
                if ((temp = SAD(frame, window, asize, frameLoc[0], frameLoc[1])) <= min[0]){min[0] = temp;min[1] = frameLoc[0];min[2] = frameLoc[1];}
            }

            if ((temp = SAD(frame, window, asize, frameLoc[0], frameLoc[1])) <= min[0]){min[0] = temp;min[1] = frameLoc[0];min[2] = frameLoc[1];}
            if(finalLocation == FrameLoc(frameLoc[0], frameLoc[1], frameSizeX))
                break;

            //UP-RIGHT COLLISION DETECTION
            loopflag = 1;
            while(loopflag){
                
                //Check up
                if(frameLoc[1] > 0){
                    //no up collision
                    //check right
                    if(frameLoc[0] < frameSizeX - windowSizeX){
                        //no right collision
                        UpRightSubroutine(frameLoc);
                    }
                    else{
                        //right collision
                        DownSubroutine(frameLoc);
                        loopflag = 0;
                    }
                }
                else{
                    //up collision
                    RightSubroutine(frameLoc);
                    loopflag = 0;
                }
            
                if ((temp = SAD(frame, window, asize, frameLoc[0], frameLoc[1])) <= min[0]){min[0] = temp;min[1] = frameLoc[0];min[2] = frameLoc[1];}
            }

            if ((temp = SAD(frame, window, asize, frameLoc[0], frameLoc[1])) <= min[0]){min[0] = temp;min[1] = frameLoc[0];min[2] = frameLoc[1];}
            if(finalLocation == FrameLoc(frameLoc[0], frameLoc[1], frameSizeX))
                break;
        }
    }
    printf("%d %d\n", min[1], min[2]);

    return 0;
}