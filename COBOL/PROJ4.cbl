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
           SELECT CONTAS ASSIGN TO UT-S-ARQCON.                        
                                                                       
       DATA DIVISION.                                                  
                                                                       
       FILE SECTION.                                                   
                                                                       
       FD  CONTAS                                                      
           LABEL RECORDS ARE STANDARD                                  
           RECORD CONTAINS 54 CHARACTERS                               
           BLOCK  CONTAINS  0 RECORDS                                  
           DATA   RECORD IS CONTAS.                                    
           01 REG-CONTAS COPY BOOKCON.                                 
                                                                       
       WORKING-STORAGE SECTION.                                        
                                                                       
       01  FS-CONTAS           PIC X VALUE 'N'.                        
       01  WS-TOTAL-CONTAS     PIC 9(05) VALUE ZERO.                   
       01  WS-SALDO-TOTAL      PIC 9(11)V99 VALUE ZERO.                
                                                                       
       PROCEDURE DIVISION.                                             
                                                                       
       0001-PRINCIPAL.                                                 
           PERFORM 0100-INICIAR.                                       
           PERFORM 0200-PROCESSAR UNTIL FS-CONTAS = 'F'.               
           PERFORM 0300-FINALIZAR.                                     
           PERFORM 0300-FINALIZAR.                           
           STOP RUN.                                         
      *------------------------------------------------------
       0100-INICIAR.                                         
           OPEN INPUT CONTAS.                                
           READ CONTAS                                       
               AT END MOVE 'F' TO FS-CONTAS.                 
           IF FS-CONTAS = 'F'                                
               DISPLAY 'NENHUM REGISTRO NO ARQUIVO'.         
      *------------------------------------------------------
       0200-PROCESSAR.                                       
           DISPLAY '----------------------------------------'
           DISPLAY 'CONTA    : ' NUM-CONTA                   
           DISPLAY 'CLIENTE  : ' NOME-CLIENTE                
           DISPLAY 'AGENCIA  : ' AGENCIA                     
           DISPLAY 'TIPO     : ' TIPO-CONTA                  
           DISPLAY 'SALDO    : ' SALDO                       
           ADD 1                                             
               TO WS-TOTAL-CONTAS                            
           ADD SALDO                                         
               TO WS-SALDO-TOTAL.                            
           READ CONTAS                                       
               AT END MOVE 'F' TO FS-CONTAS.                 
      *------------------------------------------------------
       0300-FINALIZAR.                                       
           DISPLAY ' '                                       
           DISPLAY '========== RESUMO =========='            
           DISPLAY 'TOTAL DE CONTAS : '                      
                   WS-TOTAL-CONTAS                           
           DISPLAY 'SALDO TOTAL     : '                      
                   WS-SALDO-TOTAL                            
           DISPLAY '============================'.           
           CLOSE CONTAS.                                     
                                                             
                                                             