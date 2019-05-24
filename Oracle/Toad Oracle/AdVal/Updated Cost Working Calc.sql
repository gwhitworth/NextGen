/* Formatted on 24-May-19 9:07:38 AM (QP5 v5.326) */
  SELECT RI."Department Id",
         SUM (
               (RI."Base Cost For Plant" + NVL (RI.COSTADJ, 0))
             * NVL (RI."Plupdfact", 1))
             "Updated Cost"
    FROM REGIMP_VW RI
   WHERE RI."Property Id" = '03129059' AND "Roll Year" = 2018
GROUP BY RI."Department Id"