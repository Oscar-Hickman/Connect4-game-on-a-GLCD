#include p18f87k22.inc
	
	
global glcd_start_left, glcd_start_right, clear_glcd

	
	acs0	udata_acs   ; reserve data space in access ram
delay_count res 1   ; reserve one byte for counter in the delay routine
delay_count2 res 1
delay_count3 res 1

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
	
	; Turns off right half of glcd
	bsf	LATB,RB0
	; Turns on left half of glcd
	bcf	LATB,RB1
	call	delay

	;Turns the display on
	movlw	b'00111111'
	movwf	PORTD
	call	delay
	return
	
	
clear_glcd
	call glcd_start_left
	clrf 0x03
	clearhalf
		movlw	0xB8	;x address as 0
		clear_loop_x
			movwf	0x00	;store x in 0x00
			clrf	0x01	;store y in 0x01
			clear_loop_y
				movfw	0x00
				call	cmd_write
				movlw	0x00
				movwf	PORTD
				call	data_write
				;call	delay
				;see if y=63, skip to incf 0x00 if true
				incf	0x01
				movlw	0x3F	;y if equal to 63
				cpfseq	0x01    ;	;if y=63, incf x
				goto	clear_loop_y
				incf	0x00	;add one to x
				movlw	0xBF	;x if equal to 7
				cpfseq	0x00	;skips if gone through all rows	
				goto	clear_loop_x
				call	glcd_start_right
				movlw	0x01
				cpfseq	0x03	;skips if dun both halfs
				goto	clearhalf
	return
	
glcd_grid
	call glcd_start_left
	;write left grid and naughts box
	movlw	0xB8	;sets x = 0
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
	
	clrf	0x01	;clears the y counter
	movlw	0x45	;sets y = 5
	call	cmd_write
	
	therest1
		movlw	0x80
		movwf	PORTD
		call	data_write
		incf	0x01
		movlw	0x3A
		cpfseq	0x01	;if its got to the center
		goto	therest1

		
	movlw	0xB9	;sets x = 1
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
	
	movlw	0xBA	;sets x = 2
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
		
	movlw	0xBB	;sets x = 3
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
		
	movlw	0xBC	;sets x = 4
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
		
	movlw	0xBD	;sets x = 5
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
	
	
	movlw	0xBE	;sets x = 6
	call	cmd_write
	movlw	0x44	;sets y = 4
	call	cmd_write
	clrf	0x01
	therest2
		movlw	0x80
		movwf	PORTD
		call	data_write
		incf	0x01
		movlw	0x3A
		cpfseq	0x01	;if its got to the center
		goto	therest2
		
	
	;write naughts box
	
	
	call glcd_start_right
	;write right grid and player crosses box
	
	movlw	0xB8	;sets x = 0
	call	cmd_write
	movlw	0x40	;sets y = 0
	call	cmd_write
	
	clrf	0x01	;clears the y counter
	
	therest3
		movlw	0x80
		movwf	PORTD
		call	data_write
		incf	0x01
		movlw	0x3A
		cpfseq	0x01	;if its got to the right side
		goto	therest3
		
		movlw	0xFF
		movwf	PORTD
		call	data_write
		
	movlw	0xB9	;sets x = 1
	call	cmd_write
	movlw	0x7B	;sets y = 59
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
	
	movlw	0xBA	;sets x = 2
	call	cmd_write
	movlw	0x7B	;sets y = 59
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
		
	movlw	0xBB	;sets x = 3
	call	cmd_write
	movlw	0x7B	;sets y = 59
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
		
	movlw	0xBC	;sets x = 4
	call	cmd_write
	movlw	0x7B	;sets y = 59
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
		
	movlw	0xBD	;sets x = 5
	call	cmd_write
	movlw	0x7B	;sets y = 59
	call	cmd_write
	movlw	0xFF
	movwf	PORTD
	call	data_write
	
	
	movlw	0xBE	;sets x = 6
	call	cmd_write
	movlw	0x40	;sets y = 0
	call	cmd_write
	clrf	0x01
	therest4
		movlw	0x80
		movwf	PORTD
		call	data_write
		incf	0x01
		movlw	0x3A
		cpfseq	0x01	;if its got to the right side
		goto	therest4
	
	;write crosses box
	
	
	
	
	
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


	
	
	
data_write		; chip select signal, to select and enable which half you want
			; E pulsed from low to high.
			; rst pin
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

delay	movlw	0x00
	movwf	delay_count
	movwf	delay_count2
	
delay_1	movff	delay_count,delay_count3
	call	delay_2
	decfsz	delay_count2
	bra	delay_1	   
	return

delay_2	decfsz	delay_count3
	bra delay_2
	return
end