/* Formatted on 31-May-19 2:39:47 PM (QP5 v5.326) */
  SELECT DISTINCT
         CP."Property Class Code" || ' ' || CS."Message"
             "Property Class",
         (CP."Tax Exemption Code" || ' ' || EX."Description")
             "Exemption Tax Code",
         (NVL (IC."Averge Depreciation", 0) / 100) "Averge Depreciation" ,
         AVG (CP.PERCENTAGE / 100)
             "Exempt %",
         SUM (
             NVL (
                   NVL (
                       (  (  NVL (RI."Base Cost For Plant", 0)
                           + NVL (RI."Costadj", 0))
                        * NVL ((RI."Idcfact" / 100), 1)
                        * NVL (
                              CASE
                                  WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                                  ELSE NVL ((RI."Idcfact" / 100), 1)
                              END,
                              1)),
                       0)
                 -   (NVL (
                         (  (  NVL (RI."Base Cost For Plant", 0)
                             + NVL (RI."Costadj", 0))
                          * NVL ((RI."Idcfact" / 100), 1)
                          * NVL (
                                CASE
                                    WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                                    ELSE NVL ((RI."Idcfact" / 100), 1)
                                END,
                                1)),
                         1)
                   * .7),
                 1))
             "Value"
    FROM BCA_COMMON.REGIMP_VW RI
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
         INNER JOIN
         (  SELECT RI2."Reg. Id",
                   RI2."Roll Year",
                   AVG ("Depreciation")     "Averge Depreciation"
              FROM BCA_COMMON.REGIMP_VW RI2
          GROUP BY RI2."Reg. Id", RI2."Roll Year") IC
             ON IC."Reg. Id" = RI."Reg. Id" AND IC."Roll Year" = RI."Roll Year"
   WHERE RI."Roll Year" = 2019 AND RI."Reg. Id" = '0000062793'
GROUP BY CP."Property Class Code" || ' ' || CS."Message",
         (CP."Tax Exemption Code" || ' ' || EX."Description"),
         (NVL (IC."Averge Depreciation", 0) / 100)