/* Formatted on 24-May-19 3:35:39 PM (QP5 v5.326) */
SELECT RM."REGID",
       RM."Area Code",
       RM."Jurisdiction",
       RM."Alternate Id",
       RM."Description",
       RM."Plant Primary Division",
       ''
           "Folio ID",
       RI."Improvement Number"
           "Improvement #",
       RI."User Field 4"
           "Improvement Description",
       RI."User Field 3"
           "Improvement Type",
       RI."Cost Source"
           "Cost Source",
       RI."Plant Improvement Cost Year"
           "Cost Year",
       RI."Base Cost For Plant"
           "Base Cost",
       RI."COSTADJ"
           "Cost Adjustment",
       (RI."Base Cost For Plant" + RI."COSTADJ")
           "Total Base Cost",
       RI."Plupdfact"
           "Update Factor",
       ((RI."Base Cost For Plant" + RI."COSTADJ") * NVL (RI."Plupdfact", 1))
           "Updated Cost",
       (RI."Idcfact" / 100)
           "IDC Factor",
       RI."Rcn Value"
           "RCN",
       (NVL (
              (  (RI."Base Cost For Plant" + NVL (RI.COSTADJ, 0))
               * NVL (RI."Plupdfact", 1))
            * CASE
                  WHEN RI."Exclude Idc Factor" = 'Y' THEN 1
                  ELSE (RI."Idcfact" / 100)
              END,
            0))
           "RCN_CALC",
       RI."Year Built"
           "Year Built",
       RI."Closure Year"
           "Closure Year",
       RI."Effective Year"
           "Effective Year",
       RI."Depreciation"
           "Depreciation",
         (  RI."Depreciation"
          + RI."Functional Depreciation"
          + RI."Observed Depreciation"
          + RI."Economic Depreciation")
       / 100
           "Total Depreciation",
       NVL (
           CASE
               WHEN RI."Rcnld Override Value" > 0
               THEN
                   RI."Rcnld Override Value"
               ELSE
                     (  RI."Base Cost For Plant"
                      + NVL (RI.COSTADJ, 0) * NVL (RI."Plupdfact", 1))
                   * (RI."Idcfact" / 100)
                   * (  1
                      -   (  RI."Depreciation"
                           + RI."Functional Depreciation"
                           + RI."Observed Depreciation"
                           + RI."Economic Depreciation")
                        / 100)
           END,
           0)
           "RCNLD",
           RI."Suppress" "Suppress Calculation"
           
           

  FROM BCA_COMMON.REGMAST_VW  RM
       INNER JOIN BCA_COMMON.REGDEPT_VW RD
           ON     RM."REGID" = RD."Regulated Entity Id"
              AND RM."Roll Year" = RD."Roll Year"
       INNER JOIN BCA_COMMON.REGIMP_VW RI
           ON     RI."Department Id" = RD."Department Id"
              AND RI."Roll Year" = RD."Roll Year"
 WHERE RM."Roll Year" = 2018