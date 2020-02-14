#include p18f87k22.inc
	
	
    global glcd_start_left, glcd_start_right, clear_glcd, cmd_write, data_write, glcd_grid
    extern  naughts, crosses

	
acs0	udata_acs   ; reserve data space in access ram
delay_count res 1   ; reserve one byte for counter in the delay routine
delay_count2 res 1
delay_count3 res 1
x_ad	res 1
y_ad	res 1
ct	res 1
ct2	res 1
ct3	res 1
	
glcd	code
 
glcd_start_left
	movlw	0xff
	movwf	delay_count
	
	; Sets port D and B to outputs
	clrf	TRISB
	clrf	TRISD
	
	; Sets RST to 1
	bsf	LATB, RB5
	
	; Turns off right half of glcd
	bsf	LATB,RB1
	; Turns on left half of glcd
	bcf	LATB,RB0
	call	delay

	;Turns the display on
	movlw	b'00111111'
	call	cmd_write
	call	delay
	return
	
glcd_start_right
	movlw	0xff
	movwf	delay_count
	
	; Sets port D and B to outputs
	clrf	TRISB
	clrf	TRISD
	
	; Sets RST to 1
	bsf	LATB, RB5
	
	; Turns off left half of glcd
	bsf	LATB,RB0
	; Turns on right half of glcd
	bcf	LATB,RB1
	call	delay

	;Turns the display on
	movlw	b'00111111'
	call	cmd_write
	call	delay
	return
	
	
clear_glcd
	call glcd_start_left
	clrf ct
	clearhalf
		incf ct		;left/right counter
		movlw	0xB8	;x address as 0
		movwf	x_ad	;store x address as 0
		clear_loop_x
		    	movlw	0x40	;y address as 0
			movwf	y_ad
			movf	x_ad, W	;changes x address
			call	cmd_write
			clear_loop_y
				movlw	0x00	;clear column
				call	data_write
				
				;see if y=63, skip to incf x if true
				incf	y_ad
				movlw	0x7F	;y if equal to 63
				cpfseq	y_ad    ;if y=63, incf x
				goto	clear_loop_y
				incf	x_ad	;add one to x
				movlw	0xBF	;x if equal to 7
				cpfseq	x_ad	;skips if gone through all rows	
				goto	clear_loop_x
				call	glcd_start_right
				movlw	0x02
				cpfseq	ct	;skips if dun both halfs
				goto	clearhalf
	return
	
glcd_grid
	call glcd_start_left
	;write left grid and naughts box
	movlw	0xB8	;sets x = 0
	movwf	x_ad
	clrf	ct3
	
	bigloop
	    incf    ct3
	    incf    x_ad
	    movf    x_ad, W
	    call    cmd_write
	    movlw   0x44	;sets y = 4
	    movwf   y_ad
	    call    cmd_write
	
	    clrf	ct2
	
	    loop16
	        incf    ct2
	        movlw   0xFF
	        call    data_write
	        call    write_eg    ;writes 16 of emptys
	        movlw   0x03	;counter if done three times
	        cpfseq  ct2		;sees if its done it three times.	
	        goto    loop16
	
	    
	    movlw   0xFF
	    call    data_write
	    movlw   0x80
	    call    data_write
	    movlw   0x80
	    call    data_write    
	    movlw   0x80
	    call    data_write    
	    movlw   0x80
	    call    data_write    
	    movlw   0x80
	    call    data_write    
	    movlw   0x80
	    call    data_write
	    movlw   0x80
	    call    data_write
	    
	    movlw   0x06	;counter if done six times
	    cpfseq  ct3		;sees if its done it six times.	
	    
	    
	
	
	
;	
;	
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
	;write naughts box and bottom line of the grid
	call	naughts
	
	
;	;write right grid and player crosses box
;	
;	call glcd_start_right	    
;	
;	movlw	0xB8	;sets x = 0
;	call	cmd_write
;	movlw	0x40	;sets y = 0
;	call	cmd_write
;	
;	clrf	y_ad	;clears the y counter
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
;	
;	;write crosses box and bottom line of the grid
;	call	crosses
;			
;	
	return

	
write_eg
	clrf	ct
	
	sixteen
	    movlw   0x80
	    call    data_write
	    incf    ct
	    movlw   0x10
	    cpfseq  y_ad	;if its got to the center
	    goto sixteen
	    
	return    

;write_data	
;	;Write data
;	movlw	0x00
;	movwf	PORTD
;	call	data_write
;	
;	
;	call	delay
;	goto 	glcd_start		    ; Re-run program from start


	
	
	
data_write		
	
	; chip select signal, to select and enable which half you want
	; E pulsed from low to high.
	; rst pin
	movwf	PORTD
	
	; Sets RS to 1
	bsf	LATB, RB2
	; Sets R/w to 0
	bcf	LATB, RB3	
	; High to low pulse on enable
	bsf	LATB,RB4
	call	delay
	bcf	LATB,RB4
	return

	
	
cmd_write
	movwf	PORTD
	; Sets RS to 0
	bcf	LATB, RB2
	; Sets R/W to 0
	bcf	LATB, RB3
	; Sets E to 1 to 0
	bsf	LATB,RB4
	call	delay
	bcf	LATB,RB4
	call	delay
	return

delay	clrf	delay_count
	clrf	delay_count2
	
delay_1	movff	delay_count,delay_count3
	call	delay_2
	decfsz	delay_count2
	bra	delay_1	   
	return

delay_2	decfsz	delay_count3
	bra delay_2
	return
    end