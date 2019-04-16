WITH cte([Key], 
         [RowDesc], 
         [ColKey], 
         [ColHead], 
         [DataVal])
     AS (SELECT 1, 
                'Constant', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 1, 
                'Constant', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 1, 
                'Constant', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 1, 
                'Constant', 
                4, 
                'Amount', 
                50109
         UNION
         SELECT 2, 
                'First Floor Area', 
                1, 
                'Quantity', 
                1766
         UNION
         SELECT 2, 
                'First Floor Area', 
                2, 
                'Rate', 
                42.47
         UNION
         SELECT 2, 
                'First Floor Area', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 2, 
                'First Floor Area', 
                4, 
                'Amount', 
                75002
         UNION
         SELECT 3, 
                'Second Floor Area', 
                1, 
                'Quantity', 
                741
         UNION
         SELECT 3, 
                'Second Floor Area', 
                2, 
                'Rate', 
                33.39
         UNION
         SELECT 3, 
                'Second Floor Area', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 3, 
                'Second Floor Area', 
                4, 
                'Amount', 
                24742
         UNION
         SELECT 4, 
                'Foundation Constant - Crawl Space', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 4, 
                'Foundation Constant - Crawl Space', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 4, 
                'Foundation Constant - Crawl Space', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 4, 
                'Foundation Constant - Crawl Space', 
                4, 
                'Amount', 
                11724
         UNION
         SELECT 5, 
                'Crawl Space Area', 
                1, 
                'Quantity', 
                1766
         UNION
         SELECT 5, 
                'Crawl Space Area', 
                2, 
                'Rate', 
                14.87
         UNION
         SELECT 5, 
                'Crawl Space Area', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 5, 
                'Crawl Space Area', 
                4, 
                'Amount', 
                26260
         UNION
         SELECT 6, 
                'Subtotal applied to Total % Adj', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 6, 
                'Subtotal applied to Total % Adj', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 6, 
                'Subtotal applied to Total % Adj', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 6, 
                'Subtotal applied to Total % Adj', 
                4, 
                'Amount', 
                187837
         UNION
         SELECT 7, 
                'Heating - Elec Bboard', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 7, 
                'Heating - Elec Bboard', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 7, 
                'Heating - Elec Bboard', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 7, 
                'Heating - Elec Bboard', 
                4, 
                'Amount', 
                NULL
         UNION
         SELECT 8, 
                '    First Storey', 
                1, 
                'Quantity', 
                1766
         UNION
         SELECT 8, 
                '    First Storey', 
                2, 
                'Rate', 
                1.65
         UNION
         SELECT 8, 
                '    First Storey', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 8, 
                '    First Storey', 
                4, 
                'Amount', 
                2914
         UNION
         SELECT 9, 
                '    Second Storey', 
                1, 
                'Quantity', 
                741
         UNION
         SELECT 9, 
                '    Second Storey', 
                2, 
                'Rate', 
                1.65
         UNION
         SELECT 9, 
                '    Second Storey', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 9, 
                '    Second Storey', 
                4, 
                'Amount', 
                1223
         UNION
         SELECT 10, 
                'Plumbing                Full Bath', 
                1, 
                'Quantity', 
                1
         UNION
         SELECT 10, 
                'Plumbing                Full Bath', 
                2, 
                'Rate', 
                4015
         UNION
         SELECT 10, 
                'Plumbing                Full Bath', 
                3, 
                'Quality', 
                3
         UNION
         SELECT 10, 
                'Plumbing                Full Bath', 
                4, 
                'Amount', 
                4015
         UNION
         SELECT 11, 
                'Porch And Deck           Plywood Deck', 
                1, 
                'Quantity', 
                219
         UNION
         SELECT 11, 
                'Porch And Deck           Plywood Deck', 
                2, 
                'Rate', 
                11.25
         UNION
         SELECT 11, 
                'Porch And Deck           Plywood Deck', 
                3, 
                'Quality', 
                3
         UNION
         SELECT 11, 
                'Porch And Deck           Plywood Deck', 
                4, 
                'Amount', 
                2464
         UNION
         SELECT 12, 
                'Porch And Deck           2x4 Deck', 
                1, 
                'Quantity', 
                200
         UNION
         SELECT 12, 
                'Porch And Deck           2x4 Deck', 
                2, 
                'Rate', 
                12.40
         UNION
         SELECT 12, 
                'Porch And Deck           2x4 Deck', 
                3, 
                'Quality', 
                3
         UNION
         SELECT 12, 
                'Porch And Deck           2x4 Deck', 
                4, 
                'Amount', 
                2480
         UNION
         SELECT 13, 
                '', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 13, 
                '', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 13, 
                '', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 13, 
                '', 
                4, 
                'Amount', 
                13095
         UNION
         SELECT 14, 
                'Base MRC', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 14, 
                'Base MRC', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 14, 
                'Base MRC', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 14, 
                'Base MRC', 
                4, 
                'Amount', 
                200933
         UNION
         SELECT 15, 
                'Total % Adjusted', 
                1, 
                'Quantity', 
                .15
         UNION
         SELECT 14, 
                'Total % Adjusted', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 15, 
                'Total % Adjusted', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 15, 
                'Total % Adjusted', 
                4, 
                'Amount', 
                18184
         UNION
         SELECT 16, 
                'Subtotal applied to % Complete', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 16, 
                'Subtotal applied to % Complete', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 16, 
                'Subtotal applied to % Complete', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 16, 
                'Subtotal applied to % Complete', 
                4, 
                'Amount', 
                219716
         UNION
         SELECT 17, 
                'MRC', 
                1, 
                'Quantity', 
                NULL
         UNION
         SELECT 17, 
                'MRC', 
                2, 
                'Rate', 
                NULL
         UNION
         SELECT 17, 
                'MRC', 
                3, 
                'Quality', 
                NULL
         UNION
         SELECT 17, 
                'MRC', 
                4, 
                'Amount', 
                219716)
     SELECT *
     FROM cte
     ORDER BY [KEY];