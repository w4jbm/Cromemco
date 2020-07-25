100 REM Cromemco Serial Output Test (SOTEST.BAS)
110 REM for 16FDC console or TU-ART serial ports
120 REM
130 REM by Jim McClanahan W4JBM (July 2020)
140 REM
150 PRINT "Ports available for testing:"
160 PRINT " 1. 00H (Console on 16FDC Card)"
170 PRINT " 2. 20H (TU-ART Serial A)"
180 PRINT " 3. 50H (TU-ART Serial B)"
190 INPUT "Which port";P%
200 IF P%<1 OR P%>3 THEN GOTO 190
210 IF P%=1 THEN P0%=0:P1%=1:P2%=2:P3%=3
220 IF P%=2 THEN P0%=32:P1%=33:P2%=34:P3%=35
230 IF P%=3 THEN P0%=80:P1%=81:P2%=82:P3%=83
240 REM
250 REM Define some constants...
260 REM
270 R%=9 : REM Send to reset port
280 M%=0 : REM Interupt Mask
290 B%=192 : REM Send for 9600 baud
300 E%=128 : REM Buffer Empty Bit
310 W%=72 : REM Width to Print
320 O%=95 : REM Offset from first to last character
330 REM
340 REM Port Setup for TU-ART
350 REM
360 IF P%=1 THEN GOTO 400
370 OUT P2%,R% : REM Reset Port
380 OUT P3%,M% : REM Mask for No Interupts
390 OUT P0%,B% : REM Set to 9600 baud
400 REM
410 REM Start Printing
420 REM
430 FOR I%=32 TO 126
440 FOR J%=I% TO I%+W%
450 C%=J%:IF C%>126 THEN C%=C%-O%
460 GOSUB 590
470 OUT P1%,C%
480 NEXT J%
490 GOSUB 590
500 OUT P1%,13 : REM Carriage Return
510 GOSUB 590
520 OUT P1%,10 : REM Line Feed
530 IF P%<>1 THEN PRINT ".";
540 A$=INKEY$
550 IF LEN(A$)<>0 THEN 650
560 NEXT I%
570 GOTO 430
580 STOP
590 REM
600 REM Check if port is ready
610 REM
620 Z%=INP(P0%)
630 IF Z% AND E% THEN RETURN
640 GOTO 620
650 END
