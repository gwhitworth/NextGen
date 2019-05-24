/* Formatted on 24-May-19 8:55:48 AM (QP5 v5.326) */
SELECT RI."Department Id",
       RI."Base Cost For Plant",
       NVL (RI.COSTADJ, 0)     COSTAJD,
       NVL (RI."Plupdfact", 1),
       
  FROM REGIMP_VW RI
 WHERE RI."Property Id" = '03129059' AND "Roll Year" = 2018