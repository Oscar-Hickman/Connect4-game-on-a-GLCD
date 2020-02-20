#include p18f87k22.inc
  extern    fill_1, fill_2, fill_3, fill_4, fill_5, fill_6, fill_7
  global    won, ifwinner, winnerscreen

asc0	udata_acs
ifwinner    res 1   ;if ifwinner = 0x00 noones won, if equal to 0x01, there is a winner
  
Winner	code


	
won   ;determines whether a player has won the game

	clrf    ifwinner

	;1)looks at most recent move 

	
	;2)checks if 1 below it, if not goto 3) - if so goto 2a) 
	;2a)checks if 2 below it, if not goto 3)
	;2aa)checks if 3 are below i, if not goto 3) - if so goto 10)


	;3)checks if 1 bottom left of it, if not goto 4)
	;3a)checks if 2 bottom left of it, if not goto 3b)
	;3aa)checks if 3 are bottom left of it, if not goto 3ab)  -  if so goto 10)
	;3ab)checks if 1 top right of it (2 already bottom left), if not goto - if so goto 10)
	;3b)checks if 1 top right of it, (1 already bottom left), if not goto 4)
	;3bb)checks if 2 top right of it, (1 already bottom left), if not goto 4) - if so goto 10)


	;4)checks if 1 left of it, if not goto 5)
	;4a)checks if 2 left of it, if not goto 4b)
	;4aa)checks if 3 are left of it, if not goto 4ab)  -  if so goto 10)
	;4ab)checks if 1 right of it (2 already left), if not goto - if so goto 10)
	;4b)checks if 1 right of it, (1 already left), if not goto 5)
	;4bb)checks if 2 right of it, (1 already left), if not goto 5) - if so goto 10)


	;5)checks if 1 top left of it, if not goto 6)
	;5a)checks if 2 top left of it, if not goto 5b)
	;5aa)checks if 3 are top left of it, if not goto 5ab)  -  if so goto 10)
	;5ab)checks if 1 bottom right of it (2 already top left), if not goto - if so goto 10)
	;5b)checks if 1 bottom right of it, (1 already top left), if not goto 6)
	;5bb)checks if 2 bottom right of it, (1 already top left), if not goto 6) - if so goto 10)


	;6)checks if any are top right of it, if not goto 7)
	;6a)checks if 2 top right of it, if not goto 6b)
	;6aa)checks if 3 are top right of it, if not goto 6ab)  -  if so goto 10)
	;6ab)checks if 1 bottom left of it (2 already top right), if not goto - if so goto 10)
	;6b)checks if 1 bottom left of it, (1 already top right), if not goto 7)
	;6bb)checks if 2 bottom left of it, (1 already top right), if not goto 7) - if so goto 10)


	;7)checks if any are right of it, if not goto 8)
	;7a)checks if 2 right of it, if not goto 7b)
	;7aa)checks if 3 are right of it, if not goto 7ab)  -  if so goto 10)
	;7ab)checks if 1 left of it (2 already right), if not goto - if so goto 10)
	;7b)checks if 1 left of it, (1 already right), if not goto 8)
	;7bb)checks if 2 left of it, (1 already right), if not goto 8) - if so goto 10)


	;8)checks if any are bottom right of it, if not goto 9)
	;8a)checks if 2 are bottom right of it, if not goto 8b)
	;8aa)checks if 3 are botom right of it, if not goto 8ab)  -  if so goto 10)
	;8ab)checks if 1 left of it (2 already right), if not goto - if so goto 10)
	;8b)checks if 1 left of it, (1 already right), if not goto 9)
	;8bb)checks if 2 left of it, (1 already right), if not goto 9) - if so goto 10)


	;9)return cos no-ones won
	

	
	;10)displays a winner screen depending on whos turn it is

	return
	
winnerscreen
	return
	    

end
