DECLARE SUB StartKaffe ()
DECLARE SUB Kaffe ()
DECLARE SUB Skjerm ()
DECLARE SUB Inventory ()
DECLARE SUB Vent (ok)
DECLARE SUB Rensk ()
DECLARE SUB Botte ()
DECLARE SUB Vann ()
DECLARE SUB Kraptolyff ()
DECLARE SUB Kaffekanne ()
DECLARE SUB Intro ()
DECLARE SUB Outro (Pjuk)
COMMON SHARED Inventory.Last
COMMON SHARED Inventory.1$
COMMON SHARED Inventory.2$
COMMON SHARED Inventory.3$
COMMON SHARED Pil.Y
COMMON SHARED Bronn
COMMON SHARED Kaffekopp
COMMON SHARED Kaffetrakter
COMMON SHARED KaffeFerdig
COMMON SHARED Kopp.1
COMMON SHARED Kopp.2
COMMON SHARED Kopp.3
COMMON SHARED Kopp.4
COMMON SHARED Prosent
COMMON SHARED Koppen
COMMON SHARED Koppto
COMMON SHARED Kopptre
COMMON SHARED Koppfire
Intro
COLOR 1, 7
CLS
Inventory.Last = 3
Pil.Y = 3
Figur.X = 40
Figur.Y = 12
Skjerm
Inventory
r$ = CHR$(0)
east$ = r$ + "M"
north$ = r$ + "H"
south$ = r$ + "P"
west$ = r$ + "K"
COLOR 14, 3
LOCATE Figur.Y, Figur.X: PRINT CHR$(2)
Vent 1
COLOR 4, 7: LOCATE 22, 4: PRINT "NÜ mÜ du trakte og servere kaffe fõr gjestene kommer!"
Vent 3
Rensk
Videre:
DO
a$ = INKEY$

IF KaffeFerdig = 2 THEN StartKaffe
IF Koppen = 1 AND Koppto = 1 AND Kopptre = 1 AND Koppfire = 1 THEN Outro 0

IF Figur.X = 22 AND Figur.Y = 6 THEN
COLOR 4, 7
LOCATE 22, 4: PRINT "Kaffetrakter!"
Kaffetrakter = 1
ELSE Kaffetrakter = 0
END IF

IF Figur.Y = 15 THEN
        IF Figur.X = 52 THEN Kopp.1 = 1 ELSE Kopp.1 = 0
        IF Figur.X = 54 THEN Kopp.2 = 1 ELSE Kopp.2 = 0
        IF Figur.X = 56 THEN Kopp.3 = 1 ELSE Kopp.3 = 0
        IF Figur.X = 58 THEN Kopp.4 = 1 ELSE Kopp.4 = 0
END IF

IF NOT Figur.Y = 15 THEN
Kopp.1 = 0
Kopp.2 = 0
Kopp.3 = 0
Kopp.4 = 0
END IF

IF Figur.X = 52 AND Figur.Y = 15 OR Figur.X = 54 AND Figur.Y = 15 OR Figur.X = 56 AND Figur.Y = 15 OR Figur.X = 58 AND Figur.Y = 15 THEN
COLOR 4, 7
LOCATE 22, 4: PRINT "Kaffekopp!"
Kaffekopp = 1
ELSE Kaffekopp = 0
END IF

IF Figur.X = 58 AND Figur.Y = 6 OR Figur.X = 59 AND Figur.Y = 7 THEN
COLOR 4, 7
LOCATE 22, 4: PRINT "Brõnn!"
Bronn = 1
ELSE Bronn = 0
END IF

'Bõtta!
IF Figur.X = 20 AND Figur.Y = 16 AND Bucket = 0 THEN
IF Inventory.1$ = "" THEN Inventory.1$ = "Bõtte": GOTO Neste
IF Inventory.2$ = "" THEN Inventory.2$ = "Bõtte": GOTO Neste
IF Inventory.3$ = "" THEN Inventory.3$ = "Bõtte": GOTO Neste
Neste:
Rensk
LOCATE 22, 4
PRINT "Du finner ei bõtte!"
Vent 2
Inventory.Last = Inventory.Last + 1
Inventory
Bucket = 1
END IF

