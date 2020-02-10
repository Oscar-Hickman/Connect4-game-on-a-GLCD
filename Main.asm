#include p18f87k22.inc

	extern  glcd_start, Keypad_test

Main code
;goto Shiqi
	
Shiqi
        call Keypad_test
	goto Shiqi
	return
	
goto glcd_start


	
	
end
	