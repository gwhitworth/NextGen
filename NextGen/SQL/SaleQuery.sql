WITH cteTotalSales([Sale Type], 
                   [Document Number], 
                   [Sale Date], 
                   [Price], 
                   [Status])
     AS (SELECT 'Sale', 
                'FB72795', 
                CAST('2007-06-16' AS DATE), 
                106345, 
                'Qualified'
         UNION
         SELECT 'Sale', 
                'FB72796', 
                CAST('2007-06-16' AS DATE), 
                106345, 
                'Qualified'
         UNION
         SELECT 'Sale', 
                'EE16241', 
                CAST('1991-02-28' AS DATE), 
                145000, 
                'Qualified')
     SELECT *
     FROM cteTotalSales;