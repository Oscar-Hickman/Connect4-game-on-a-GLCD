#include p18f87k22.inc

	extern  glcd_start_left, glcd_start_right, Keypad_test, clear_glcd, glcd_grid

Main code
;goto Shiqi
	
Shiqi
        call Keypad_test
	goto Shiqi
	return

;Clear GLCD
call glcd_start_left
call clear_glcd
call glcd_start_right
call clear_glcd

;Give the glcd the initial grid and player turns
;call glcd_grid



	
	
end
	