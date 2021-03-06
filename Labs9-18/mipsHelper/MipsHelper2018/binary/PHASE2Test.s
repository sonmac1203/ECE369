#  Team Members: Lena Voytek, Mitchell Dzurick   
#  % Effort    50:50   
#
# ECE369A,  Lab 2:00 - 3:15
# 

########################################################################################################################
### data
########################################################################################################################
.data
# test input
# asize : dimensions of the frame [i, j] and window [k, l]
#         i: number of rows,  j: number of cols
#         k: number of rows,  l: number of cols  
# frame : frame data with i*j number of pixel values
# window: search window with k*l number of pixel values
#
# $v0 is for row / $v1 is for column
                
asize9:  .word    16, 16, 4, 4    #i, j, k, l
frame9:  .word    0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
         .word    1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3, 
         .word    2, 3, 32, 1, 2, 3, 12, 14, 16, 18, 20, 1, 1, 2, 3, 4, 
         .word    3, 4, 1, 2, 3, 4, 18, 21, 24, 27, 30, 33, 2, 3, 4, 5, 
         .word    0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 3, 4, 5, 6, 
         .word    0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 3, 4, 5, 6, 
         .word    0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 10, 3, 100, 3, 
         .word    0, 13, 26, 39, 52, 65, 78, 91, 104, 114, 130, 143, 36, 42, 23, 44, 
         .word    0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154, 25, 34, 33, 58, 
         .word    0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 35, 74, 55, 66 
window9: .word    0, 1, 2, 3, 
         .word    1, 2, 3, 4, 
         .word    2, 3, 4, 5, 
         .word    3, 4, 5, 6 
########################################################################################################################
### main
########################################################################################################################

.text

.globl main

main: 
    addi    $sp, $sp, -4    # Make space on stack
    sw      $ra, 0($sp)     # Save return address
    

    # Start test 10 
    ############################################################
    la      $a0, asize9        # 1st parameter: address of asize10[0]
    la      $a1, frame9        # 2nd parameter: address of frame10[0]
    la      $a2, window9       # 3rd parameter: address of window10[0]   

    jal     vbsme               # call function
    jal     print_result        # print results to console
    ############################################################
    # End of test 10  



#     # Start test 0
#     ############################################################
#     la      $a0, asize0     # 1st parameter: address of asize1[0]
#     la      $a1, frame0     # 2nd parameter: address of frame1[0]
#     la      $a2, window0    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 0    
    
    
#     # Start test 1 
#     ############################################################
#     la      $a0, asize1     # 1st parameter: address of asize1[0]
#     la      $a1, frame1     # 2nd parameter: address of frame1[0]
#     la      $a2, window1    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 1   

   
#     # Start test 2 
#     ############################################################
#     la      $a0, asize2     # 1st parameter: address of asize2[0]
#     la      $a1, frame2     # 2nd parameter: address of frame2[0]
#     la      $a2, window2    # 3rd parameter: address of window2[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 2   
                   
               
#     # Start test 3
#     ############################################################
#     la      $a0, asize3     # 1st parameter: address of asize3[0]
#     la      $a1, frame3     # 2nd parameter: address of frame3[0]
#     la      $a2, window3    # 3rd parameter: address of window3[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console 
#     ############################################################
#     # End of test 3   
      
      
#     # Start test 4 
#     ############################################################
#     la      $a0, asize4     # 1st parameter: address of asize4[0]
#     la      $a1, frame4     # 2nd parameter: address of frame4[0]
#     la      $a2, window4    # 3rd parameter: address of window4[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 4   
   
   
#     # Start test 5
#     ############################################################
#     la      $a0, asize5     # 1st parameter: address of asize5[0]
#     la      $a1, frame5     # 2nd parameter: address of frame5[0]
#     la      $a2, window5    # 3rd parameter: address of window5[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 5

   
#     # Start test 6 
#     ############################################################
#     la      $a0, asize6     # 1st parameter: address of asize6[0]
#     la      $a1, frame6     # 2nd parameter: address of frame6[0]
#     la      $a2, window6    # 3rd parameter: address of window6[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 6
   

#     # Start test 7
#     ############################################################
#     la      $a0, asize7     # 1st parameter: address of asize7[0]
#     la      $a1, frame7     # 2nd parameter: address of frame7[0]
#     la      $a2, window7    # 3rd parameter: address of window7[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 7   
   

