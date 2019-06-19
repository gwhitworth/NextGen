
  SELECT RI."Property Id",
  RI."Improvement #"
             "Imp #",
         RI."User Field 4"
             "Imp Description/Imp Type",
         RI."User Field 3"
             "Imp Type",
         CS."Message"
             "Cost Source/Cost Year",
         RI."Plant Improvement Cost Year"
             "Cost Year",
         NVL (RI."Base Cost For Plant", 0)
             "Cost/CostAdj",
         NVL (RI."Costadj", 0)
             "CostAdj",
         NVL (RI."Base Cost For Plant", 0) + NVL (RI."Costadj", 0)
             "Base Cost",
         (  (RI."Base Cost For Plant" + NVL (RI."Costadj", 0))
          * NVL (RI."Plupdfact", 1))
             "Updated Cost",
         NVL (RI."Plupdfact", 1)
             "Update Factor",
         (  (  (NVL (RI."Base Cost For Plant", 0) + NVL (RI."Costadj", 0))
             * NVL (RI."Plupdfact", 1))
          * CASE
                WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                ELSE NVL ((RI."Idcfact" / 100), 1)
            END)
             "RCN IDC Factor",
         NVL ((RI."Idcfact" / 100), 1)
             "IDC Factor",
         RI."Year Built"
             "Const Yr / Closure Yr",
         RI."Closure Year"
             "Closure Yr",
         RI."Effective Year"
             "Eff Year",
         NVL (RI."Depreciation", 0)
             "Depreciation",
         NVL (
               (  RI."Depreciation"
                + RI."Functional Depreciation"
                + RI."Observed Depreciation"
                + RI."Economic Depreciation")
             / 100,
             0)
             "Total Depreciation",
         NVL (
             CASE
                 WHEN RI."Rcnld Override Value" > 0
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
             "RCNLD",
         RI."Suppress"
             "Suppress Calc"
    FROM BCA_COMMON.REGIMP_VW RI
         INNER JOIN (SELECT "Value", "Message"
                       FROM BCA_COMMON.AEDIT_VW
                      WHERE "Field Name" = 'COST_SRC') CS
             ON CS."Value" = RI."Cost Source"
   WHERE     RI."Roll Year" = 2019
         AND RI."Reg. Id" = '0000020699'
         AND RI."Department Id" = 1
ORDER BY RI."Improvement #"