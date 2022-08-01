      ******************************************************************
      * Author: Isaac Carlo Billones - Jeanne Margaret Guzon
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACTIVITY4.

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
                FILE-CONTROL.
                    SELECT ITEMLIST ASSIGN TO "C:\Cobol\ITEMLIST.dat"
                    ORGANIZATION IS SEQUENTIAL
                    ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.
           FD ITEMLIST.
           01 ITEMS.
               05 ITEM_ID PIC 9(5).
               05 FILLER PIC X(5) VALUE SPACES.
               05 ITEM_NAME PIC X(25).
               05 ITEM_COST PIC 9(6).99.

           WORKING-STORAGE SECTION.
           01 WS-ITEMS.
                05 WS-ITEM_ID PIC 9(5).
                05 WS-ITEM_NAME PIC X(25).
                05 WS-ITEM_COST PIC 9(6).99.
           01 WS_EOF PIC X.
           01 ENTRY-OK PIC X.

       PROCEDURE DIVISION.
       MAIN.
            OPEN EXTEND ITEMLIST.
            MOVE 'Y' TO WS_EOF.
            PERFORM ADD_ITEM
                 UNTIL WS_EOF = 'N'.
            CLOSE ITEMLIST.
            STOP RUN.

       GET_ITEM_INFO.
            DISPLAY "ITEM ID:".
            ACCEPT WS-ITEM_ID.
            DISPLAY "ITEM NAME:".
            ACCEPT WS-ITEM_NAME.
            DISPLAY "ITEM COST:".
            ACCEPT WS-ITEM_COST.
            MOVE 'Y' TO ENTRY-OK.

       PRRRINT_ITEM.
            MOVE WS-ITEM_ID TO ITEM_ID.
            MOVE WS-ITEM_NAME TO ITEM_NAME.
            MOVE WS-ITEM_COST TO ITEM_COST.
            WRITE ITEMS AFTER ADVANCING 1 LINE.

       ADD_ITEM.
            DISPLAY "GENSHIN IMPACT GENESIS CRYSTALS".
            DISPLAY "--------------------------------------------------"
            MOVE 'N' TO ENTRY-OK.
            PERFORM GET_ITEM_INFO
                UNTIL ENTRY-OK = 'Y'.
            PERFORM PRRRINT_ITEM.
            PERFORM GORA_AGAIN.

       GORA_AGAIN.
            DISPLAY "DO YOU WANT TO REGISTER ANOTHER ITEM? (Y\N)"
            ACCEPT WS_EOF.
            IF WS_EOF IS = 'Y'
                MOVE 'Y' TO WS_EOF.
            IF WS_EOF IS = 'N'
                MOVE 'N' TO WS_EOF.
