/* Formatted on 24-May-19 11:27:48 AM (QP5 v5.326) */
/*
IF REGIMP.OVERRCNLD has value then display that value 
ELSE 
= the sum of all (((REGIMP.COST + REGIMP.COSTADJ) x  REGIMP.PLUPDFACT) x (REGIMP.IDCFACT  / 100) 
x (1 – (REGIMP.DEPR + REGIMP.FUNDEP + REGIMP.OBSDEP + REGIMP.ECNDEP) / 100 TO A MAX of 100))) 
for each REGIMP record with the REGDEP.DEPTNO of the row in the report.

*/

  SELECT RI."Department Id",
         SUM (
             CASE
                 WHEN RI."Rcnld Override Value" > 0
                 THEN
                     RI."Rcnld Override Value"
                 ELSE
                       (  RI."Base Cost For Plant"
                        + NVL (RI.COSTADJ, 0) * NVL (RI."Plupdfact", 1))
                     * (RI."Idcfact" / 100)
                     * (  1
                        -   (  RI."Depreciation"
                             + RI."Functional Depreciation"
                             + RI."Observed Depreciation"
                             + RI."Economic Depreciation")
                          / 100)
             END)
             "Department RCNLD"
    FROM REGIMP_VW RI
   WHERE RI."Property Id" = '03129059' AND "Roll Year" = 2018
GROUP BY RI."Department Id"