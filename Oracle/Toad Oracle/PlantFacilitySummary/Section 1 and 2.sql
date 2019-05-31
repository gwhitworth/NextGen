/* Formatted on 29-May-19 11:29:52 AM (QP5 v5.326) */
SELECT DISTINCT
       RM."Reg. Id",
       RM."Area Code",
       RM."Municipality",
       RM."Alt. Id",
       RM."Description"
           "Plant/Facility Name",
       PC."Message"
           "Plant Category/Facility Type",
       RD."Dept. No"
           "Department #",
       RD."Reg. Descr",
       CASE
           WHEN INSTR (RM."Description",
                       RM."Area Code" || RM."Municipality",
                       1,
                       1) = 1
           THEN
               REPLACE (RM."Description",
                        RM."Area Code" || RM."Municipality",
                        '')
           ELSE
               RD."Property Id"
       END
           "Folio ID",
       DC."CNT"
           "# Improvements",
       NVL (DC."BaseCost", 0) + NVL (DC."CostAdj", 0)
           "Base Cost",
       NVL (
           (  (NVL (DC."BaseCost", 0) + NVL (DC."CostAdj", 0))
            * NVL ((DC."IdcFact" / 100), 1)),
           0)
           "Updated Cost",
       NVL (
           (  (NVL (DC."BaseCost", 0) + NVL (DC."CostAdj", 0))
            * NVL ((DC."IdcFact" / 100), 1)
            * NVL (
                  CASE
                      WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                      ELSE NVL ((DC."IdcFact" / 100), 1)
                  END,
                  1)),
           0)
           "RCN",
       NVL (
           CASE
               WHEN DC."Rcnld Override Value" > 0
               THEN
                   DC."Rcnld Override Value"
               ELSE
                     (  DC."BaseCost"
                      + NVL (DC."CostAdj", 0) * NVL (DC."IdcFact", 1))
                   * NVL ((DC."IdcFact" / 100), 1)
                   * (  1
                      -   (  DC."Depreciation"
                           + DC."Functional Depreciation"
                           + DC."Observed Depreciation"
                           + DC."Economic Depreciation")
                        / 100)
           END,
           NVL (DC."BaseCost", 0))
           "RCNLD"
  FROM BCA_COMMON.REGMAST_VW  RM
       INNER JOIN BCA_COMMON.REGDEPT_VW RD
           ON RM."Reg. Id" = RD."Reg. Id" AND RM."Roll Year" = RD."Roll Year"
       INNER JOIN BCA_COMMON.REGIMP_VW RI
           ON     RI."Department Id" = RD."Dept. Id"
              AND RI."Roll Year" = RD."Roll Year"
       INNER JOIN
       (  SELECT RI2."Reg. Id",
                 RI2."Roll Year",
                 RI2."Department Id",
                 COUNT (*)
                     "CNT",
                 SUM (RI2."Base Cost For Plant")
                     "BaseCost",
                 SUM (RI2."Costadj")
                     "CostAdj",
                 SUM (RI2."Idcfact")
                     "IdcFact",
                 SUM (RI2."Rcnld Override Value")
                     "Rcnld Override Value",
                 SUM (RI2."Depreciation")
                     "Depreciation",
                 SUM (RI2."Functional Depreciation")
                     "Functional Depreciation",
                 SUM (RI2."Observed Depreciation")
                     "Observed Depreciation",
                 SUM (RI2."Economic Depreciation")
                     "Economic Depreciation"
            FROM BCA_COMMON.REGIMP_VW RI2
        GROUP BY RI2."Reg. Id", RI2."Roll Year", RI2."Department Id") DC
           ON DC."Reg. Id" = RD."Reg. Id" AND DC."Roll Year" = RD."Roll Year"
       INNER JOIN (SELECT "Value", "Message"
                     FROM BCA_COMMON.AEDIT_VW
                    WHERE "Field Name" = 'PLCATEGORY'
                   UNION
                   SELECT "Value 1", "Msg"
                     FROM BCA_COMMON.DEDIT_VW
                    WHERE "Field 1" = 'PLCATEGORY'
                   ORDER BY "Message") PC
           ON PC."Value" = RM."Plant Category"
 WHERE RM."Roll Year" = 2019 AND RM."Reg. Id" = '0000020699'