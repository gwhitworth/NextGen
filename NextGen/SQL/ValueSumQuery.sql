WITH cteValueDetail(GroupName, 
                    PC, 
                    ExTx, 
                    Value, 
                    [Override Value], 
                    [Actual Land Value], 
                    [Actual Impr Value], 
                    [Assessed Land Value], 
                    [Assessed Impr Value])
     AS (SELECT '2020 Actual Land', 
                '06', 
                '00', 
                183474,
				NULL,
				268514,0,0,0
         UNION
         SELECT '2020 Actual Improvement', 
                '06', 
                '00', 
                183474,
				NULL,
				0,183474,0,0
         UNION
         SELECT '2019 Assessed Land', 
                '06', 
                '00', 
                268000,
				NULL,
				0,0,268000,0
         UNION
         SELECT '2019 Assessed Improvement', 
                '06', 
                '00', 
                183000,
				NULL,
				0,0,0,183000)
     SELECT *
     FROM cteValueDetail
     ORDER BY GroupName DESC;