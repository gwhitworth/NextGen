/* Formatted on 28-May-19 11:55:18 AM (QP5 v5.326) */
  SELECT RI2."Reg. Id",
         RI2."Roll Year",
         RI2."Department Id",
         COUNT (*)     "DeptNumOfImprov"
    FROM BCA_COMMON.REGIMP_VW RI2
   WHERE RI2."Reg. Id" = '0000020699' AND RI2."Roll Year" = 2019
GROUP BY RI2."Reg. Id", RI2."Roll Year", RI2."Department Id"