#     # Start test 8 
#     ############################################################
#     la      $a0, asize8     # 1st parameter: address of asize8[0]
#     la      $a1, frame8     # 2nd parameter: address of frame8[0]
#     la      $a2, window8    # 3rd parameter: address of window8[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 8   
   
   
#     # Start test 9 
#     ############################################################
#     la      $a0, asize9     # 1st parameter: address of asize9[0]
#     la      $a1, frame9     # 2nd parameter: address of frame9[0]
#     la      $a2, window9    # 3rd parameter: address of window9[0] 

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 9      
   
#     # Start test 11
#     ############################################################
#     la      $a0, asize11     # 1st parameter: address of asize11[0]
#     la      $a1, frame11     # 2nd parameter: address of frame11[0]
#     la      $a2, window11    # 3rd parameter: address of window11[0]   

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 11  
   

#     # Start test 12
#     ############################################################
#     la      $a0, asize12     # 1st parameter: address of asize12[0]
#     la      $a1, frame12     # 2nd parameter: address of frame12[0]
#     la      $a2, window12    # 3rd parameter: address of window12[0]   

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 12  
   

#     # Start test 13
#     ############################################################
#     la      $a0, asize13     # 1st parameter: address of asize13[0]
#     la      $a1, frame13     # 2nd parameter: address of frame13[0]
#     la      $a2, window13    # 3rd parameter: address of window13[0]   

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 13  
   
   
#     # Start test 14
#     ############################################################
#     la      $a0, asize14     # 1st parameter: address of asize14[0]
#     la      $a1, frame14     # 2nd parameter: address of frame14[0]
#     la      $a2, window14    # 3rd parameter: address of window14[0]   

#     jal     vbsme           # call function
#     jal     print_result    # print results to console
#     ############################################################
#     # End of test 14     
   

#     # Start test 15
#     ############################################################
#     la      $a0, asize15     # 1st parameter: address of asize1[0]
#     la      $a1, frame15     # 2nd parameter: address of frame1[0]
#     la      $a2, window15    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 15  


#     # Start test 16
#     ############################################################
#     la      $a0, asize16     # 1st parameter: address of asize1[0]
#     la      $a1, frame16     # 2nd parameter: address of frame1[0]
#     la      $a2, window16    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 16    

#     # Start test 17
#     ############################################################
#     la      $a0, asize17     # 1st parameter: address of asize1[0]
#     la      $a1, frame17     # 2nd parameter: address of frame1[0]
#     la      $a2, window17    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 17    

#     # Start test 18
#     ############################################################
#     la      $a0, asize18     # 1st parameter: address of asize1[0]
#     la      $a1, frame18     # 2nd parameter: address of frame1[0]
#     la      $a2, window18    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 18    


#     # Start test 19
#     ############################################################
#     la      $a0, asize19     # 1st parameter: address of asize1[0]
#     la      $a1, frame19     # 2nd parameter: address of frame1[0]
#     la      $a2, window19    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 19    

#     # Start test 20
#     ############################################################
#     la      $a0, asize20     # 1st parameter: address of asize1[0]
#     la      $a1, frame20     # 2nd parameter: address of frame1[0]
#     la      $a2, window20    # 3rd parameter: address of window1[0] 
   
#     jal     vbsme           # call function
#     jal     print_result    # print results to console
    
#     ############################################################
#     # End of test 20    

#     lw      $ra, 0($sp)         # Restore return address
#     addi    $sp, $sp, 4         # Restore stack pointer
# #    jr      $ra                 # Return
    
    



    exit:
         j exit
         
    # li      $v0, 10              # terminate program run and
    # syscall                      # Exit 

################### Print Result ####################################
print_result:
	nop
    # Printing $v0
    # add     $a0, $v0, $zero     # Load $v0 for printing
    # li      $v0, 1              # Load the system call numbers
    # syscall
   
    # # Print newline.
    # la      $a0, newline          # Load value for printing
    # li      $v0, 4                # Load the system call numbers
    # syscall
   
    # # Printing $v1
    # add     $a0, $v1, $zero      # Load $v1 for printing
    # li      $v0, 1                # Load the system call numbers
    # syscall

    # # Print newline.
    # la      $a0, newline          # Load value for printing
    # li      $v0, 4                # Load the system call numbers
    # syscall
   
    # # Print newline.
    # la      $a0, newline          # Load value for printing
    # li      $v0, 4                # Load the system call numbers
    # syscall
   
    jr      $ra                   #function return

#####################################################################
### vbsme
#####################################################################


# vbsme.s 
# motion estimation is a routine in h.264 video codec that 
# takes about 80% of the execution time of the whole code
# given a frame(2d array, x and y dimensions can be any integer 
# between 16 and 64) where "frame data" is stored under "frame"  
# and a window (2d array of size 4x4, 4x8, 8x4, 8x8, 8x16, 16x8 
# or 16x16) where "window data" is stored under "window" 
# and size of "window" and "frame" arrays are stored under 
# "asize"