'Kraptolyff!
IF Figur.Y = 14 AND Figur.X = 45 AND Krap = 0 THEN
IF Inventory.1$ = "" THEN Inventory.1$ = "Kraptolyff": GOTO Neste2
IF Inventory.2$ = "" THEN Inventory.2$ = "Kraptolyff": GOTO Neste2
IF Inventory.3$ = "" THEN Inventory.3$ = "Kraptolyff": GOTO Neste2
Neste2:

Rensk
LOCATE 22, 4
PRINT "Du finner en kraptolyff!"
Vent 2
Inventory.Last = Inventory.Last + 1
Inventory
Krap = 1
END IF

'Kaffepulver!
IF Figur.Y = 10 AND Figur.X = 32 AND Pulver = 0 THEN
IF Inventory.1$ = "" THEN Inventory.1$ = "Kaffepulver": GOTO Neste3
IF Inventory.2$ = "" THEN Inventory.2$ = "Kaffepulver": GOTO Neste3
IF Inventory.3$ = "" THEN Inventory.3$ = "Kaffepulver": GOTO Neste3
Neste3:

Rensk
LOCATE 22, 4
PRINT "Du finner en pose Evergood traktekaffe!"
Vent 2
Inventory.Last = Inventory.Last + 1
Inventory
Pulver = 1
END IF

SELECT CASE a$

CASE CHR$(13)
IF Inventory.1$ = "" THEN
Rensk
LOCATE 22, 4
PRINT "Inventarlista er tom!"
END IF
IF Inventory.Last - 3 > 0 THEN

COLOR 15, 3
LOCATE 1, 3: PRINT "INVENTARLISTE"
COLOR 1, 7
LOCATE Pil.Y, 2: PRINT ""
LOCATE Pil.Y, 16: PRINT ""
COLOR 14
IF Pil.Y = 3 THEN LOCATE Pil.Y, 3: PRINT Inventory.1$
IF Pil.Y = 4 THEN LOCATE Pil.Y, 3: PRINT Inventory.2$
IF Pil.Y = 5 THEN LOCATE Pil.Y, 3: PRINT Inventory.3$
DO
y$ = INKEY$
SELECT CASE y$

CASE CHR$(13)
IF Pil.Y = 3 AND Inventory.1$ = "Kaffepulver" THEN Kaffe: GOTO InventoryUT
IF Pil.Y = 4 AND Inventory.2$ = "Kaffepulver" THEN Kaffe: GOTO InventoryUT
IF Pil.Y = 5 AND Inventory.3$ = "Kaffepulver" THEN Kaffe: GOTO InventoryUT

IF Pil.Y = 3 AND Inventory.1$ = "Bõtte" THEN Botte: GOTO InventoryUT
IF Pil.Y = 4 AND Inventory.2$ = "Bõtte" THEN Botte: GOTO InventoryUT
IF Pil.Y = 5 AND Inventory.3$ = "Bõtte" THEN Botte: GOTO InventoryUT

IF Pil.Y = 3 AND Inventory.1$ = "Bõtte m/ vann" THEN Vann: GOTO InventoryUT
IF Pil.Y = 4 AND Inventory.2$ = "Bõtte m/ vann" THEN Vann: GOTO InventoryUT
IF Pil.Y = 5 AND Inventory.3$ = "Bõtte m/ vann" THEN Vann: GOTO InventoryUT

IF Pil.Y = 3 AND Inventory.1$ = "Kraptolyff" THEN Kraptolyff: GOTO InventoryUT
IF Pil.Y = 4 AND Inventory.2$ = "Kraptolyff" THEN Kraptolyff: GOTO InventoryUT
IF Pil.Y = 5 AND Inventory.3$ = "Kraptolyff" THEN Kraptolyff: GOTO InventoryUT

IF Pil.Y = 3 AND Inventory.1$ = "Kaffekanne" THEN Kaffekanne: GOTO InventoryUT
IF Pil.Y = 4 AND Inventory.2$ = "Kaffekanne" THEN Kaffekanne: GOTO InventoryUT
IF Pil.Y = 5 AND Inventory.3$ = "Kaffekanne" THEN Kaffekanne: GOTO InventoryUT

CASE CHR$(27)
LOCATE Pil.Y, 2: PRINT " "
LOCATE Pil.Y, 16: PRINT " "

InventoryUT:
Pil.Y = 3
Inventory
EXIT DO

