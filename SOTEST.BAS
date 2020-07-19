10 REM Cromemco Serial Output Test (SOTEST.BAS)
20 REM for 16FDC console or TU-ART serial ports
30 REM
40 REM by Jim McClanahan W4JBM (July 2020)
50 REM
60 PRINT "Ports available for testing:"
70 PRINT " 1. 00H (Console on 16FDC Card)"
80 PRINT " 2. 20H (TU-ART Serial A)"
90 PRINT " 3. 50H (TU-ART Serial B)"
100 INPUT "Which port";P
110 P=INT(P)
120 IF P<1 OR P>3 THEN GOTO 100
130 IF P=1 THEN P0=0:P1=1
140 IF P=2 THEN P0=32:P1=33
150 IF P=3 THEN P0=80:P1=81
160 REM
170 REM Define some constants...
180 REM
190 R=9 : REM Send to reset port
200 M=0 : REM Interupt Mask
210 B=192 : REM Send for 9600 baud
220 E=128 : REM Buffer Empty Bit
230 W=72 : REM Width to Print
240 O=95 : REM Offset from first to last character
250 REM
260 REM Port Setup for TU-ART
270 REM
280 IF P=1 THEN GOTO 320
290 OUT P0+2,R : REM Reset Port
300 OUT P0+3,M : REM Mask for No Interupts
310 OUT P0,B : REM Set to 9600 baud
320 REM
330 REM Start Printing
340 REM
350 FOR I=32 TO 126
360 FOR J=I TO I+W
370 C=J:IF C>126 THEN C=C-O
380 GOSUB 490
390 OUT P1,C
400 NEXT J
410 GOSUB 490
420 OUT P1,13 : REM Carriage Return
430 GOSUB 490
440 OUT P1,10 : REM Line Feed
450 IF P<>1 THEN PRINT ".";
460 NEXT I
470 GOTO 350
480 STOP
490 REM
500 REM Check if port is ready
510 REM
520 Z=INP(P0)
530 IF Z AND E THEN RETURN
540 GOTO 520