# - initially current sum of difference is set to a very large value
# - move "window" over the "frame" one cell at a time starting with location (0,0)
# - moves are based on zigzag pattern 
# - for each move, function calculates  the sum of absolute difference (SAD) 
#   between the window and the overlapping block on the frame.
# - if the calculated sum of difference is LESS THAN OR EQUAL to the current sum of difference
#   then the current sum of difference is updated and the coordinate of the top left corner 
#   for that matching block in the frame is recorded. 

# for example SAD of two 4x4 arrays "window" and "block" shown below is 3  
# window         block
# -------       --------
# 1 2 2 3       1 4 2 3  
# 0 0 3 2       0 0 3 2
# 0 0 0 0       0 0 0 0 
# 1 0 0 5       1 0 0 4

# program keeps track of the window position that results 
# with the minimum sum of absolute difference. 
# after scannig the whole frame
# program returns the coordinates of the block with the minimum SAD
# in $v0 (row) and $v1 (col) 


# Sample Inputs and Output shown below:
# Frame:
#
#  0   1   2   3   0   0   0   0   0   0   0   0   0   0   0   0 
#  1   2   3   4   4   5   6   7   8   9  10  11  12  13  14  15 
#  2   3  32   1   2   3  12  14  16  18  20  22  24  26  28  30 
#  3   4   1   2   3   4  18  21  24  27  30  33  36  39  42  45 
#  0   4   2   3   4   5  24  28  32  36  40  44  48  52  56  60 
#  0   5   3   4   5   6  30  35  40  45  50  55  60  65  70  75 
#  0   6  12  18  24  30  36  42  48  54  60  66  72  78  84  90 
#  0   7  14  21  28  35  42  49  56  63  70  77  84  91  98 105 
#  0   8  16  24  32  40  48  56  64  72  80  88  96 104 112 120 
#  0   9  18  27  36  45  54  63  72  81  90  99 108 117 126 135 
#  0  10  20  30  40  50  60  70  80  90 100 110 120 130 140 150 
#  0  11  22  33  44  55  66  77  88  99 110 121 132 143 154 165 
#  0  12  24  36  48  60  72  84  96 108 120 132   0   1   2   3 
#  0  13  26  39  52  65  78  91 104 117 130 143   1   2   3   4 
#  0  14  28  42  56  70  84  98 112 126 140 154   2   3   4   5 
#  0  15  30  45  60  75  90 105 120 135 150 165   3   4   5   6 

# Window:
#  0   1   2   3 
#  1   2   3   4 
#  2   3   4   5 
#  3   4   5   6 

# cord x = 12, cord y = 12 returned in $v0 and $v1 registers

.text
.globl  vbsme

# Your program must follow zigzag pattern.  

# Preconditions:
#   1st parameter (a0) address of the first element of the dimension info (address of asize[0])
#   2nd parameter (a1) address of the first element of the frame array (address of frame[0][0])
#   3rd parameter (a2) address of the first element of the window array (address of window[0][0])
# Postconditions:	
#   result (v0) x coordinate of the block in the frame with the minimum SAD
#          (v1) y coordinate of the block in the frame with the minimum SAD


# $s0 = frameSizeY 
# $s1 = frameSizeX
# $s2 = windowSizeY
# $s3 = windowSizeX
# $s4 = loopflag
# $s5 = final location
# $s6 = current minimum value

# $t0-$t5 = temporary variables
# $t6 = frameLoc[row]
# $t7 = frameLoc[column]

# $a0 = asize
# $a1 = frame
# $a2 = window

# $v0 = min x
# $v1 = min y



vbsme:  

# Get frame sizes from memory and initialize x, y
   lw   $s0,  0($a0)                # s0 = a0[0] (frameSizeY)
   lw   $s1,  4($a0)                # s1 = a0[1] (frameSizeX)
   lw   $s2,  8($a0)                # s2 = a0[2] (windowSizeY) 
   lw   $s3, 12($a0)                # s3 = a0[3] (windowSizeX)
   li   $t6,  0                     # x = 0
   li   $t7,  0                     # y = 0

# Get Final Location
   sub  $t0, $s0, $s2               # t0 = frameSizeY - windowSizeY
   mul  $t0, $t0, $s1               # t0 = t0 * frameSizeX
   sub  $t1, $s1, $s3               # t1 = frameSizeX - windowSizeX
   add  $s5, $t0, $t1               # final location = t0 + t1

