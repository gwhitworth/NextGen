/* Formatted on 30-May-19 11:48:06 AM (QP5 v5.326) */
SELECT DISTINCT
       RI."Improvement #",
       CP."Property Class Code" || ' ' || CS."Message"
           "Property Class",
       (CP."Tax Exemption Code" || ' ' || EX."Description")
           "Exemption Tax Code",
       CP.PERCENTAGE / 100
           "Exempt %",
       NVL (
           CASE
               WHEN RI."Rcnld Override Value" > 00
               THEN
                   RI."Rcnld Override Value"
               ELSE
                     (  NVL (RI."Base Cost For Plant", 0)
                      + NVL (RI."Costadj", 0) * NVL (RI."Plupdfact", 1))
                   * NVL ((RI."Idcfact" / 100), 1)
                   * NVL (
                         (  1
                          -   (  RI."Depreciation"
                               + RI."Functional Depreciation"
                               + RI."Observed Depreciation"
                               + RI."Economic Depreciation")
                            / 100),
                         1)
           END,
           0)
           "Value"
  FROM BCA_COMMON.REGIMP_VW  RI
       INNER JOIN BCA_COMMON.CLASSPCT_VW CP
           ON     CP."Property Id" = RI."Property Id"
              AND CP."Line Number" = RI."Line Number"
              AND CP."Roll Year" = RI."Roll Year"
       INNER JOIN
       (SELECT "Value", "Message"
          FROM BCA_COMMON.AEDIT_VW
         WHERE "Table Name" = 'CLASSPCT' AND "Field Name" = 'CLASS') CS
           ON CS."Value" = CP."Property Class Code"
       INNER JOIN
       (SELECT "Roll Year", "Exemption Code", "Description"
          FROM BCA_COMMON.EXCODE_VW) EX
           ON     EX."Roll Year" = RI."Roll Year"
              AND EX."Exemption Code" = CP."Tax Exemption Code"
 WHERE     RI."Roll Year" = 2019
       AND RI."Reg. Id" = '0000020699'
       AND RI."Department Id" = 1
       AND RI."Improvement #" = 5