/* Formatted on 31-May-19 10:31:50 AM (QP5 v5.326) */
  SELECT RD2."Reg. Id", RD2."Roll Year", COUNT (*) "CNT"
    FROM BCA_COMMON.REGDEPT_VW RD2
   WHERE RD2."Roll Year" = 2019 AND RD2."Reg. Id" = '0000062793'
GROUP BY RD2."Reg. Id", RD2."Roll Year"