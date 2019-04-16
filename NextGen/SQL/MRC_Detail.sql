WITH cte([Key], 
         [RowDesc], 
         [ColKey], 
         [ColHead], 
         [DataVal])
     AS (SELECT 1, 
                'Base MRC', 
                1, 
                'Value', 
                200933
         UNION
         SELECT 1, 
                'Base MRC', 
                2, 
                'Total', 
                NULL
         UNION
         SELECT 2, 
                'Total % Adj 10.00%', 
                1, 
                'Value', 
                18784
         UNION
         SELECT 2, 
                'Total % Adj 10.00%', 
                2, 
                'Total', 
                NULL
         UNION
         SELECT 3, 
                'MRC', 
                1, 
                'Value', 
                NULL
         UNION
         SELECT 3, 
                'MRC', 
                2, 
                'Total', 
                219716
         UNION
         SELECT 4, 
                'MACM', 
                1, 
                'Value', 
                1.8
         UNION
         SELECT 4, 
                'MACM', 
                2, 
                'Total', 
                NULL
         UNION
         SELECT 5, 
                'Market RCN', 
                1, 
                'Value', 
                NULL
         UNION
         SELECT 5, 
                'Market RCN', 
                2, 
                'Total', 
                395490
         UNION
         SELECT 6, 
                '     Effective Year', 
                1, 
                'Value', 
                '1978'
         UNION
         SELECT 6, 
                '     Effective Year', 
                2, 
                'Total', 
                NULL
         UNION
         SELECT 7, 
                '     Depreciation Table', 
                1, 
                'Value', 
                -98
         UNION
         SELECT 7, 
                '     Depreciation Table', 
                2, 
                'Total', 
                NULL
         UNION
         SELECT 8, 
                '     Total Depreciation', 
                1, 
                'Value', 
                -99
         UNION
         SELECT 8, 
                '     Total Depreciation', 
                2, 
                'Total', 
                -138421
         UNION
         SELECT 9, 
                'Market RCNLD', 
                1, 
                'Value', 
                NULL
         UNION
         SELECT 9, 
                'Market RCNLD', 
                2, 
                'Total', 
                257068
         UNION
         SELECT 10, 
                'Sub Total Applied to Market Modifier %', 
                1, 
                'Value', 
                NULL
         UNION
         SELECT 10, 
                'Sub Total Applied to Market Modifier %', 
                2, 
                'Total', 
                257068
         UNION
         SELECT 11, 
                'Market Adjusted RCNLD', 
                1, 
                'Value', 
                NULL
         UNION
         SELECT 11, 
                'Market Adjusted RCNLD', 
                2, 
                'Total', 
                257068)
     SELECT *
     FROM cte
     ORDER BY [KEY];