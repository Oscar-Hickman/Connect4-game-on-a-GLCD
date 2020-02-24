 #include p18f87k22.inc
	
	
    global naughts, crosses
    extern  c_w, d_w
    
  
naughtsandcrosses	code
	
naughts
	;fill bottom line of the left half of the grid and naughts box
	movlw	0xBE	;sets x = 6
	call	c_w
	movlw	0x40	;sets y = 0
	call	c_w
	
	;write the line x = 6
	movlw	0x00	    
	call	d_w  ;y = 0	gap
	movlw	0xF8	    
	call	d_w  ;y = 1	letter N start
	movlw	0x70	    
	call	d_w  ;y = 2
	movlw	0x80	    
	call	d_w  ;y = 3
	movlw	0x01	    
	call	d_w  ;y = 4
	movlw	0xF9	    
	call	d_w  ;y = 5	letter N finish
	movlw	0x01	    	
	call	d_w  ;y = 6	gap
	call	d_w  ;y = 7	gap
	call	d_w  ;y = 8	letter A start
	movlw	0x81	    
	call	d_w  ;y = 9
	movlw	0x79	    
	call	d_w  ;y = 10
	movlw	0x81	    
	call	d_w  ;y = 11
	movlw	0x01	    
	call	d_w  ;y = 12	letter A finish
	call	d_w  ;y = 13	gap 
	call	d_w  ;y = 14	gap
	movlw	0xF9	    
	call	d_w  ;y = 15	letter U start
	movlw	0x01	    
	call	d_w  ;y = 16
	call	d_w  ;y = 17
	call	d_w  ;y = 18
	movlw	0xF9	    
	call	d_w  ;y = 19	letter U finish
	movlw	0x01	    
	call	d_w  ;y = 20	gap
	call	d_w  ;y = 21	gap
	movlw	0xF9	    
	call	d_w  ;y = 22	letter G start
	movlw	0x09	    
	call	d_w  ;y = 23
	call	d_w  ;y = 24
	call	d_w  ;y = 25
	call	d_w  ;y = 26	letter G finish
	movlw	0x01	    
	call	d_w  ;y = 27	gap
	call	d_w  ;y = 28	gap
	movlw	0xF9	    
	call	d_w  ;y = 29	letter H start
	movlw	0x01	    
	call	d_w  ;y = 30
	call	d_w  ;y = 31
	call	d_w  ;y = 32
	movlw	0xF9	    
	call	d_w  ;y = 33	letter H finish
	movlw	0x01	    
	call	d_w  ;y = 34	gap
	call	d_w  ;y = 35	gap
	movlw	0x09	    
	call	d_w  ;y = 36	letter T start    	
	call	d_w  ;y = 37
	movlw	0xF9	    
	call	d_w  ;y = 38
	movlw	0x09	    
	call	d_w  ;y = 39  
	call	d_w  ;y = 40	letter T finish
	movlw	0x01	    
	call	d_w  ;y = 41	gap
	call	d_w  ;y = 42	gap
	movlw	0xF9	    
	call	d_w  ;y = 43	letter S start
	movlw	0x89	    
	call	d_w  ;y = 44
	call	d_w  ;y = 45
	call	d_w  ;y = 46
	call	d_w  ;y = 47	letter S finish
	movlw	0x01	    
	call	d_w  ;y = 48	gap 
	call	d_w  ;y = 49	gap
	call	d_w  ;y = 50	gap
	movlw	0xF9	    
	call	d_w  ;y = 51	box start
	movlw	0x09	    
	call	d_w  ;y = 52
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	call	d_w  ;y = 61
	movlw	0xF9	    
	call	d_w  ;y = 62	box finish
	movlw	0x01	    
	call	d_w  ;y = 63	gap
	
	
	;write the second line
	movlw	0xBF	;sets x = 7
	call	c_w
	movlw	0x40	;sets y = 0
	call	c_w
	
	;write the line x = 7
	movlw	0x00	
	call	d_w  ;y = 0	gap
	movlw	0x7F	
	call	d_w  ;y = 1	letter N start
	movlw	0x00	
	call	d_w  ;y = 2
	movlw	0x03	
	call	d_w  ;y = 3
	movlw	0x1C	
	call	d_w  ;y = 4
	movlw	0x7F	
	call	d_w  ;y = 5	letter N finish
	movlw	0x00	
	call	d_w  ;y = 6	gap
	call	d_w  ;y = 7	gap
	movlw	0x78	
	call	d_w  ;y = 8	letter A start
	movlw	0x07	
	call	d_w  ;y = 9
	movlw	0x06	
	call	d_w  ;y = 10
	movlw	0x07	
	call	d_w  ;y = 11
	movlw	0x78	
	call	d_w  ;y = 12	letter A finish
	movlw	0x00	
	call	d_w  ;y = 13	gap 
	call	d_w  ;y = 14	gap
	movlw	0x7F	
	call	d_w  ;y = 15	letter U start
	movlw	0x40	
	call	d_w  ;y = 16
	call	d_w  ;y = 17
	call	d_w  ;y = 18
	movlw	0x7F	
	call	d_w  ;y = 19	letter U finish
	movlw	0x00	
	call	d_w  ;y = 20	gap
	call	d_w  ;y = 21	gap
	movlw	0x7F	
	call	d_w  ;y = 22	letter G start
	movlw	0x40	
	call	d_w  ;y = 23
	movlw	0x43	
	call	d_w  ;y = 24
	call	d_w  ;y = 25
	movlw	0x7F	
	call	d_w  ;y = 26	letter G finish
	movlw	0x00	
	call	d_w  ;y = 27	gap
	call	d_w  ;y = 28	gap
	movlw	0x7F	
	call	d_w  ;y = 29	letter H start
	movlw	0x01	
	call	d_w  ;y = 30
	call	d_w  ;y = 31
	call	d_w  ;y = 32
	movlw	0x7F	
	call	d_w  ;y = 33	letter H finish
	movlw	0x00	
	call	d_w  ;y = 34	gap
	call	d_w  ;y = 35	gap 
	call	d_w  ;y = 36	letter T start
	call	d_w  ;y = 37	
	movlw	0x7F	
	call	d_w  ;y = 38
	movlw	0x00	
	call	d_w  ;y = 39
	call	d_w  ;y = 40	letter T finish
	call	d_w  ;y = 41	gap
	call	d_w  ;y = 42	gap
	movlw	0x40	
	call	d_w  ;y = 43	letter S start
	call	d_w  ;y = 44
	call	d_w  ;y = 45
	call	d_w  ;y = 46
	movlw	0x7F	
	call	d_w  ;y = 47	letter S finish
	movlw	0x00	
	call	d_w  ;y = 48	gap 
	call	d_w  ;y = 49	gap
	call	d_w  ;y = 50	gap
	movlw	0x7F	
	call	d_w  ;y = 51	box start
	movlw	0x40	
	call	d_w  ;y = 52
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	call	d_w  ;y = 61
	movlw	0x7F	
	call	d_w  ;y = 62	box finish
	movlw	0x00	
	call	d_w  ;y = 63	gap
	
	return
	
	
	
	
	