# Initialize min array
   sw   $t0, 4($sp)                 # current min = max int value
   li   $v0,  0                     # min x = 0
   li   $v1,  0 		    # min y = 0
   li   $s6,  9999 		    # current min = arbitrarily large int

   addi $sp, $sp, -4                # make room for 1 element on the stack
   sw   $ra, 0($sp)                 # store the return address for vbsme on the stack

# If windowSize is greater than frameSize in x or y direction
   slt  $t0, $s3, $s1               # is window column # less than frame column #
   slt  $t1, $s2, $s0               # is window row # less than frame row #
   or   $t0, $t0, $t1               # t0 = t0 | t1
   beq  $t0, $0,  endzigzag         # skip zigzag if window is larger

   jal sad                          # initial call to sad

# Error detect right initial
   sub  $t0, $s1, $s3               # t0 = frameSizeX - windowSizeX;
   slt  $t0, $t7, $t0               # t0 = (frameLoc[column] < t0)
   beq  $t0, $0, errordetectnexta   # if(frameLoc[column] < t0)
   jal  rightsubroutine             # move right
   j    doneerrordetectright        # skip else

# Error detect down initial
errordetectnexta:                   # else
   sub  $t0, $s0, $s2               # t0 = frameSizeY - windowSizeY
   slt  $t0, $t6, $t0               # t0 = (frameLoc[row] < t0)
   beq  $t0, $0, endzigzag          # if collision on right and down: exit vbsme
   jal  downsubroutine              # move down
doneerrordetectright:
   
   jal  sad                         # call to sad #2

# Main zigzag loop
zigzagloop:                         # while ((frameLoc[column] + frameLoc[row] * frameSizeX) < Final Location){
   mul  $t0, $t6, $s1               # t0 = frameLoc[row] * frameSizeX
   add  $t0, $t0, $t7               # t0 = t0 + frameLoc[column]
   slt  $t0, $t0, $s5               # t0 = (t0 < final location)
   beq  $t0, $0,  endzigzag         # exit loop and end zigzag

# Down-left Collision Detection
   addi $s4, $0, 1                  # loopflag = 1
dlcollisiondetect:
   beq  $s4, $0, edlcollisiondetect # if(loopflag == 0) end

# Check down
   sub  $t0, $s0, $s2               # t0 = frameSizeY - windowSizeY
   slt  $t0, $t6, $t0               # t0 = (frameLoc[row] < t0)
   beq  $t0, $0, downcollisiona     # if(t0 != 0)

# Check left
   slt  $t0, $0, $t7                # t0 = (0 < frameLoc[column])
   beq  $t0, $0, leftcollisiona     # if(t0 != 0)
   jal  downleftsubroutine          # move down and left
   j    downcollisionaend           # goto end of outer if

leftcollisiona:                     # left collision 
   jal  downsubroutine              # move down
   add  $s4, $0, $0                 # loopflag = 0
   j    downcollisionaend           # goto end of outer loop

downcollisiona:                     # down collision
   jal  rightsubroutine             # move right
   add  $s4, $0, $0 
downcollisionaend:
   jal  sad                         # check SAD
   j    dlcollisiondetect           # goto start of dl loop
edlcollisiondetect:

   jal  sad                         # check SAD

# Check if final location reached
   mul  $t0, $t6, $s1               # t0 = frameLoc[row] * frameSizeX
   add  $t0, $t0, $t7               # t0 = t0 + frameLoc[column]
   slt  $t0, $t0, $s5               # t0 = (t0 < final location)
   beq  $t0, $0,  endzigzag         # exit loop and end zigzag

# Up-Right Collision Detection
   addi $s4, $0, 1                  # loopflag = 1 
urcollisiondetect:
   beq  $s4, $0, eurcollisiondetect # if(loopflag == 0) end

# Check up
   slt  $t0, $0, $t6                # t0 = (frameLoc[row] > 0)
   beq  $t0, $0, upcollisiona       # if(t0 != 0)

# Check Right
   sub  $t0, $s1, $s3               # t0 = frameSizeX - windowSizeX
   slt  $t0, $t7, $t0               # t0 = (frameLoc[column] < t0)
   beq  $t0, $0,  rightcollisiona   # if(t0 != 0)
   jal  uprightsubroutine           # move up and right
   j    upcollisionaend             # goto end of outer if

rightcollisiona:
   jal  downsubroutine              # move down
   add  $s4, $0, $0                 # loopflag = 0
   j    upcollisionaend             # goto end of outer if

