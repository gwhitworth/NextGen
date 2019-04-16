WITH cte([Key], 
         [Description], 
         [Quantity], 
         [Rate], 
         [Quality], 
         [Amount])
     AS (SELECT 1, 
                'Constant', 
                NULL, 
                NULL, 
                NULL, 
                50109
         UNION
         SELECT 2, 
                'First Floor Area', 
                1766, 
                42.47, 
                NULL, 
                750002
         UNION
         SELECT 3, 
                'Second Floor Area', 
                741, 
                33.39, 
                NULL, 
                24742
         UNION
         SELECT 4, 
                'Foundation Constant - Crawl Space', 
                NULL, 
                NULL, 
                NULL, 
                11724
         UNION
         SELECT 5, 
                'Crawl Space Area', 
                1766, 
                14.87, 
                NULL, 
                26260
         UNION
         SELECT 6, 
                '', 
                NULL, 
                NULL, 
                NULL, 
                50109
         UNION
         SELECT 7, 
                'Subtotal applied to Total % Adj', 
                NULL, 
                NULL, 
                NULL, 
                187837
         UNION
         SELECT 8, 
                'Heating - Elec Bboard', 
                NULL, 
                NULL, 
                NULL, 
                NULL
         UNION
         SELECT 9, 
                '    First Storey', 
                177676 L, 
                1.65, 
                NULL, 
                2914
         UNION
         SELECT 10, 
                '    Second Storey', 
                741, 
                1.65, 
                NULL, 
                1223
         UNION
         SELECT 11, 
                'Plumbing           Full Bath', 
                1, 
                4015.00, 
                3, 
                4015
         UNION
         SELECT 12, 
                'Porch And Deck           Plywood Deck', 
                219, 
                11.25, 
                3, 
                50109
         UNION
         SELECT 13, 
                'Porch And Deck           2x4 Deck', 
                200, 
                12.40, 
                3, 
                2480
         UNION
         SELECT 14, 
                '', 
                NULL, 
                NULL, 
                NULL, 
                13095
         UNION
         SELECT 15, 
                '', 
                NULL, 
                NULL, 
                NULL, 
                NULL
         UNION
         SELECT 16, 
                'Base MRC', 
                NULL, 
                NULL, 
                NULL, 
                200933
         UNION
         SELECT 17, 
                'Total % Adjusted', 
                .10, 
                NULL, 
                NULL, 
                50109
         UNION
         SELECT 18, 
                'Subtotal applied to % Complete', 
                NULL, 
                NULL, 
                NULL, 
                219716
         UNION
         SELECT 19, 
                'MCR', 
                NULL, 
                NULL, 
                NULL, 
                219716)
     SELECT *
     FROM cte
     ORDER BY [KEY];