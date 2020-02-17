#include p18f87k22.inc

    extern  glcd_start_left, glcd_start_right, Keypad_test, glcd_grid, turn
    global  go
    
Reset_vector code
    org 0x0000
    goto start
	
go  res 1	;0x00 for naughts and 0x01 for crosses 
  
Main code	
 
start	
	clrf	go
	
	;Give the glcd the initial grid and player turns
	call glcd_grid
	
	call turn
	
	;goto press
 
	call Keypad_test

	




	
	
;implement move
;see if winner	goto 
;switch to others go
	
	
    end
	