CASE north$
COLOR 0
IF Pil.Y = 3 THEN LOCATE Pil.Y, 3: PRINT Inventory.1$
IF Pil.Y = 4 THEN LOCATE Pil.Y, 3: PRINT Inventory.2$
IF Pil.Y = 5 THEN LOCATE Pil.Y, 3: PRINT Inventory.3$
LOCATE Pil.Y, 2: PRINT " "
LOCATE Pil.Y, 16: PRINT " "
Pil.Y = Pil.Y - 1
IF Pil.Y = 2 THEN Pil.Y = Inventory.Last - 1
COLOR 1, 7
LOCATE Pil.Y, 2: PRINT ""
LOCATE Pil.Y, 16: PRINT ""
COLOR 14
IF Pil.Y = 3 THEN LOCATE Pil.Y, 3: PRINT Inventory.1$
IF Pil.Y = 4 THEN LOCATE Pil.Y, 3: PRINT Inventory.2$
IF Pil.Y = 5 THEN LOCATE Pil.Y, 3: PRINT Inventory.3$

CASE south$
COLOR 0
IF Pil.Y = 3 THEN LOCATE Pil.Y, 3: PRINT Inventory.1$
IF Pil.Y = 4 THEN LOCATE Pil.Y, 3: PRINT Inventory.2$
IF Pil.Y = 5 THEN LOCATE Pil.Y, 3: PRINT Inventory.3$
LOCATE Pil.Y, 2: PRINT " "
LOCATE Pil.Y, 16: PRINT " "
IF NOT Inventory.2$ = "" THEN Pil.Y = Pil.Y + 1: GOTO 405
IF NOT Inventory.3$ = "" THEN Pil.Y = Pil.Y + 1
405
IF Pil.Y > Inventory.Last - 1 THEN Pil.Y = 3
COLOR 1, 7
LOCATE Pil.Y, 2: PRINT ""
LOCATE Pil.Y, 16: PRINT ""
COLOR 14
IF Pil.Y = 3 THEN LOCATE Pil.Y, 3: PRINT Inventory.1$
IF Pil.Y = 4 THEN LOCATE Pil.Y, 3: PRINT Inventory.2$
IF Pil.Y = 5 THEN LOCATE Pil.Y, 3: PRINT Inventory.3$

END SELECT
LOOP
END IF

CASE CHR$(27)
Rensk
LOCATE 22, 4: PRINT "Vil du avslutte KaffeTrakteSpillet?"
DO
e$ = INKEY$
SELECT CASE LCASE$(e$)
CASE "j": GOTO Quit
CASE "n": Rensk: GOTO Videre
CASE CHR$(0) TO CHR$(255): Rensk: GOTO Videre
END SELECT
LOOP

CASE east$
Rensk
COLOR 14, 3
LOCATE Figur.Y, Figur.X: PRINT " "
Figur.X = Figur.X + 1
IF Figur.X = 60 THEN Figur.X = 59
IF Figur.X = 51 AND Figur.Y = 16 THEN Figur.X = 50
IF Figur.X = 59 AND Figur.Y = 6 THEN Figur.X = 58
LOCATE Figur.Y, Figur.X: PRINT CHR$(2)

CASE west$
Rensk
COLOR 14, 3
LOCATE Figur.Y, Figur.X: PRINT " "
Figur.X = Figur.X - 1
IF Figur.X = 19 THEN Figur.X = 20
IF Figur.X = 21 AND Figur.Y >= 6 AND Figur.Y <= 8 THEN Figur.X = 22
LOCATE Figur.Y, Figur.X: PRINT CHR$(2)

CASE north$
Rensk
COLOR 14, 3
LOCATE Figur.Y, Figur.X: PRINT " "
Figur.Y = Figur.Y - 1
IF Figur.Y = 5 THEN Figur.Y = 6
IF Figur.X = 20 AND Figur.Y = 8 THEN Figur.X = 20: Figur.Y = 9
IF Figur.X = 21 AND Figur.Y = 8 THEN Figur.X = 21: Figur.Y = 9
IF Figur.X = 59 AND Figur.Y = 6 THEN Figur.Y = 7
LOCATE Figur.Y, Figur.X: PRINT CHR$(2)

