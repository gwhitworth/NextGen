/* Formatted on 24-May-19 8:34:13 AM (QP5 v5.326) */
  SELECT DISTINCT DEPT."Department Id",
                  DEPT."User Entered Dept Number",
                  DEPT."Dept Description",
                  IPCnt.CNT     ImprovementCnt,
                  DEPT."Dept Base Cost"
    FROM BCA_COMMON.REGDEPT_VW DEPT,
         (  SELECT DISTINCT "Department Id", COUNT (*) CNT
              FROM BCA_COMMON.REGIMP_VW
             WHERE "Property Id" = '03129059' AND "Roll Year" = 2018
          GROUP BY "Department Id") IPCnt
   WHERE     "Property Id" = '03129059'
         AND "Roll Year" = 2018
         AND IPCnt."Department Id" = DEPT."Department Id"
ORDER BY DEPT."Department Id"