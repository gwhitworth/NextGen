/* Formatted on 24-May-19 9:13:45 AM (QP5 v5.326) */
  SELECT DISTINCT DEPT."Department Id",
                  DEPT."User Entered Dept Number",
                  DEPT."Dept Description",
                  BC.CNT     "Base Cost",
                  DEPT."Dept Base Cost",
                  UC."Updated Cost"
    FROM BCA_COMMON.REGDEPT_VW DEPT,
         (  SELECT DISTINCT "Department Id", COUNT (*) CNT
              FROM BCA_COMMON.REGIMP_VW
             WHERE "Property Id" = '03129059' AND "Roll Year" = 2018
          GROUP BY "Department Id") BC,
         (  SELECT RI."Department Id",
                   SUM (
                         (RI."Base Cost For Plant" + NVL (RI.COSTADJ, 0))
                       * NVL (RI."Plupdfact", 1))
                       "Updated Cost"
              FROM REGIMP_VW RI
             WHERE RI."Property Id" = '03129059' AND "Roll Year" = 2018
          GROUP BY RI."Department Id") UC
   WHERE     DEPT."Property Id" = '03129059'
         AND DEPT."Roll Year" = 2018
         AND BC."Department Id" = DEPT."Department Id"
ORDER BY DEPT."Department Id"