CASE south$
Rensk
COLOR 14, 3
LOCATE Figur.Y, Figur.X: PRINT " "
Figur.Y = Figur.Y + 1
IF Figur.Y = 17 THEN Figur.Y = 16
IF Figur.Y = 16 AND Figur.X >= 51 THEN Figur.Y = 15
LOCATE Figur.Y, Figur.X: PRINT CHR$(2)

END SELECT
LOOP


Quit:
Outro 1
SYSTEM


SUB Botte

IF Bronn = 1 THEN

Rensk
LOCATE 22, 4
PRINT "Du fyller bõtta med vann!"
Vent 2
Rensk

IF Inventory.1$ = "Bõtte" THEN
Inventory.1$ = "Bõtte m/ vann"
GOTO Subslutt2
END IF

IF Inventory.2$ = "Bõtte" THEN
Inventory.2$ = "Bõtte m/ vann"
GOTO Subslutt2
END IF

IF Inventory.3$ = "Bõtte" THEN
Inventory.3$ = "Bõtte m/ vann"
GOTO Subslutt2
END IF

END IF

Rensk
LOCATE 22, 4
PRINT "Du kan ikke bruke bõtta her!"

IF Kaffetrakter = 1 THEN Vent 2: Rensk
IF Kaffekopp = 1 THEN Vent 2: Rensk

Subslutt2:

END SUB

SUB Intro
SCREEN 13, 20
r = 15
Introen$ = UCASE$("Nyresopp Software Presenterer")

FOR a = 1 TO LEN(Introen$)
r = r + 1
IF r > 31 THEN r = 31
COLOR r
LOCATE 12, 40 / 2 - LEN(Introen$) / 2
PRINT MID$(Introen$, 1, a)
yh = TIMER
DO
sec = TIMER - yh
IF sec >= .06 THEN EXIT DO
LOOP
NEXT a
Vent 2
r = 31
FOR b = LEN(Introen$) TO 1 STEP -1
COLOR r
LOCATE 12, 40 / 2 - LEN(Introen$) / 2
PRINT Introen$
r = r - 1
IF r < 16 THEN r = 16
yh = TIMER
DO
sec = TIMER - yh
IF sec >= .06 THEN EXIT DO
LOOP
NEXT b

SCREEN 0
WIDTH 80, 25
Drit:
COLOR 14, 0
CLS
COLOR , 7
FOR g = 1 TO 6
LOCATE g, 1: PRINT STRING$(80, 32)
NEXT g
h$ = "KAFFETRAKTESPILLET"
h2$ = "----------------------------------------------------------"
h3$ = "{F1} - START      {F2} - INSTRUKSJONER      {F3} - AVSLUTT"
LOCATE 3, 80 / 2 - LEN(h$) / 2: PRINT h$
COLOR 9
LOCATE 4, 80 / 2 - LEN(h2$) / 2: PRINT h2$
COLOR 0
LOCATE 5, 80 / 2 - LEN(h2$) / 2: PRINT h3$
COLOR 1
LOCATE 5, 11: PRINT "{F1}"
LOCATE 5, 29: PRINT "{F2}"
LOCATE 5, 55: PRINT "{F3}"
COLOR , 0
COLOR 8: LOCATE 7, 2: PRINT STRING$(78, 223)
COLOR 15, 7: LOCATE 1, 1: PRINT "€ﬂ"
LOCATE 1, 79: PRINT "ﬂ€"
LOCATE 6, 1: PRINT "€‹"
LOCATE 6, 79: PRINT "‹€"
DO
rt$ = INKEY$
SELECT CASE rt$

CASE CHR$(0) + ";"
GOTO Subslut50

CASE CHR$(0) + "<"
GOSUB Info

CASE CHR$(0) + "="
COLOR 7, 0
CLS
SYSTEM

END SELECT
LOOP

