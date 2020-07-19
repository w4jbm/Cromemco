10 REM Cromemco TU-ART Serial Port Echo (TUECHO.BAS)
20 REM
30 REM by Jim McClanahan W4JBM (July 2020)
40 REM
50 PRINT "Ports available for testing:"
60 PRINT " 1. 20H (TU-ART Serial A)"
70 PRINT " 2. 50H (TU-ART Serial B)"
80 INPUT "Which port";P
90 P=INT(P)
100 IF P<1 OR P>2 THEN GOTO 80
110 IF P=1 THEN P0=32:P1=33
120 IF P=2 THEN P0=80:P1=81
130 REM
140 REM Define some constants...
150 REM
160 R=9 : REM Send to reset port
170 M=0 : REM Interupt Mask
180 B=192 : REM Send for 9600 baud
190 E=128 : REM Buffer Empty Bit
200 REM
210 REM Port Setup for TU-ART
220 REM
230 OUT P0+2,R : REM Reset Port
240 OUT P0+3,M : REM Mask for No Interupts
250 OUT P0,B : REM Set to 9600 baud
260 REM
270 REM Begin to echo selected port...
280 REM
290 I=INP(P0) : REM See if there is a character ready to read
300 IF I AND 64 THEN 320 : REM A character is there
310 GOTO 290
320 J=INP(P1) : REM When a character is there, read it
330 GOSUB 390 : REM Check to see if we can output
340 OUT P1,J
350 IF J=13 THEN J=10:GOTO 330: REM to keep it neat, follow CR with LF
360 PRINT ".";
370 GOTO 290
380 STOP
390 REM
400 REM Check if port is ready
410 REM
420 Z=INP(P0)
430 IF Z AND E THEN RETURN
440 GOTO 420
