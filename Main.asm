#include p18f87k22.inc

    extern  glcd_start_left, glcd_start_right, Keypad_test, glcd_grid, turn, move, ifwinner, winnerscreen, won
    global  go, fill_1, fill_2, fill_3, fill_4, fill_5, fill_6, fill_7, start
    
Reset_vector code
    org 0x0000
    goto start 
    
	

acs0	udata_acs   ; reserve data space in access ram
go  	res 1	    ;0x00 for naughts and 0x01 for crosses 
fill_1	res 1	    ; number of items in first column
fill_2	res 1	    ; number of items in second column
fill_3	res 1	    ; number of items in third column    
fill_4	res 1	    ; number of items in fourth column
fill_5	res 1	    ; number of items in fifth column
fill_6	res 1	    ; number of items in sixth column
fill_7	res 1	    ; number of items in seventh column
  
Main code	
 
start	
	clrf	go
	clrf	fill_1
	clrf	fill_2
	clrf	fill_3
	clrf	fill_4
	clrf	fill_5
	clrf	fill_6
	clrf	fill_7
	
	;Give the glcd the initial grid and player turns
	call glcd_grid
	
	
	Connect4loop
	
		call turn   ;switch to others go
 
		call Keypad_test
	
		call move   ;implement move
	
		call won    ;see if winner	 
		
		movlw	0x01
		cpfseq	ifwinner
		goto Connect4loop
	
		goto winnerscreen
		
    end
	
