/* Formatted on 24-May-19 10:31:45 AM (QP5 v5.326) */
/*

= the sum of all (((REGIMP.COST + REGIMP.COSTADJ) x  REGIMP.PLUPDFACT) x (
IF REGIMP.EXCIDC is FALSE then (REGIMP.IDCFACT / 100))) 
for each REGIMP record with the REGDEP.DEPTNO of the row in the report. 

*/

  SELECT RI."Department Id",
         NVL (
             SUM (
                   (  (RI."Base Cost For Plant" + NVL (RI.COSTADJ, 0))
                    * NVL (RI."Plupdfact", 1))
                 * CASE
                       WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                       ELSE (RI."Idcfact" / 100)
                   END),
             0)
             "Department RCN"
    FROM REGIMP_VW RI
   WHERE RI."Property Id" = '03129059' AND "Roll Year" = 2018
GROUP BY RI."Department Id"