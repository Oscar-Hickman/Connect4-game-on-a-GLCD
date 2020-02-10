#include p18f87k22.inc
	
	global  Keypad_test
	extern	LCD_delay_x4us
	
	;goto	start1
	
	;org 0x100		    ; Main code starts here at address 0x100

Keypad	code
	
Keypad_test
	movlw	0x00
	movwf	TRISJ, ACCESS	;getting output ready
	
	
	banksel PADCFG1 ; PADCFG1 is not in Access Bank!!
	bsf	PADCFG1,REPU,BANKED
	clrf	LATE
	
	;set port 0-3 high
	;see which of 4-7 low
	
	movlw	0x0F	;Keypad row
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
		
	;Nothing Pressed
	movlw	0xF0
	CPFSEQ	PORTE    ;if row  is clear
	goto	Lemon1
	movlw	0x0F	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	BTFSC	PORTE, 0x00    ;if column is clear
	goto	Lemon1
	;Nothing Pressed
	movlw	0xFF	
	movwf	PORTJ, ACCESS
	goto	Finish
	
Lemon1
	movlw	0x0E
	CPFSEQ	PORTE	       ;equal to first row 
	goto	Lemon2
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0x70
	CPFSEQ	PORTE	       ;equal to first column 
	goto	Ade1
	;1 Pressed
	movlw	0x01	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade1	
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to second column 
	goto	Ade2
	;4 Pressed
	movlw	0x04	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade2
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to third column 
	goto	Ade3
	;7 Pressed
	movlw	0x07	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade3
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to fourth column 
	goto	Lemon5
	;A Pressed
	movlw	0x0A	
	movwf	PORTJ, ACCESS
	goto	Finish

	
	
Lemon2
	movlw	0x0D
	CPFSEQ	PORTE	       ;equal to second row 
	goto	Lemon3
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0x70
	CPFSEQ	PORTE	       ;equal to first column
	goto	Ade4
	;2 Pressed
	movlw	0x02	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade4
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to second column 
	goto	Ade5
	;5 Pressed
	movlw	0x05	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade5
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to third column 
	goto	Ade6
	;8 Pressed
	movlw	0x08	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade6
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to fourth column 
	goto	Lemon5
	;0 Pressed
	movlw	0x00	
	movwf	PORTJ, ACCESS
	goto	Finish
	
	
	

Lemon3	
	movlw	0x0B
	CPFSEQ	PORTE	       ;equal to third row
	goto	Lemon4
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	CPFSEQ	PORTE, 0x70    ;equal to first column 
	goto	Ade7
	;3 Pressed
	movlw	0x03	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade7
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to second column 
	goto	Ade8
	;6 Pressed
	movlw	0x06	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade8
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to third column 
	goto	Ade9
	;9 Pressed
	movlw	0x09	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade9
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to fourth column 
	goto	Lemon5
	;B Pressed
	movlw	0x0B	
	movwf	PORTJ, ACCESS
	goto	Finish
	
	
	
	
Lemon4	
	movlw	0x07
	CPFSEQ	PORTE	       ;equal to fourth row
	goto	Lemon5
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0x70
	CPFSEQ	PORTE	       ;equal to first column 
	goto	Ade10
	;F Pressed
	movlw	0xFF	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade10
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to second column 
	goto	Ade11
	;E Pressed
	movlw	0x0E	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade11
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to third column 
	goto	Ade12
	;D Pressed
	movlw	0x0D	
	movwf	PORTJ, ACCESS
	goto	Finish
Ade12
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to fourth column 
	goto	Lemon5
	;C Pressed
	movlw	0x0C	
	movwf	PORTJ, ACCESS
	goto	Finish
	
	
	
	
Lemon5
	;Multiple Pressed
	movlw	0xEE	
	movwf	PORTJ, ACCESS
	goto	Finish
	
	
Finish	
	return

	
end