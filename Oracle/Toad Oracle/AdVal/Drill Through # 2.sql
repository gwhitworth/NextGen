/* Formatted on 27-May-19 4:47:10 PM (QP5 v5.326) */
SELECT RM."Reg. Id",
       RM."Area Code",
       RM."Municipality",
       RM."Alt. Id",
       RM."Description"
           "Plant/Facility Name",
       RD."Dept. No"
           "Department #",
       RM."Plant Primary Division",
       ''
           "Folio ID",
       RI."Improvement #",
       CS."Message"
           "Property Class",
       CP."Tax Exemption Code",
       CP.PERCENTAGE
           "Exempt %",
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
           "Value"
  FROM BCA_COMMON.REGMAST_VW  RM
       INNER JOIN BCA_COMMON.REGDEPT_VW RD
           ON RM."Reg. Id" = RD."Reg. Id" AND RM."Roll Year" = RD."Roll Year"
       INNER JOIN BCA_COMMON.REGIMP_VW RI
           ON     RI."Department Id" = RD."Dept. Id"
              AND RI."Roll Year" = RD."Roll Year"
       INNER JOIN BCA_COMMON.CLASSPCT_VW CP
           ON     CP."Property Id" = RD."Property Id"
              AND CP."Roll Year" = RD."Roll Year"
       INNER JOIN
       (SELECT "Value", "Message"
          FROM BCA_COMMON.AEDIT_VW
         WHERE "Table Name" = 'CLASSPCT' AND "Field Name" = 'CLASS') CS
           ON CS."Value" = CP."Property Class Code"
 WHERE RM."Roll Year" = 2018