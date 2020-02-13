#include p18f87k22.inc
	
	
global glcd_start
	
	acs0	udata_acs   ; reserve data space in access ram
delay_count res 1   ; reserve one byte for counter in the delay routine
delay_count2 res 1
delay_count3 res 1

glcd	code
 
glcd_start
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
	movwf	PORTD
	call	cmd_write
	call	delay

	
	
write_glcd
	;Sets the address to write to
	movlw	0xBA	    ;set x page (3)
	movwf	PORTD
	call	cmd_write

;	movlw	0x40	    ;set Y address (0)
;	movwf	PORTD
;	call	cmd_write

	
	;Write data
	movlw	0x00
	movwf	PORTD
	call	data_write
	
	
	call	delay
	goto 	glcd_start		    ; Re-run program from start

	
	
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