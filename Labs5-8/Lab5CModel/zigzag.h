//
// Created by mitch on 9/11/18.
//

#ifndef LAB5CMODEL_ZIGZAG_H
#define LAB5CMODEL_ZIGZAG_H

int * vbsme(int * a0, int * a1, int * a2);


int SAD(int * frame, int * window, int * asize, int frameX, int frameY);

int abs(int a);

void RightSubroutine(int * frameLoc);

void DownLeftSubroutine(int * frameLoc);


void DownSubroutine(int * frameLoc);

void UpRightSubroutine(int * frameLoc);

int FrameLoc(int x, int y, int frameWidth);


#endif //LAB5CMODEL_ZIGZAG_H
