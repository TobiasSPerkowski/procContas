      *****************************************************************
      * AUTHOR: TOBIAS SAUERESSIG
      * DATE: 04/06/2026
      * PURPOSE: PROCESSAMENTO DE CONTAS BANCARIAS
      *****************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJ4.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT ARQ-CONTAS
           ASSIGN TO "CONTAS.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD  ARQ-CONTAS.

      *COPY COPYCONTA.

       01 REG-CONTA.
          05 NUM-CONTA      PIC 9(08).
          05 NOME-CLIENTE   PIC X(30).
          05 AGENCIA        PIC 9(04).
          05 TIPO-CONTA     PIC X(01).
          05 SALDO          PIC S9(09)V99.

       WORKING-STORAGE SECTION.

       01 WS-FIM-ARQUIVO       PIC X VALUE 'N'.

       01 WS-TOTAL-CONTAS      PIC 9(05) VALUE ZERO.

       01 WS-SALDO-TOTAL       PIC S9(11)V99 VALUE ZERO.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.

           PERFORM INICIALIZA

           PERFORM PROCESSA
               UNTIL WS-FIM-ARQUIVO = 'S'

           PERFORM FINALIZA

           STOP RUN.

      
       INICIALIZA.
           OPEN INPUT ARQ-CONTAS
           .
      
       PROCESSA.
           READ ARQ-CONTAS

               AT END
                   MOVE 'S' TO WS-FIM-ARQUIVO

               NOT AT END
                   PERFORM PROCESSA-REGISTRO

           END-READ
           .
      
       PROCESSA-REGISTRO.
           DISPLAY "----------------------------------------"

           DISPLAY "CONTA    : " NUM-CONTA
           DISPLAY "CLIENTE  : " NOME-CLIENTE
           DISPLAY "AGENCIA  : " AGENCIA
           DISPLAY "TIPO     : " TIPO-CONTA
           DISPLAY "SALDO    : " SALDO

           ADD 1
               TO WS-TOTAL-CONTAS

           ADD SALDO
               TO WS-SALDO-TOTAL
           .
       
       FINALIZA.
           CLOSE ARQ-CONTAS

           DISPLAY " "
           DISPLAY "========== RESUMO =========="
           DISPLAY "TOTAL DE CONTAS : "
                   WS-TOTAL-CONTAS

           DISPLAY "SALDO TOTAL     : "
                   WS-SALDO-TOTAL

           DISPLAY "============================"
           .
