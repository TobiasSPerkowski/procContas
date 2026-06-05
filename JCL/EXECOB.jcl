//HERC01XX JOB (PROJ4),                           
//             'EXECUTA PROJ4',                   
//             CLASS=C,                           
//             MSGCLASS=X,                        
//             REGION=8M,TIME=1440,               
//             MSGLEVEL=(1,1),NOTIFY=HERC01       
//ORDENA   EXEC PGM=IERRCO00                      
//SORTLIB  DD DSN=SYS1.SORTLIB,DISP=SHR           
//SYSOUT   DD SYSOUT=*                            
//SORTWK01 DD UNIT=SYSDA,SPACE=(TRK,(5,5))        
//SORTWK02 DD UNIT=SYSDA,SPACE=(TRK,(5,5))        
//SORTWK03 DD UNIT=SYSDA,SPACE=(TRK,(5,5))        
//SORTWK04 DD UNIT=SYSDA,SPACE=(TRK,(5,5))        
//SORTIN   DD DSN=HERC01.CONTAS,DISP=SHR          
//SORTOUT  DD DSN=&&TEMP,UNIT=SYSDA,              
//             DISP=(,PASS),                      
//             SPACE=(TRK,(1,1)),                 
//             DCB=(RECFM=FB,LRECL=54,BLKSIZE=540)
//SYSIN    DD *                                   
  SORT FIELDS=(39,4,CH,A)                         
/*                                                
//EXECUTA  EXEC PGM=PROJ4                         
//STEPLIB  DD   DSN=HERC01.LOAD,DISP=SHR          
//ARQCON   DD   DSN=&&TEMP,DISP=(OLD,DELETE)      
//SYSOUT   DD   SYSOUT=*                          