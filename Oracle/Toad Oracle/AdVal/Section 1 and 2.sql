/* Formatted on 27-May-19 5:10:14 PM (QP5 v5.326) */
SELECT RM."Reg. Id",
       RM."Area Code",
       RM."Municipality",
       RM."Alt. Id",
       RM."Description"
           "Plant/Facility Name",
       RD."Dept. No"
           "Department #",
       RD."Reg. Descr",
       ''
           "Folio ID",
       1
           "# Improvements",
       RD."Base Cost",
       (  (RI."Base Cost For Plant" + NVL (RI."Costadj", 0))
        * (RI."Idcfact" / 100))
           "Updated Cost",
       (  (RI."Base Cost For Plant" + NVL (RI."Costadj", 0))
        * (RI."Idcfact" / 100)
        * NVL (
              CASE
                  WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                  ELSE (RI."Idcfact" / 100)
              END,
              1))
           "RCN",
       NVL (
           CASE
               WHEN RI."Rcnld Override Value" > 0
               THEN
                   RI."Rcnld Override Value"
               ELSE
                     (  RI."Base Cost For Plant"
                      + NVL (RI."Costadj", 0) * NVL (RI."Plupdfact", 1))
                   * (RI."Idcfact" / 100)
                   * (  1
                      -   (  RI."Depreciation"
                           + RI."Functional Depreciation"
                           + RI."Observed Depreciation"
                           + RI."Economic Depreciation")
                        / 100)
           END,
           0)
           "RCNLD"
  FROM BCA_COMMON.REGMAST_VW  RM
       INNER JOIN BCA_COMMON.REGDEPT_VW RD
           ON RM."Reg. Id" = RD."Reg. Id" AND RM."Roll Year" = RD."Roll Year"
       INNER JOIN BCA_COMMON.REGIMP_VW RI
           ON     RI."Department Id" = RD."Dept. Id"
              AND RI."Roll Year" = RD."Roll Year"
 WHERE RM."Roll Year" = 2018 AND RM."Area Code" = '01'