WITH cteValueSum(ProType,
				 yearVal,
				 ValType,
				 Value)
     AS (SELECT 'Land', '2019', 'Assessed', 268000
         UNION
         SELECT 'Land', '2020', 'Actual', 268514
         UNION
         SELECT 'Improvements', '2019', 'Assessed', 183000
		 UNION
         SELECT 'Improvements', '2020', 'Actual', 183474)
     SELECT *
     FROM cteValueSum
	 ORDER BY ProType DESC;


DROP TABLE #temp
GO
CREATE TABLE #temp
(
    ProType varchar(15),
    yearVal varchar(4),
    ValType varchar(10),
	Value money
)
insert into #temp values('Land', '2019', 'Assessed', 268000)
insert into #temp values('Land', '2020', 'Actual', 268514)
insert into #temp values('Improvements', '2019', 'Assessed', 183000)
insert into #temp values('Improvements', '2020', 'Actual', 183474)

SELECT ProType, [2019 Assessed],[2020 Actual]
FROM
(
	SELECT
		ProType,
		Concat(yearVal, ' ' , ValType) AS [Section] ,
		Value as [data]
	FROM #temp
	
)x

PIVOT
(
	max([data])
	FOR [Section] IN([2019 Assessed],[2020 Actual])
) AS p
ORDER BY ProType DESC




