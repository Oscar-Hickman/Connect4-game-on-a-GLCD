#include p18f87k22.inc

    extern  glcd_start_left, glcd_start_right, Keypad_test, glcd_grid, turn, move
    global  go
    
Reset_vector code
    org 0x0000
    goto start
	

acs0	udata_acs   ; reserve data space in access ram
go  res 1	;0x00 for naughts and 0x01 for crosses 
  
Main code	
 
start	
	clrf	go
	
	;Give the glcd the initial grid and player turns
	call glcd_grid
	
	call turn
	
	;goto press
 
	call Keypad_test
	
	call move
	
	call turn
	
	call Keypad_test
	
	call move
	
	call turn
	
	goto $


	
	
;implement move
;see if winner	goto 
;switch to others go
	
	
    end
	