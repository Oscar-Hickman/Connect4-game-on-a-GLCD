#include p18f87k22.inc
	
	global  Keypad_test
	extern	LCD_delay_x4us	
	;goto	start1
	
	;org 0x100		    ; Main code starts here at address 0x100

Keypad	code
	
Keypad_test
	movlw	0x00
	movwf	TRISJ, ACCESS	;getting output ready
	clrf	PORTJ	;intially 0
	
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
	movwf	PORTJ, ACCESS
	goto	Finish
C1Row2
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to second row
	goto	C1Row1
	;4 Pressed
	movlw	0x04	
	movwf	PORTJ, ACCESS
	goto	Finish
C1Row1
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to first row
	goto	Keypad_test
	;1 Pressed
	movlw	0x01	
	movwf	PORTJ, ACCESS
	goto	Finish

	
	
Col2
	movlw	0x0D
	CPFSEQ	PORTE	       ;equal to second column (2,5,8)
	goto	Col3
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to third row
	goto	C2Row2
	;8 Pressed
	movlw	0x08	
	movwf	PORTJ, ACCESS
	goto	Finish
C2Row2
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to second row
	goto	C2Row1
	;5 Pressed
	movlw	0x05	
	movwf	PORTJ, ACCESS
	goto	Finish
C2Row1
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to first row
	goto	Col3
	;2 Pressed
	movlw	0x02	
	movwf	PORTJ, ACCESS
	goto	Finish
	
	
	

Col3	
	movlw	0x0B
	CPFSEQ	PORTE	       ;equal to third column (3,6,9)
	goto	Keypad_test
	movlw	0xF0	       ;Keypad column
	movwf	TRISE, ACCESS
	call	LCD_delay_x4us
	movlw	0xB0
	CPFSEQ	PORTE	       ;equal to third row
	goto	C3Row2
	;9 Pressed
	movlw	0x09	
	movwf	PORTJ, ACCESS
	goto	Finish
C3Row2
	movlw	0xD0
	CPFSEQ	PORTE	       ;equal to second row
	goto	C3Row1
	;6 Pressed
	movlw	0x06	
	movwf	PORTJ, ACCESS
	goto	Finish
C3Row1
	movlw	0xE0
	CPFSEQ	PORTE	       ;equal to first row
	goto	Keypad_test
	;3 Pressed
	movlw	0x03	
	movwf	PORTJ, ACCESS
	goto	Finish
	
	
	
	
Finish	
	return

	

    end