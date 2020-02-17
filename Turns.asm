#include p18f87k22.inc
	
    global  turn
    extern  c_w, d_w, glcd_start_left, glcd_start_right, go
   
Turns	code
	
turn	
	movlw   0x01	;sees whos go it is
	cpfseq  go		;0x00 for naughts, 0x01 for crosses
	goto    nau
	goto	cro
	
	
nau	;fills the naughts box - when go = 0x00
	call	glcd_start_left
	movlw	0xBE	;sets x = 6
	call	c_w
	movlw	0x75	;sets y = 53
	call	c_w
	
	movlw	0xE9     ;filled square
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	
	
	call	glcd_start_left
	movlw	0xBF	;sets x = 7
	call	c_w
	movlw	0x75	;sets y = 53
	call	c_w
	
	movlw	0x5F    ;filled square
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	
	incf	go
	goto	finish
	
	
cro	;fills the crosses box - when go = 0x01
	call glcd_start_right
	movlw	0xBE	;sets x = 6
	call	c_w
	movlw	0x75	;sets y = 53
	call	c_w
	
	movlw	0xE9     ;filled square
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	movlw	0xE8
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	
	
	call	glcd_start_left
	movlw	0xBF	;sets x = 7
	call	c_w
	movlw	0x75	;sets y = 53
	call	c_w
	
	movlw	0xBF     ;filled square
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	
	decf	go
	goto finish
	
	
finish
	return
    END