Info:
LOCATE 9, 1
COLOR 7, 0
PRINT "Du har invitert Super Ruru, Doodlestick Jones og RTY-Pjuk pÜ kaffebesõk."
PRINT "Fõlgelig mÜ du sette over en kanne kaffe for Ü sikre kaffebesõkets suksess."
PRINT "I tillegg til dette forventer gjestene at de fÜr kaffen ferdig servert."
PRINT ""
PRINT "Du kontrollerer deg selv ("; CHR$(2); "  du) med piltastene. PÜ din ferd vil du dumpe"
PRINT "over nyttige objekter, og for Ü ta med deg disse forflytter du deg bare til"
PRINT "samme felt som objektet. Objektet vil nÜ dukke opp i inventarlisten din."
PRINT "For tilgang til inventaret trykker du [enter]. NÜ vil det dukke opp en markõr"
PRINT "i inventarlisten. Flytt markõren med piltastene til den befinner seg ved"
PRINT "objektet du õnsker Ü benytte. Trykk deretter [enter] igjen for Ü gjennomfõre"
PRINT "operasjonen."
PRINT ""
PRINT "Nederst pÜ skjermen finner du beskjedlinja. Den formidler informasjon om hva du"
PRINT "foretar deg."
COLOR 8: LOCATE 23, 54: PRINT "[side 1/2 - trykk en tast]"
DO
LOOP WHILE INKEY$ = ""
FOR yu = 8 TO 23
LOCATE yu, 1: PRINT STRING$(80, 32)
NEXT yu

COLOR 7
LOCATE 9, 1
PRINT "MÜlet med spillet er: 1. Samle ingrediensene du behõver for Ü trakte kaffe"
PRINT "                      2. Trakte kaffe"
PRINT "                      3. Servere kaffen"
PRINT ""
PRINT "Du kan nÜr som helst trykke [escape] for Ü avslutte spillet."
PRINT ""
PRINT ""
PRINT "Lykke til!"
COLOR 8: LOCATE 23, 54: PRINT "[side 2/2 - trykk en tast]"
DO
LOOP WHILE INKEY$ = ""

GOTO Drit

Subslut50:
END SUB

SUB Inventory
LOCATE 1, 1
COLOR 0, 7
PRINT "⁄[INVENTARLISTE]ø"
PRINT "√ƒ-----˙˙-----ƒƒ¥"
PRINT "                 "
PRINT "                 "
PRINT "                 "
PRINT "                 "
PRINT "                 "
PRINT "                 "
PRINT "                 "
PRINT "                 "
IF NOT Inventory.1$ = "" THEN
LOCATE 3, 1: PRINT "≥               ≥"
LOCATE 3, 1: PRINT "≥ " + Inventory.1$
END IF
IF NOT Inventory.2$ = "" THEN
LOCATE 4, 1: PRINT "≥               ≥"
LOCATE 4, 1: PRINT "≥ " + Inventory.2$
END IF
IF NOT Inventory.3$ = "" THEN
LOCATE 5, 1: PRINT "≥               ≥"
LOCATE 5, 1: PRINT "≥ " + Inventory.3$
END IF
LOCATE Inventory.Last, 1: PRINT "¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ"
END SUB

SUB Kaffe

IF Kaffetrakter = 1 THEN
Rensk
LOCATE 22, 4
PRINT "Du heller kaffepulveret i kaffefilteret!"
KaffeFerdig = KaffeFerdig + 1
Vent 2
Rensk

IF Inventory.1$ = "Kaffepulver" THEN
Inventory.1$ = ""
Inventory.1$ = Inventory.2$
Inventory.2$ = Inventory.3$
Inventory.3$ = ""
Inventory.Last = Inventory.Last - 1
GOTO Subslutt
END IF

IF Inventory.2$ = "Kaffepulver" THEN
Inventory.2$ = Inventory.3$
Inventory.3$ = ""
Inventory.Last = Inventory.Last - 1
GOTO Subslutt
END IF

IF Inventory.3$ = "Kaffepulver" THEN
Inventory.3$ = ""
Inventory.Last = Inventory.Last - 1
GOTO Subslutt
END IF

END IF

Rensk
LOCATE 22, 4
PRINT "Du kan ikke bruke kaffepulveret her!"

IF Bronn = 1 THEN Vent 2: Rensk
IF Kaffekopp = 1 THEN Vent 2: Rensk

Subslutt:
END SUB

SUB Kaffekanne

IF Kopp.1 = 1 THEN

IF Koppen = 1 THEN
Rensk
LOCATE 22, 4: PRINT "Koppen er allerede full!"
Vent 2
Rensk
GOTO Subslutt100
END IF


Rensk
LOCATE 22, 4
PRINT "Du heller kaffe i kaffekoppen!"
Vent 2
Rensk
COLOR 15, 6
LOCATE 16, 52
PRINT "õ"
Koppen = 1
GOTO Subslutt100
END IF

IF Kopp.2 = 1 THEN

