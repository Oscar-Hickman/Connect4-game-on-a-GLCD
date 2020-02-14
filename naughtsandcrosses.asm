#include p18f87k22.inc
	
	
    global naughts, crosses

    extern  cmd_write, data_write
    
  
glcd	code
	
naughts
	;fill bottom line of the left half of the grid and naughts box
	movlw	0xBE	;sets x = 6
	call	cmd_write
	movlw	0x41	;sets y = 1
	call	cmd_write
	
	;write the line x = 6
	movlw	0x1F	;y = 1	letter N start
	call	data_write
	movlw	0x0E	;y = 2
	call	data_write
	movlw	0x01	;y = 3
	call	data_write
	movlw	0x80	;y = 4
	call	data_write
	movlw	0x9F	;y = 5	letter N finish
	call	data_write
	movlw	0x80	;y = 6	gap
	call	data_write
	movlw	0x80	;y = 7	gap
	call	data_write
	movlw	0x80	;y = 8	letter A start
	call	data_write
	movlw	0x81	;y = 9
	call	data_write
	movlw	0x9E	;y = 10
	call	data_write
	movlw	0x81	;y = 11
	call	data_write
	movlw	0x80	;y = 12	letter A finish
	call	data_write
	movlw	0x80	;y = 13	gap 
	call	data_write
	movlw	0x80	;y = 14	gap
	call	data_write
	movlw	0x9F	;y = 15	letter U start
	call	data_write
	movlw	0x80	;y = 16
	call	data_write
	movlw	0x80	;y = 17
	call	data_write
	movlw	0x80	;y = 18
	call	data_write
	movlw	0x9F	;y = 19	letter U finish
	call	data_write
	movlw	0x80	;y = 20	gap
	call	data_write
	movlw	0x80	;y = 21	gap
	call	data_write
	movlw	0x9F	;y = 22	letter G start
	call	data_write
	movlw	0x90	;y = 23
	call	data_write
	movlw	0x90	;y = 24
	call	data_write
	movlw	0x90	;y = 25
	call	data_write
	movlw	0x9F	;y = 26	letter G finish
	call	data_write
	movlw	0x80	;y = 27	gap
	call	data_write
	movlw	0x80	;y = 28	gap
	call	data_write
	movlw	0x9F	;y = 29	letter H start
	call	data_write
	movlw	0x80	;y = 30
	call	data_write
	movlw	0x80	;y = 31
	call	data_write
	movlw	0x80	;y = 32
	call	data_write
	movlw	0x9F	;y = 33	letter H finish
	call	data_write
	movlw	0x80	;y = 34	gap
	call	data_write
	movlw	0x80	;y = 35	gap
	call	data_write
	movlw	0x90	;y = 36	letter T start
	call	data_write
	movlw	0x90	;y = 37	
	call	data_write
	movlw	0x9F	;y = 38
	call	data_write
	movlw	0x90	;y = 39
	call	data_write
	movlw	0x90	;y = 40	letter T finish
	call	data_write
	movlw	0x80	;y = 41	gap
	call	data_write
	movlw	0x80	;y = 42	gap
	call	data_write
	movlw	0x9F	;y = 43	letter S start
	call	data_write
	movlw	0x91	;y = 44
	call	data_write
	movlw	0x91	;y = 45
	call	data_write
	movlw	0x91	;y = 46
	call	data_write
	movlw	0x91	;y = 47	letter S finish
	call	data_write
	movlw	0x80	;y = 48	gap 
	call	data_write
	movlw	0x80	;y = 49	gap
	call	data_write
	movlw	0x80	;y = 50	gap
	call	data_write
	movlw	0x9F	;y = 51	box start
	call	data_write
	movlw	0x90	;y = 52
	call	data_write
	movlw	0x90	;y = 53
	call	data_write
	movlw	0x90	;y = 54
	call	data_write
	movlw	0x90	;y = 55
	call	data_write
	movlw	0x90	;y = 56
	call	data_write
	movlw	0x90	;y = 57
	call	data_write
	movlw	0x90	;y = 58
	call	data_write
	movlw	0x90	;y = 59
	call	data_write
	movlw	0x90	;y = 60
	call	data_write
	movlw	0x90	;y = 61
	call	data_write
	movlw	0x9F	;y = 62	box finish
	call	data_write
	
	
	
	;write the second line
	movlw	0xBF	;sets x = 7
	call	cmd_write
	movlw	0x41	;sets y = 1
	call	cmd_write
	
	;write the line x = 7
	movlw	0xFE	;y = 1	letter N start
	call	data_write
	movlw	0x00	;y = 2
	call	data_write
	movlw	0xC0	;y = 3
	call	data_write
	movlw	0x38	;y = 4
	call	data_write
	movlw	0xFE	;y = 5	letter N finish
	call	data_write
	movlw	0x00	;y = 6	gap
	call	data_write
	movlw	0x00	;y = 7	gap
	call	data_write
	movlw	0x1E	;y = 8	letter A start
	call	data_write
	movlw	0xE0	;y = 9
	call	data_write
	movlw	0x60	;y = 10
	call	data_write
	movlw	0xE0	;y = 11
	call	data_write
	movlw	0x1E	;y = 12	letter A finish
	call	data_write
	movlw	0x00	;y = 13	gap 
	call	data_write
	movlw	0x00	;y = 14	gap
	call	data_write
	movlw	0xFE	;y = 15	letter U start
	call	data_write
	movlw	0x02	;y = 16
	call	data_write
	movlw	0x02	;y = 17
	call	data_write
	movlw	0x02	;y = 18
	call	data_write
	movlw	0xFE	;y = 19	letter U finish
	call	data_write
	movlw	0x00	;y = 20	gap
	call	data_write
	movlw	0x00	;y = 21	gap
	call	data_write
	movlw	0xFE	;y = 22	letter G start
	call	data_write
	movlw	0x02	;y = 23
	call	data_write
	movlw	0xC2	;y = 24
	call	data_write
	movlw	0xC2	;y = 25
	call	data_write
	movlw	0xFE	;y = 26	letter G finish
	call	data_write
	movlw	0x00	;y = 27	gap
	call	data_write
	movlw	0x00	;y = 28	gap
	call	data_write
	movlw	0xFE	;y = 29	letter H start
	call	data_write
	movlw	0x80	;y = 30
	call	data_write
	movlw	0x80	;y = 31
	call	data_write
	movlw	0x80	;y = 32
	call	data_write
	movlw	0xFE	;y = 33	letter H finish
	call	data_write
	movlw	0x00	;y = 34	gap
	call	data_write
	movlw	0x00	;y = 35	gap
	call	data_write
	movlw	0x00	;y = 36	letter T start
	call	data_write
	movlw	0x00	;y = 37	
	call	data_write
	movlw	0xFE	;y = 38
	call	data_write
	movlw	0x00	;y = 39
	call	data_write
	movlw	0x00	;y = 40	letter T finish
	call	data_write
	movlw	0x80	;y = 41	gap
	call	data_write
	movlw	0x80	;y = 42	gap
	call	data_write
	movlw	0x02	;y = 43	letter S start
	call	data_write
	movlw	0x02	;y = 44
	call	data_write
	movlw	0x02	;y = 45
	call	data_write
	movlw	0x02	;y = 46
	call	data_write
	movlw	0xFE	;y = 47	letter S finish
	call	data_write
	movlw	0x00	;y = 48	gap 
	call	data_write
	movlw	0x00	;y = 49	gap
	call	data_write
	movlw	0x00	;y = 50	gap
	call	data_write
	movlw	0xFE	;y = 51	box start
	call	data_write
	movlw	0x02	;y = 52
	call	data_write
	movlw	0x02	;y = 53
	call	data_write
	movlw	0x02	;y = 54
	call	data_write
	movlw	0x02	;y = 55
	call	data_write
	movlw	0x02	;y = 56
	call	data_write
	movlw	0x02	;y = 57
	call	data_write
	movlw	0x02	;y = 58
	call	data_write
	movlw	0x02	;y = 59
	call	data_write
	movlw	0x02	;y = 60
	call	data_write
	movlw	0x02	;y = 61
	call	data_write
	movlw	0xFE	;y = 62	box finish
	call	data_write
	
	
	return
	
	
	
	
	
