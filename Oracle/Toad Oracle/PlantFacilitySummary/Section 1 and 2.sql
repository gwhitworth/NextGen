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
       
       
       RM."Plant Primary Division" "Plant Primary Div",
       RM."User Value 1" "Plant Capacity Units",
       RM."User Field 1" "Plant Capacity Code",
       RM."Plant Closure Year" "Plant Closure Yr",
       
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
        RM."Plant Department Count"
        "Total Num Depts",
       RM."Plant Improvement Count"
           "Total Num of Imprs",
       0 "Annual Depr",
       NVL (IC."BaseCost", 0)
           "Total Cost",
           
       NVL (IC."CostAdj", 0) "Total Cost Adj",
       NVL (IC."BaseCost", 0) + NVL (IC."CostAdj", 0)
           "Total Base Cost",
           
                  
       NVL (
           (  (NVL (IC."BaseCost", 0) + NVL (IC."CostAdj", 0))
            * NVL ((IC."Plupdfact" / 100), 1)),
           0)
           "Total Updated Cost",
           
           
           
       NVL ((RI."Idcfact" / 100), 1) "IDC Factor",
       NVL (
           (  (NVL (IC."BaseCost", 0) + NVL (IC."CostAdj", 0))
            * NVL ((IC."IdcFact" / 100), 1)
            * NVL (
                  CASE
                      WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                      ELSE NVL ((IC."IdcFact" / 100), 1)
                  END,
                  1)),
           0)
           "Total RCN",

       NVL("Averge Depreciation",0) "Avg Depr Rate",

       NVL (
           (  (NVL (IC."BaseCost", 0) + NVL (IC."CostAdj", 0))
            * NVL ((IC."IdcFact" / 100), 1)
            * NVL (
                  CASE
                      WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                      ELSE NVL ((IC."IdcFact" / 100), 1)
                  END,
                  1)),
           0) -
           NVL (
           (  (NVL (IC."BaseCost", 0) + NVL (IC."CostAdj", 0))
            * NVL ((IC."IdcFact" / 100), 1)
            * NVL (
                  CASE
                      WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                      ELSE NVL ((IC."IdcFact" / 100), 1)
                  END,
                  1)),
           1) * (NVL("Averge Depreciation",0)/100)
           "Total RCNLD"
           
           
           
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
                 SUM (RI2."Plupdfact")
                     "Plupdfact",
                     SUM(RI2."Rcnld Adjusted Value")
                     "Rcnld Adjusted Value",
                 SUM (RI2."Rcnld Override Value")
                     "Rcnld Override Value",
                 SUM (RI2."Depreciation")
                     "Depreciation",
                 SUM (RI2."Functional Depreciation")
                     "Functional Depreciation",
                 SUM (RI2."Observed Depreciation")
                     "Observed Depreciation",
                 SUM (RI2."Economic Depreciation")
                     "Economic Depreciation",
                 AVG("Depreciation") "Averge Depreciation"
            FROM BCA_COMMON.REGIMP_VW RI2
        GROUP BY RI2."Reg. Id", RI2."Roll Year", RI2."Department Id") IC
           ON IC."Reg. Id" = RD."Reg. Id" AND IC."Roll Year" = RD."Roll Year"
       INNER JOIN (SELECT "Value", "Message"
                     FROM BCA_COMMON.AEDIT_VW
                    WHERE "Field Name" = 'PLCATEGORY'
                   UNION
                   SELECT "Value 1", "Msg"
                     FROM BCA_COMMON.DEDIT_VW
                    WHERE "Field 1" = 'PLCATEGORY'
                   ORDER BY "Message") PC
           ON PC."Value" = RM."Plant Category"
           

 WHERE RM."Roll Year" = 2019 AND RM."Reg. Id" = '0000062793'