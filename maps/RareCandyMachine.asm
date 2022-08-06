_1RARECANDY_BASE_PRICE EQU 25*1
_5RARECANDY_BASE_PRICE EQU 24*5
_10RARECANDY_BASE_PRICE EQU 23*10
_25RARECANDY_BASE_PRICE EQU 21*25
_50RARECANDY_BASE_PRICE EQU 19*50
_99RARECANDY_BASE_PRICE EQU 16*99

RareCandyVendingMachine:
	opentext
	writetext VendingText
	waitbutton
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Candy1
	ifequal 2, .Candy5
	ifequal 3, .Candy10
	ifequal 4, .Candy25
	ifequal 5, .Candy50
	ifequal 6, .Candy99
	closetext
	end

.Candy1:
	checkmoney YOUR_MONEY, _1RARECANDY_BASE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, _1RARECANDY_BASE_PRICE
	getitemname STRING_BUFFER_3, RARE_CANDY
	sjump .VendItem

.Candy5:
	checkmoney YOUR_MONEY, _5RARECANDY_BASE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, _5RARECANDY_BASE_PRICE
	getitemname STRING_BUFFER_3, RARE_CANDY
	sjump .VendItem
	
.Candy10:
	checkmoney YOUR_MONEY, _10RARECANDY_BASE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, _10RARECANDY_BASE_PRICE
	getitemname STRING_BUFFER_3, RARE_CANDY
	sjump .VendItem
	
.Candy25:
	checkmoney YOUR_MONEY, _25RARECANDY_BASE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY, 25
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, _25RARECANDY_BASE_PRICE
	getitemname STRING_BUFFER_3, RARE_CANDY
	sjump .VendItem
	
.Candy50:
	checkmoney YOUR_MONEY, _50RARECANDY_BASE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY, 50
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, _50RARECANDY_BASE_PRICE
	getitemname STRING_BUFFER_3, RARE_CANDY
	sjump .VendItem
	
.Candy99:
	checkmoney YOUR_MONEY, _99RARECANDY_BASE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RARE_CANDY, 99
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, _99RARECANDY_BASE_PRICE
	getitemname STRING_BUFFER_3, RARE_CANDY
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext ClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext VendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext VendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y + 5
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "1 CANDY    ¥{d:_1RARECANDY_BASE_PRICE}@"
	db "5 CANDIES  ¥{d:_5RARECANDY_BASE_PRICE}@"
	db "10 CANDIES ¥{d:_10RARECANDY_BASE_PRICE}@"
	db "25 CANDIES ¥{d:_25RARECANDY_BASE_PRICE}@"
	db "50 CANDIES ¥{d:_50RARECANDY_BASE_PRICE}@"
	db "99 CANDIES ¥{d:_99RARECANDY_BASE_PRICE}@"
	db "CANCEL@"

ClangText:
	text "Clang!"

	para "@"
	text_ram wStringBuffer3
	text_start
	line "dropped out."
	done

VendingText:
	text "A vending machine!"
	line "Its full of"
	cont "RARE CANDY!"
	done

VendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

VendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done