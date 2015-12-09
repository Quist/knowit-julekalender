IDENTIFICATION DIVISION.
PROGRAM-ID. KNOW-IT-JULEKALENDER.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-CNT PIC 9(4) VALUE 0.
	01 WS-SUM PIC 9(9) VALUE 0.
	01 WS-REMAINDER PIC 9 VALUE 0.
	01 WS-TMP PIC 9(9) VALUE 0.
	01 Q PIC 9(5) VALUE 0.
	01 WS-REVERSED PIC 9(6) VALUE 0.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM PRIME-PARA WITH TEST AFTER UNTIL WS-CNT>1000.
	DISPLAY "Result: " WS-SUM
	STOP RUN.

	PRIME-PARA.
	IF FUNCTION MOD (WS-CNT, 7) IS EQUAL TO 0 THEN
   		MOVE WS-CNT TO WS-TMP
   		MOVE "000000" TO WS-REVERSED
   		PERFORM REVERSE-PARA UNTIL WS-TMP < 1
   		IF FUNCTION MOD (WS-REVERSED, 7) IS EQUAL TO 0 THEN
   			COMPUTE WS-SUM = WS-SUM + WS-CNT

   	END-IF.
    ADD 1 TO WS-CNT.

	REVERSE-PARA.
	DIVIDE WS-TMP BY 10 GIVING Q REMAINDER WS-REMAINDER.
	COMPUTE WS-REVERSED = WS-REVERSED * 10 + WS-REMAINDER.
	MOVE Q TO WS-TMP.

STOP-RUN.