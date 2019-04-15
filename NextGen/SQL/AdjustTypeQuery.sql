WITH cte([Adjustment Type], 
         [% Adj], 
         [Lump Sum])
     AS (SELECT 'Location', 
                '-10.00%', 
                '')
     SELECT *
     FROM cte;