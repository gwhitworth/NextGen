WITH cte([Key], 
         [RowDesc], 
         [ColKey], 
         [ColHead], 
         [DataVal])
     AS (SELECT 1, 
                'Living Room', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 1, 
                'Living Room', 
                2, 
                '1', 
                1
         UNION
         SELECT 1, 
                'Living Room', 
                3, 
                '2', 
                NULL
         UNION
         SELECT 1, 
                'Living Room', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 1, 
                'Living Room', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 2, 
                'Dining Area', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 2, 
                'Dining Area', 
                2, 
                '1', 
                1
         UNION
         SELECT 2, 
                'Dining Area', 
                3, 
                '2', 
                NULL
         UNION
         SELECT 2, 
                'Dining Area', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 2, 
                'Dining Area', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 3, 
                'Kitchen', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 3, 
                'Kitchen', 
                2, 
                '1', 
                1
         UNION
         SELECT 3, 
                'Kitchen', 
                3, 
                '2', 
                NULL
         UNION
         SELECT 3, 
                'Kitchen', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 3, 
                'Kitchen', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 4, 
                'Family / Rec', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 4, 
                'Family / Rec', 
                2, 
                '1', 
                1
         UNION
         SELECT 4, 
                'Family / Rec', 
                3, 
                '2', 
                NULL
         UNION
         SELECT 4, 
                'Family / Rec', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 4, 
                'Family / Rec', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 5, 
                'Bedroom', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 5, 
                'Bedroom', 
                2, 
                '1', 
                2
         UNION
         SELECT 5, 
                'Bedroom', 
                3, 
                '2', 
                3
         UNION
         SELECT 5, 
                'Bedroom', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 5, 
                'Bedroom', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 6, 
                'Utility Room', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 6, 
                'Utility Room', 
                2, 
                '1', 
                1
         UNION
         SELECT 6, 
                'Utility Room', 
                3, 
                '2', 
                NULL
         UNION
         SELECT 6, 
                'Utility Room', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 6, 
                'Utility Room', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 7, 
                'Entry', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 7, 
                'Entry', 
                2, 
                '1', 
                1
         UNION
         SELECT 7, 
                'Entry', 
                3, 
                '2', 
                NULL
         UNION
         SELECT 7, 
                'Entry', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 7, 
                'Entry', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 8, 
                'Full Bath', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 8, 
                'Full Bath', 
                2, 
                '1', 
                1
         UNION
         SELECT 8, 
                'Full Bath', 
                3, 
                '2', 
                1
         UNION
         SELECT 8, 
                'Full Bath', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 8, 
                'Full Bath', 
                5, 
                'A', 
                NULL
         UNION
         SELECT 9, 
                'Other', 
                1, 
                'B', 
                NULL
         UNION
         SELECT 9, 
                'Other', 
                2, 
                '1', 
                NULL
         UNION
         SELECT 9, 
                'Other', 
                3, 
                '2', 
                1
         UNION
         SELECT 9, 
                'Other', 
                4, 
                '3', 
                NULL
         UNION
         SELECT 9, 
                'Other', 
                5, 
                'A', 
                NULL)
     SELECT *
     FROM cte
     ORDER BY [KEY];