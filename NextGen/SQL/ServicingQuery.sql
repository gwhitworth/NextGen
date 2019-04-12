WITH cte([KEY], 
         [Permit #], 
         [Type], 
         [Description], 
         [Value], 
         [Issue Date], 
         [Status], 
         [Date Keyed])
     AS (SELECT 1, 
                '15 DTR (MCLASS)', 
                'Reassessment', 
                'DTR EFFECTIVE YEAR REVIEW', 
                1, 
                CAST('15-Jun-2015' AS DATE), 
                'Completed', 
                CAST('15-Jun-2015' AS DATE)
         UNION
         SELECT 2, 
                '15 DESKTOP REV', 
                'Reassessment', 
                'OTH - DESKTOP REVIEW', 
                1, 
                CAST('16-Jun-2015' AS DATE), 
                'Completed', 
                CAST('16-Jun-2015' AS DATE)
         UNION
         SELECT 3, 
                '15 DTR (MCLASS)', 
                'DTR Manual Class Review', 
                'DTR MANUAL CLASS REVIEW', 
                1, 
                CAST('16-Jun-2015' AS DATE), 
                'Completed', 
                CAST('16-Jun-2015' AS DATE)
         UNION
         SELECT 4, 
                '', 
                'Can''t be Determined-Do Not Use', 
                'AUG 03 FRAMING PARTIAL COM', 
                1, 
                CAST('28-Aug-2003' AS DATE), 
                'Completed', 
                CAST('28-Aug-2003' AS DATE)
         UNION
         SELECT 5, 
                '', 
                '', 
                '* More Servicing Records on File', 
                NULL, 
                NULL, 
                NULL, 
                NULL)
     SELECT *
     FROM [cte]
     ORDER BY [KEY];