upcollisiona:
   sub  $t0, $s1, $s3               # t0 = frameSizeX - windowSizeX
   slt  $t0, $t7, $t0               # t0 = (frameLoc[column] < t0)
   beq  $t0, $0,  rightcollisionb   # if(t0 != 0)
   jal  rightsubroutine             # move right
   add  $s4, $0, $0                 # loopflag = 0
   j    upcollisionaend             # goto end of outer if
   
rightcollisionb:
   jal downsubroutine               # move down
   add  $s4, $0, $0                 # loopflag = 0  
upcollisionaend:
   jal  sad                         # check SAD
   j    urcollisiondetect           # goto beginning of up-right loop
eurcollisiondetect:
   jal  sad                         # check SAD   
   j    zigzagloop                  # goto beginning of main loop
endzigzag:
   lw   $ra, 0($sp)                 # get return address from the stack
   nop
   nop
   jr   $ra                         # return to function call


# SAD Function 
sad:
   nop
   add  $t0, $0, $0                 # set sum to 0
   add  $t1, $0, $0                 # set outer loop variable j to 0
sadouterloop:                       # for(int j = 0; j < windowSizeY; j++){
   slt  $t3, $t1, $s2               # t3 = (j < windowSizeY)
   beq  $t3, $0, sadouterloopend    # if(t3 == 0) exit outer loop
   add  $t2, $0, $0                 # set inner loop variable i to 0
sadinnerloop:                       # for(int i = 0; i < windowSizeX; i++) {
   slt  $t3, $t2, $s3               # t3 = (i < windowSizeX)
   beq  $t3, $0, sadinnerloopend    # if(t3 == 0) exit inner loop
   add  $t3, $t1, $t6               # t3 = j + frameLoc[row]
   mul  $t3, $t3, $s1               # t3 = t3 * frameSizeX          
   add  $t3, $t3, $t2               # t3 = t3 + i
   add  $t3, $t3, $t7               # t3 = t3 + frameLoc[column]
   sll  $t3, $t3, 2                 # t3 = t3 * 4
   mul  $t4, $t1, $s3               # t4 = j * windowSizeX
   add  $t4, $t4, $t2               # t4 = t4 + i
   sll  $t4, $t4, 2                 # t4 = t4 * 4
   add  $t3, $a1, $t3               # t3 = &frame[t3]
   add  $t4, $a2, $t4               # t4 = &frame[t4]
   lw   $t3, 0($t3)                 # t3 = *t3
   lw   $t4, 0($t4)                 # t4 = *t4
   sub  $t3, $t3, $t4               # t3 = t3 - t4
   slt  $t4, $t3, $0                # t4 = (t3 < 0)
   beq  $t4, $0, absifend           # if(t4 != 0)
   addi $t5, $0, -1                 # t5 = -1
   mul  $t3, $t3, $t5               # t3 = t3 * -1
absifend:
   add  $t0, $t0, $t3               # sum = sum + t3
   addi $t2, $t2, 1                 # i++
   j    sadinnerloop                # goto inner loop start
sadinnerloopend:
   addi $t1, $t1, 1                 # j++
   j    sadouterloop                # got outer loop start
sadouterloopend:
# Test if SAD is a minimum value and update
   beq  $t0, $s6, lteqcurrmin       # if(new sad == current min)
   slt  $t1, $t0, $s6               # t2 = (new sad < current min)
   beq  $t1, $0, lteqcurrminend     # if(newsad <= min)
lteqcurrmin:
   add  $s6, $t0, $0                # store new minimum
   add  $v0, $t6, $0                # store new min x
   add  $v1, $t7, $0                # store new min y
lteqcurrminend:
   jr   $ra                         # jump to next vbsme command

# Subroutines
rightsubroutine:
   addi $t7, $t7, 1                 # frameLoc[column]++
   jr   $ra                         # jump to next vbsme command

downleftsubroutine:
   addi $t6, $t6,  1                # frameLoc[row]++
   addi $t7, $t7, -1                # frameLoc[column]--
   jr   $ra                         # jump to next vbsme command

uprightsubroutine:
   addi $t6, $t6, -1                # frameLoc[row]++
   addi $t7, $t7,  1                # frameLoc[column]--
   jr   $ra                         # jump to next vbsme command

downsubroutine:
   addi $t6, $t6, 1                 # frameLoc[row]++
   jr   $ra                         # jump to next vbsme command

upsubroutine:
   addi $t6, $t6, -1                # frameLoc[row]--
   addi $t7, $t7,  1                # frameLoc[column]++
   jr   $ra                         # jump to next vbsme command