IF Koppto = 1 THEN
Rensk
LOCATE 22, 4: PRINT "Koppen er allerede full!"
Vent 2
Rensk
GOTO Subslutt100
END IF

Rensk
LOCATE 22, 4
PRINT "Du heller kaffe i kaffekoppen!"
Vent 2
Rensk
COLOR 15, 6
LOCATE 16, 54
PRINT "õ"
Koppto = 1
END IF

IF Kopp.3 = 1 THEN

IF Kopptre = 1 THEN
Rensk
LOCATE 22, 4: PRINT "Koppen er allerede full!"
Vent 2
Rensk
GOTO Subslutt100
END IF
Rensk
LOCATE 22, 4
PRINT "Du heller kaffe i kaffekoppen!"
Vent 2
Rensk
COLOR 15, 6
LOCATE 16, 56
PRINT "õ"
Kopptre = 1
END IF

IF Kopp.4 = 1 THEN

IF Koppfire = 1 THEN
Rensk
LOCATE 22, 4: PRINT "Koppen er allerede full!"
Vent 2
Rensk
GOTO Subslutt100
END IF

Rensk
LOCATE 22, 4
PRINT "Du heller kaffe i kaffekoppen!"
Vent 2
Rensk
COLOR 15, 6
LOCATE 16, 58
PRINT "õ"
Koppfire = 1
END IF

IF Kaffekopp = 0 THEN
Rensk
LOCATE 22, 4
PRINT "Du kan ikke bruke kaffekannen her!"
IF Kaffetrakter = 1 THEN Vent 2
IF Bronn = 1 THEN Vent 2
END IF

Subslutt100:
END SUB

SUB Kraptolyff

Rensk
LOCATE 22, 4: PRINT "Du kan ikke bruke kraptolyffen her!"

IF Kaffetrakter = 1 THEN Vent 2: Rensk
IF Bronn = 1 THEN Vent 2: Rensk
IF Kaffekopp = 1 THEN Vent 2: Rensk

END SUB

SUB Outro (Pjuk)
IF Pjuk = 1 THEN GOTO Author
Vent 3
COLOR 13, 0
LOCATE 10, 33: PRINT "⁄ƒƒƒƒƒƒƒƒƒƒƒø"
LOCATE 11, 33: PRINT "≥           ≥"
LOCATE 12, 33: PRINT "¿ƒƒƒƒƒƒƒƒƒƒƒŸ"
COLOR 14
LOCATE 11, 35: PRINT "S L U T T"
Vent 3

COLOR , 1
CLS
Vent 1
PRINT "Det banker pÜ dõra. Det er gjestene som kommer..."
PRINT ""
Vent 3
COLOR 7
PRINT "Super Ruru:"
COLOR 15
PRINT "Ja, dette var sannelig god kaffe!"
PRINT ""
PRINT ""
Vent 3
COLOR 7
PRINT "Doodlestick Jones:"
COLOR 15
PRINT "Ja, det skal vëre visst!"
PRINT ""
PRINT ""
Vent 3
COLOR 7
PRINT "RTY-Pjuk:"
COLOR 15
PRINT "Ja, her har vi virkelig en fõrsteklasses vert!"
PRINT ""
PRINT ""
Vent 3
COLOR 7
PRINT "Alle i kor:"
COLOR 15
PRINT "HURRA FOR DEG, DU SOM SERVERTE OSS!!!"
PRINT ""
PRINT ""
Vent 3
COLOR 7
PRINT "Programutviklerne:"
COLOR 14
PRINT "GRATULERER! Du har klart KaffeTrakteSpillet!!!"
Vent 7
Author:
COLOR 7, 0
CLS
COLOR 14
LOCATE 1, 1
PRINT "Takk for at du spilte KaffeTrakteSpillet!"
PRINT ""
COLOR 15
PRINT "IdÇ og design: Bjõrn Arild Kristiansen"
PRINT "Programmering: Yngvar Kristiansen"
PRINT "Hjelpeprogrammering: Bjõrn Arild Kristiansen"
PRINT ""
COLOR 8
PRINT "(C) Nyresopp Software 1998"
COLOR 1
LOCATE 9, 1
FOR a = 1 TO 45
LOCATE 8, a: PRINT "ƒ"
NEXT a
FOR b = 1 TO 8
LOCATE b, 46: PRINT "≥"
IF b = 8 THEN LOCATE b, 46: PRINT "Ÿ"
NEXT b
COLOR 7

