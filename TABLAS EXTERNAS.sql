CREATE DIRECTORY EXTERNA
       AS 'C:\EXTERNO';

 
 SELECT * FROM EXTERNA;
 
 ALTER TABLE EXTERNA LOCATION ('datos2.txt');
 
 
 
 -------
 
 CREATE TABLE EXTERNA
   ( DEP NUMBER ,
     SALDO NUMBER (12,2),
     LOC VARCHAR2(20),
     DNOMBRE VARCHAR2(30),
     FECHA date
   )
  ORGANIZATION EXTERNAL
   (
    TYPE ORACLE_LOADER DEFAULT DIRECTORY EXTERNA   
    ACCESS PARAMETERS ( RECORDS DELIMITED BY NEWLINE
                        SKIP 0
                        FIELDS TERMINATED BY ','
                        MISSING FIELD VALUES ARE NULL
                          ( DEP INTEGER EXTERNAL(2),
                            SALDO FLOAT EXTERNAL(12),
                            LOC CHAR(20),
                            DNOMBRE CHAR(30),
                            FECHA CHAR(10) DATE_FORMAT DATE MASK "dd-mm-yyyy"
                          )  
                      )
    LOCATION ('datos2.TXT')
    );  
  
 SELECT * FROM EXTERNA order by dep;
 ALTER TABLE EXTERNA LOCATION('datos2.txt','datos22.txt');
 
 DROP TABLE EXTERNA;
