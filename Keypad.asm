#include p18f87k22.inc
	
	global  Keypad_test, key_out, Keypad_reset, game_reset
	extern	LCD_delay_x4us, start

acs0	udata_acs   ; reserve data space in access ram
key_out res 1  ; column which player wants to play to
	
Keypad	code
	
Keypad_test
	movlw	0x00
	;movwf	TRISJ, ACCESS	;getting output ready
	clrf	key_out		;intially 0
	
	banksel PADCFG1 ; PADCFG1 is not in Access Bank!!
	bsf	PADCFG1,REPU,BANKED
	clrf	LATE
	
	;set port 0-3 high
	;see which of 4-7 low
	
	movlw	0x0F	;Keypad row
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	
	movlw	0x0E
	CPFSEQ	PORTE	       ;equal to first column (1,4,7) 
	goto	Col2
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to third row
	goto	C1Row2
	;7 Pressed
	movlw	0x07	
	movwf	key_out
	return
	
C1Row2
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to second row
	goto	C1Row1
	;4 Pressed
	movlw	0x04	
	movwf	key_out
	return
	
C1Row1
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to first row
	goto	Keypad_test
	;1 Pressed
	movlw	0x01	
	movwf	key_out
	return

	
	
Col2
	movlw	0x0D
	CPFSEQ	PORTE	       ;equal to second column (2,5,8)
	goto	Col3
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to second row ;5
	goto	C2Row1
	;5 Pressed
	movlw	0x05	
	movwf	key_out
	return
	
C2Row1
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to first row  ;2
	goto	Col3
	;2 Pressed
	movlw	0x02	
	movwf	key_out
	return
	
	
	

Col3	
	movlw	0x0B
	CPFSEQ	PORTE	       ;equal to third column (3,6,9)
	goto	Col4
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to second row ;6
	goto	C3Row1
	;6 Pressed
	movlw	0x06	
	movwf	key_out
	return
	
C3Row1
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to first row  ;3
	goto	Col4
	;3 Pressed
	movlw	0x03	
	movwf	key_out
	return
	
	
Col4	;clear screen
	movlw	0x07
	CPFSEQ	PORTE	       ;equal to fourth column (C)
	goto	Keypad_test
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0x70
	CPFSEQ	PORTE	       ;equal to fourth row ;6
	goto	Keypad_test
	;C Pressed
	goto	start
	
	
Keypad_reset
	movlw	0x00
	;movwf	TRISJ, ACCESS	;getting output ready
	clrf	key_out		;intially 0
	
	banksel PADCFG1 ; PADCFG1 is not in Access Bank!!
	bsf	PADCFG1,REPU,BANKED
	clrf	LATE
	
	;set port 0-3 high
	;see which of 4-7 low
	
	movlw	0x0F	;Keypad row
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	
	movlw	0x0F
	CPFSEQ	PORTE	       ;equal to first column (1,4,7) 
	goto	Keypad_reset
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0xF0
	CPFSEQ	PORTE	       ;equal to third row
	goto	Keypad_reset
	return
	
game_reset
	movlw	0x00
	;movwf	TRISJ, ACCESS	;getting output ready
	clrf	key_out		;intially 0
	
	banksel PADCFG1 ; PADCFG1 is not in Access Bank!!
	bsf	PADCFG1,REPU,BANKED
	clrf	LATE
	
	;set port 0-3 high
	;see which of 4-7 low
	
	movlw	0x0F	;Keypad row
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0x07
	CPFSEQ	PORTE	       ;equal to fourth column (C)
	goto	game_reset
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0x70
	CPFSEQ	PORTE	       ;equal to fourth row ;6
	goto	game_reset
	;C Pressed
	goto	start

	
	
    end