SYSTEM
END SUB

SUB Rensk
COLOR 4, 7
LOCATE 22, 4
PRINT STRING$(74, 32)
END SUB

SUB Skjerm
'kraptolyff
LOCATE 5, 18: PRINT STRING$(44, 219)
LOCATE 6, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 7, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 8, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 9, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 10, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 11, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 12, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 13, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 14, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 15, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 16, 18: PRINT "€€"; STRING$(40, 32); "€€"
LOCATE 17, 18: PRINT STRING$(44, 219)
COLOR 3, 7
FOR a = 6 TO 16
LOCATE a, 20: PRINT ""; STRING$(40, 219)
NEXT a
COLOR 4
LOCATE 22, 2: PRINT ">"
COLOR 6, 6
LOCATE 6, 20: PRINT "  "
LOCATE 7, 20: PRINT "  "
LOCATE 8, 20: PRINT "  "
COLOR 15
LOCATE 6, 20: PRINT "uÙ"
COLOR 15, 6
LOCATE 16, 51: PRINT STRING$(9, 32)
LOCATE 16, 52: PRINT "o o o o"
COLOR 15, 3
LOCATE 16, 20: PRINT "‚"
LOCATE 14, 45: PRINT "Ë"
LOCATE 10, 32: PRINT CHR$(127)
COLOR 1
LOCATE 6, 59: PRINT CHR$(4)
'asc
END SUB

SUB StartKaffe
h = TIMER
Rensk

LOCATE 22, 4
PRINT "Du starter trakteren!"
Vent 2
Rensk

DO
Sek = TIMER - h
IF Sek > .03 THEN Prosent = Prosent + 1: Sek = 0: h = TIMER
LOCATE 22, 4
PRINT "Kaffen trakter. Forlõpsindikator: "; Prosent; "%"
IF Prosent >= 100 THEN
Vent 2
Rensk
KaffeFerdig = KaffeFerdig + 1
GOTO Ferdig
END IF
LOOP
Ferdig:
Rensk
LOCATE 22, 4
PRINT "Kaffen er ferdig!"
Vent 2

Rensk
COLOR , 6
LOCATE 6, 20: PRINT " "

IF Inventory.1$ = "" THEN Inventory.1$ = "Kaffekanne": GOTO Neste100
IF Inventory.2$ = "" THEN Inventory.2$ = "Kaffekanne": GOTO Neste100
IF Inventory.3$ = "" THEN Inventory.3$ = "Kaffekanne": GOTO Neste100
Neste100:
Inventory.Last = Inventory.Last + 1
Inventory

END SUB

SUB Vann

IF Bronn = 1 THEN
Rensk
LOCATE 22, 4
PRINT "Bõtta er allerede full!"
Vent 2
Rensk
GOTO Subslutt3
END IF

IF Kaffetrakter = 1 THEN
Rensk
LOCATE 22, 4
PRINT "Du heller vann i trakteren!"
KaffeFerdig = KaffeFerdig + 1
Vent 2
Rensk

IF Inventory.1$ = "Bõtte m/ vann" THEN
Inventory.1$ = ""
Inventory.1$ = Inventory.2$
Inventory.2$ = Inventory.3$
Inventory.3$ = ""
Inventory.Last = Inventory.Last - 1
GOTO Subslutt3
END IF

IF Inventory.2$ = "Bõtte m/ vann" THEN
Inventory.2$ = Inventory.3$
Inventory.3$ = ""
Inventory.Last = Inventory.Last - 1
GOTO Subslutt3
END IF

IF Inventory.3$ = "Bõtte m/ vann" THEN
Inventory.3$ = ""
Inventory.Last = Inventory.Last - 1
GOTO Subslutt3
END IF

END IF

Rensk
LOCATE 22, 4
PRINT "Du kan ikke bruke bõtta her!"

IF Kaffekopp = 1 THEN Vent 2: Rensk

Subslutt3:
END SUB

SUB Vent (ok)
q = TIMER
DO
ur$ = INKEY$
Sek = INT(TIMER - q)
IF Sek = ok THEN EXIT DO
SELECT CASE ur$

CASE ELSE

END SELECT
LOOP
END SUB

