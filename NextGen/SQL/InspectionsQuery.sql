WITH cte([KEY], 
         [Inspected By], 
         [Inspection Type], 
         [Inspection Date])
     AS (SELECT 1, 
                'TSHYMKO', 
                '23', 
                CAST('06-Apr-18' AS DATE)
         UNION
         SELECT 2, 
                'TSHYMKO', 
                '73', 
                CAST('25-Mar-16' AS DATE)
         UNION
         SELECT 3, 
                'CMYEAK', 
                '106', 
                CAST('16-Jul-15' AS DATE))
     SELECT *
     FROM [cte]
     ORDER BY [KEY];