crosses
	;fill bottom line of the right half of the grid and crosses box
	
	movlw	0xBE	;sets x = 6
	call	c_w
	movlw	0x40	;sets y = 0
	call	c_w
	
	;write the line x = 6
	movlw	0x01	
	call	d_w  ;y = 0	gap
	movlw	0xF9	
	call	d_w  ;y = 1	letter C start
	movlw	0x09	
	call	d_w  ;y = 2
	call	d_w  ;y = 3
	call	d_w  ;y = 4
	call	d_w  ;y = 5	letter C finish
	movlw	0x01	
	call	d_w  ;y = 6	gap
	call	d_w  ;y = 7	gap
	movlw	0xF9	
	call	d_w  ;y = 8	letter R start
	movlw	0x09	
	call	d_w  ;y = 9	
	call	d_w  ;y = 10	
	call	d_w  ;y = 11
	movlw	0xF9	
	call	d_w  ;y = 12	letter R finish
	movlw	0x01	
	call	d_w  ;y = 13	gap
	call	d_w  ;y = 14	gap
	movlw	0xF9	
	call	d_w  ;y = 15	letter O start
	movlw	0x09	
	call	d_w  ;y = 16
	call	d_w  ;y = 17
	call	d_w  ;y = 18
	movlw	0xF9	
	call	d_w  ;y = 19	letter O finish
	movlw	0x01	
	call	d_w  ;y = 20	gap
	call	d_w  ;y = 21	gap
	movlw	0xF9	
	call	d_w  ;y = 22	letter S start
	movlw	0x89	
	call	d_w  ;y = 23
	call	d_w  ;y = 24
	call	d_w  ;y = 25
	call	d_w  ;y = 26	letter S finish
	movlw	0x01	
	call	d_w  ;y = 27	gap
	call	d_w  ;y = 28	gap
	movlw	0xF9	
	call	d_w  ;y = 29	letter S start
	movlw	0x89	
	call	d_w  ;y = 30
	call	d_w  ;y = 31
	call	d_w  ;y = 32
	call	d_w  ;y = 33	letter S finish
	movlw	0x01	
	call	d_w  ;y = 34	gap
	call	d_w  ;y = 35	gap
	movlw	0xF9	
	call	d_w  ;y = 36	letter E start
	movlw	0x09	
	call	d_w  ;y = 37
	call	d_w  ;y = 38
	call	d_w  ;y = 39
	call	d_w  ;y = 40	letter E finish
	movlw	0x01	
	call	d_w  ;y = 41	gap
	call	d_w  ;y = 42	gap
	movlw	0xF9	
	call	d_w  ;y = 43	letter S start
	movlw	0x89	
	call	d_w  ;y = 44	
	call	d_w  ;y = 45
	call	d_w  ;y = 46
	call	d_w  ;y = 47	letter S finish
	movlw	0x01	
	call	d_w  ;y = 48	gap
	call	d_w  ;y = 49	gap
	call	d_w  ;y = 50	gap
	movlw	0xF9	
	call	d_w  ;y = 51	box start
	movlw	0x09	
	call	d_w  ;y = 52
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	movlw	0x09	    
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	movlw	0x08	
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	call	d_w  ;y = 61
	movlw	0xF8	
	call	d_w  ;y = 62	box finish
	movlw	0x00	
	call	d_w  ;y = 63	gap
	
	
	;write the second line
	movlw	0xBF	;sets x = 7
	call	c_w
	movlw	0x40	;sets y = 0
	call	c_w
	
	;write the line x = 7
	movlw	0x00	
	call	d_w  ;y = 0	gap
	movlw	0x7F	
	call	d_w  ;y = 1	letter C start
	movlw	0x40	
	call	d_w  ;y = 2
	call	d_w  ;y = 3
	call	d_w  ;y = 4
	call	d_w  ;y = 5	letter C finish
	movlw	0x00	
	call	d_w  ;y = 6	gap
	call	d_w  ;y = 7	gap
	movlw	0x7F	
	call	d_w  ;y = 8	letter R start
	movlw	0x05	
	call	d_w  ;y = 9	
	movlw	0x09	
	call	d_w  ;y = 10	
	movlw	0x11	
	call	d_w  ;y = 11	
	movlw	0x21	
	call	d_w  ;y = 12	letter R finish
	movlw	0x00	
	call	d_w  ;y = 13	gap
	call	d_w  ;y = 14	gap
	movlw	0x7F	
	call	d_w  ;y = 15	letter O start
	movlw	0x40	
	call	d_w  ;y = 16
	call	d_w  ;y = 17
	call	d_w  ;y = 18
	movlw	0x7F	
	call	d_w  ;y = 19	letter O finish
	movlw	0x00	
	call	d_w  ;y = 20	gap
	call	d_w  ;y = 21	gap
	movlw	0x40	
	call	d_w  ;y = 22	letter S start
	call	d_w  ;y = 23
	call	d_w  ;y = 24
	call	d_w  ;y = 25
	movlw	0x7F	
	call	d_w  ;y = 26	letter S finish
	movlw	0x00	
	call	d_w  ;y = 27	gap
	call	d_w  ;y = 28	gap
	movlw	0x40	
	call	d_w  ;y = 29	letter S start
	call	d_w  ;y = 30
	call	d_w  ;y = 31	
	call	d_w  ;y = 32
	movlw	0x7F	
	call	d_w  ;y = 33	letter S finish
	movlw	0x00	
	call	d_w  ;y = 34	gap
	call	d_w  ;y = 35	gap
	movlw	0x7F	
	call	d_w  ;y = 36	letter E start
	movlw	0x41	
	call	d_w  ;y = 37
	call	d_w  ;y = 38
	call	d_w  ;y = 39
	call	d_w  ;y = 40	letter E finish
	movlw	0x00	
	call	d_w  ;y = 41	gap
	call	d_w  ;y = 42	gap
	movlw	0x40	
	call	d_w  ;y = 43	letter S start
	call	d_w  ;y = 44	
	call	d_w  ;y = 45
	call	d_w  ;y = 46
	movlw	0x7F	
	call	d_w  ;y = 47	letter S finish
	movlw	0x00	
	call	d_w  ;y = 48	gap
	call	d_w  ;y = 49	gap
	call	d_w  ;y = 50	gap
	movlw	0x7F	
	call	d_w  ;y = 51	box start
	movlw	0x40	
	call	d_w  ;y = 52
	call	d_w  ;y = 53
	call	d_w  ;y = 54
	call	d_w  ;y = 55
	call	d_w  ;y = 56
	call	d_w  ;y = 57
	call	d_w  ;y = 58
	call	d_w  ;y = 59
	call	d_w  ;y = 60
	call	d_w  ;y = 61
	movlw	0x7F	
	call	d_w  ;y = 62	box finish
	movlw	0x00	
	call	d_w  ;y = 63	gap
	
	
	
	return
	
	

	
end