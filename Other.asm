#include p18f87k22.inc
    
Other code
 
 
 	
;	;Nothing Pressed
;	movlw	0xF0
;	CPFSEQ	PORTE    ;if row  is clear
;	goto	Lemon1
;	movlw	0x0F	       ;Keypad column
;	movwf	TRISE, ACCESS
;	call	LCD_delay_x4us
;	BTFSC	PORTE, 0x00    ;if column is clear
;	goto	Lemon1
;	;Nothing Pressed
;	movlw	0xFF	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;movlw	0x70
;	CPFSEQ	PORTE	       ;equal to fourth row
;	goto	Ade1
;	;A Pressed
;	movlw	0x0A	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;Ade1	
;	movlw	0x70
;	CPFSEQ	PORTE	       ;equal to fourth row
;	goto	Ade4
;	;0 Pressed
;	movlw	0x00	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;Ade4
;	CPFSEQ	PORTE, 0x70    ;equal to fourth row
;	goto	Ade7
;	;B Pressed
;	movlw	0x0B	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;Ade7
;Lemon4	
;	movlw	0x07
;	CPFSEQ	PORTE	       ;equal to fourth column (F,E,D,C)
;	goto	Lemon5
;	movlw	0xF0	       ;Keypad column
;	movwf	TRISE, ACCESS
;	call	LCD_delay_x4us
;	movlw	0x70
;	CPFSEQ	PORTE	       ;equal to fourth row 
;	goto	Ade10
;	;C Pressed
;	movlw	0x0C	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;Ade10
;	movlw	0xB0
;	CPFSEQ	PORTE	       ;equal to third row 
;	goto	Ade11
;	;D Pressed
;	movlw	0x0D	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;Ade11
;	movlw	0xD0
;	CPFSEQ	PORTE	       ;equal to second row 
;	goto	Ade12
;	;E Pressed
;	movlw	0x0E	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;Ade12
;	movlw	0xE0
;	CPFSEQ	PORTE	       ;equal to first column 
;	goto	Lemon5
;	;F Pressed
;	movlw	0x0F	
;	movwf	PORTJ, ACCESS
;	goto	Finish
;	
;	
;	
;	
;Lemon5
;	;Multiple Pressed
;	movlw	0xEE	
;	movwf	PORTJ, ACCESS
;	goto	Finish
 
 
 
;	    therest1
;		movlw	0x80
;		call	data_write
;		incf	y_ad
;		movlw	0x3A
;		cpfseq	y_ad	;if its got to the center
;		goto	therest1
;
;		
;	movlw	0xB9	;sets x = 1
;	call	cmd_write
;	movlw	0x44	;sets y = 4
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;	
;	movlw	0xBA	;sets x = 2
;	call	cmd_write
;	movlw	0x44	;sets y = 4
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;		
;	movlw	0xBB	;sets x = 3
;	call	cmd_write
;	movlw	0x44	;sets y = 4
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;		
;	movlw	0xBC	;sets x = 4
;	call	cmd_write
;	movlw	0x44	;sets y = 4
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;		
;	movlw	0xBD	;sets x = 5
;	call	cmd_write
;	movlw	0x44	;sets y = 4
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
    
    
    ;	
;	movlw	0xB8	;sets x = 0
;	call	cmd_write
;	movlw	0x40	;sets y = 0
;	call	cmd_write
;	
;	clrf	y_ad	;clears the y counter
;
;	bigloop1	    ;writes a line then 16 one with the top filled, x3, then a full, then 8 empties all x6 
;	    incf    ct3
;	    incf    x_ad
;	    movf    x_ad, W
;	    call    cmd_write
;	    movlw   0x44	;sets y = 4
;	    movwf   y_ad
;	    call    cmd_write
;	
;	    clrf	ct2
;	
;	    loop16
;	        incf    ct2
;	        movlw   0xFF
;	        call    data_write
;	        call    write_eg    ;writes 16 of emptys
;	        movlw   0x03	;counter if done three times
;	        cpfseq  ct2		;sees if its done it three times.	
;	        goto    loop16
;	
;	    
;	    movlw   0xFF
;	    call    data_write
;	    movlw   0x80
;	    call    data_write
;	    movlw   0x80
;	    call    data_write    
;	    movlw   0x80
;	    call    data_write    
;	    movlw   0x80
;	    call    data_write    
;	    movlw   0x80
;	    call    data_write    
;	    movlw   0x80
;	    call    data_write
;	    movlw   0x80
;	    call    data_write
;	    
;	    movlw   0x06	;counter if done six times
;	    cpfseq  ct3		;sees if its done it six times.	
;	    goto    bigloop1
;	    
;	
	
	
	
	
	
	
	
	
	
	
	
	
;	therest3
;		movlw	0x80
;		call	data_write
;		incf	y_ad
;		movlw	0x3A
;		cpfseq	y_ad	;if its got to the right side
;		goto	therest3
;		
;		movlw	0xFF
;		call	data_write
;		
;	movlw	0xB9	;sets x = 1
;	call	cmd_write
;	movlw	0x7B	;sets y = 59
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;	
;	movlw	0xBA	;sets x = 2
;	call	cmd_write
;	movlw	0x7B	;sets y = 59
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;		
;	movlw	0xBB	;sets x = 3
;	call	cmd_write
;	movlw	0x7B	;sets y = 59
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;		
;	movlw	0xBC	;sets x = 4
;	call	cmd_write
;	movlw	0x7B	;sets y = 59
;	call	cmd_write
;	movlw	0xFF
;	call	data_write
;		
;	movlw	0xBD	;sets x = 5
;	call	cmd_write
;	movlw	0x7B	;sets y = 59
;	call	cmd_write
;	movlw	0xFF
;	call	data_write

;clear_glcd
;	call glcd_start_left
;	clrf ct
;	clearhalf
;		incf ct		;left/right counter
;		movlw	0xB8	;x address as 0
;		movwf	x_ad	;store x address as 0
;		clear_loop_x
;		    	movlw	0x40	;y address as 0
;			movwf	y_ad
;			movf	x_ad, W	;changes x address
;			call	cmd_write
;			clear_loop_y
;				movlw	0x00	;clear column
;				call	data_write
;				
;				;see if y=63, skip to incf x if true
;				incf	y_ad
;				movlw	0x7F	;y if equal to 63
;				cpfseq	y_ad    ;if y=63, incf x
;				goto	clear_loop_y
;				incf	x_ad	;add one to x
;				movlw	0xBF	;x if equal to 7
;				cpfseq	x_ad	;skips if gone through all rows	
;				goto	clear_loop_x
;				call	glcd_start_right
;				movlw	0x02
;				cpfseq	ct	;skips if dun both halfs
;				goto	clearhalf
    
    
    
    
    
    
    
    
	return    
    
    
    
    
    END