crosses
	;fill bottom line of the right half of the grid and crosses box
	
	movlw	0xBE	;sets x = 6
	call	cmd_write
	movlw	0x40	;sets y = 0
	call	cmd_write
	
	;write the line x = 6
	movlw	0x80	;y = 0	gap
	call	data_write
	movlw	0x9F	;y = 1	letter C start
	call	data_write
	movlw	0x90	;y = 2
	call	data_write
	movlw	0x90	;y = 3
	call	data_write
	movlw	0x90	;y = 4
	call	data_write
	movlw	0x90	;y = 5	letter C finish
	call	data_write
	movlw	0x80	;y = 6	gap
	call	data_write
	movlw	0x80	;y = 7	gap
	call	data_write
	movlw	0x9F	;y = 8	letter R start
	call	data_write
	movlw	0x90	;y = 9	
	call	data_write
	movlw	0x90	;y = 10	
	call	data_write
	movlw	0x90	;y = 11	
	call	data_write
	movlw	0x9F	;y = 12	letter R finish
	call	data_write
	movlw	0x80	;y = 13	gap
	call	data_write
	movlw	0x80	;y = 14	gap
	call	data_write
	movlw	0x9F	;y = 15	letter O start
	call	data_write
	movlw	0x90	;y = 16
	call	data_write
	movlw	0x90	;y = 17
	call	data_write
	movlw	0x90	;y = 18
	call	data_write
	movlw	0x9F	;y = 19	letter O finish
	call	data_write
	movlw	0x80	;y = 20	gap
	call	data_write
	movlw	0x80	;y = 21	gap
	call	data_write
	movlw	0x9F	;y = 22	letter S start
	call	data_write
	movlw	0x91	;y = 23
	call	data_write
	movlw	0x91	;y = 24
	call	data_write
	movlw	0x91	;y = 25
	call	data_write
	movlw	0x81	;y = 26	letter S finish
	call	data_write
	movlw	0x80	;y = 27	gap
	call	data_write
	movlw	0x80	;y = 28	gap
	call	data_write
	movlw	0x9F	;y = 29	letter S start
	call	data_write
	movlw	0x91	;y = 30
	call	data_write
	movlw	0x91	;y = 31
	call	data_write
	movlw	0x91	;y = 32
	call	data_write
	movlw	0x91	;y = 33	letter S finish
	call	data_write
	movlw	0x80	;y = 34	gap
	call	data_write
	movlw	0x80	;y = 35	gap
	call	data_write
	movlw	0x9F	;y = 36	letter E start
	call	data_write
	movlw	0x90	;y = 37
	call	data_write
	movlw	0x90	;y = 38
	call	data_write
	movlw	0x90	;y = 39
	call	data_write
	movlw	0x90	;y = 40	letter E finish
	call	data_write
	movlw	0x80	;y = 41	gap
	call	data_write
	movlw	0x80	;y = 42	gap
	call	data_write
	movlw	0x9F	;y = 43	letter S start
	call	data_write
	movlw	0x91	;y = 44	
	call	data_write
	movlw	0x91	;y = 45
	call	data_write
	movlw	0x91	;y = 46
	call	data_write
	movlw	0x91	;y = 47	letter S finish
	call	data_write
	movlw	0x80	;y = 48	gap
	call	data_write
	movlw	0x80	;y = 49	gap
	call	data_write
	movlw	0x80	;y = 50	gap
	call	data_write
	movlw	0x9F	;y = 51	box start
	call	data_write
	movlw	0x90	;y = 52
	call	data_write
	movlw	0x90	;y = 53
	call	data_write
	movlw	0x90	;y = 54
	call	data_write
	movlw	0x90	;y = 55
	call	data_write
	movlw	0x90	;y = 56
	call	data_write
	movlw	0x90	;y = 57
	call	data_write
	movlw	0x90	;y = 58
	call	data_write
	movlw	0x80	;y = 59
	call	data_write
	movlw	0x10	;y = 60
	call	data_write
	movlw	0x10	;y = 61
	call	data_write
	movlw	0x1F	;y = 62	box finish
	call	data_write
	
	
	;write the second line
	movlw	0xBF	;sets x = 7
	call	cmd_write
	movlw	0x40	;sets y = 0
	call	cmd_write
	
	;write the line x = 7
	movlw	0x80	;y = 0	gap
	call	data_write
	movlw	0xFE	;y = 1	letter C start
	call	data_write
	movlw	0x02	;y = 2
	call	data_write
	movlw	0x02	;y = 3
	call	data_write
	movlw	0x02	;y = 4
	call	data_write
	movlw	0x02	;y = 5	letter C finish
	call	data_write
	movlw	0x80	;y = 6	gap
	call	data_write
	movlw	0x80	;y = 7	gap
	call	data_write
	movlw	0xFE	;y = 8	letter R start
	call	data_write
	movlw	0xA0	;y = 9	
	call	data_write
	movlw	0x90	;y = 10	
	call	data_write
	movlw	0x88	;y = 11	
	call	data_write
	movlw	0x84	;y = 12	letter R finish
	call	data_write
	movlw	0x80	;y = 13	gap
	call	data_write
	movlw	0x80	;y = 14	gap
	call	data_write
	movlw	0xFE	;y = 15	letter O start
	call	data_write
	movlw	0x02	;y = 16
	call	data_write
	movlw	0x02	;y = 17
	call	data_write
	movlw	0x02	;y = 18
	call	data_write
	movlw	0xFE	;y = 19	letter O finish
	call	data_write
	movlw	0x80	;y = 20	gap
	call	data_write
	movlw	0x80	;y = 21	gap
	call	data_write
	movlw	0x02	;y = 22	letter S start
	call	data_write
	movlw	0x02	;y = 23
	call	data_write
	movlw	0x02	;y = 24
	call	data_write
	movlw	0x02	;y = 25
	call	data_write
	movlw	0xFE	;y = 26	letter S finish
	call	data_write
	movlw	0x80	;y = 27	gap
	call	data_write
	movlw	0x80	;y = 28	gap
	call	data_write
	movlw	0x02	;y = 29	letter S start
	call	data_write
	movlw	0x02	;y = 30
	call	data_write
	movlw	0x02	;y = 31
	call	data_write
	movlw	0x02	;y = 32
	call	data_write
	movlw	0xFE	;y = 33	letter S finish
	call	data_write
	movlw	0x80	;y = 34	gap
	call	data_write
	movlw	0x80	;y = 35	gap
	call	data_write
	movlw	0xFE	;y = 36	letter E start
	call	data_write
	movlw	0x82	;y = 37
	call	data_write
	movlw	0x82	;y = 38
	call	data_write
	movlw	0x82	;y = 39
	call	data_write
	movlw	0x82	;y = 40	letter E finish
	call	data_write
	movlw	0x80	;y = 41	gap
	call	data_write
	movlw	0x80	;y = 42	gap
	call	data_write
	movlw	0x02	;y = 43	letter S start
	call	data_write
	movlw	0x02	;y = 44	
	call	data_write
	movlw	0x02	;y = 45
	call	data_write
	movlw	0x02	;y = 46
	call	data_write
	movlw	0xFE	;y = 47	letter S finish
	call	data_write
	movlw	0x80	;y = 48	gap
	call	data_write
	movlw	0x80	;y = 49	gap
	call	data_write
	movlw	0x80	;y = 50	gap
	call	data_write
	movlw	0xFE	;y = 51	box start
	call	data_write
	movlw	0x02	;y = 52
	call	data_write
	movlw	0x02	;y = 53
	call	data_write
	movlw	0x02	;y = 54
	call	data_write
	movlw	0x02	;y = 55
	call	data_write
	movlw	0x02	;y = 56
	call	data_write
	movlw	0x02	;y = 57
	call	data_write
	movlw	0x02	;y = 58
	call	data_write
	movlw	0x02	;y = 59
	call	data_write
	movlw	0x02	;y = 60
	call	data_write
	movlw	0x02	;y = 61
	call	data_write
	movlw	0xFE	;y = 62	box finish
	call	data_write
	
	
	
	
	return
	
	

	
end