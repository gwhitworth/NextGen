--SELECT * FROM BCA_COMMON.AEDIT_VW
--WHERE "Table Name" LIKE '%REG%';

--SELECT * FROM BCA_COMMON.AEDIT_VW
--WHERE "Message" LIKE '%Brew%'

--SELECT * FROM BCA_COMMON.AEDITJUR_VW
--WHERE "Message" LIKE '%Industrial%'

--SELECT * FROM BCA_COMMON.AEDITJUR_VW
--WHERE "Value" = '23'


--SELECT * FROM BCA_COMMON.AEDIT_VW
--WHERE "Value" = '23'

SELECT * FROM BCA_COMMON.AEDIT_VW
WHERE "Table Name" LIKE 'REGMAST' AND "Field Name" = 'PLCATEGORY'
ORDER BY "Message";

--SELECT * FROM BCA_COMMON.AEDIT_VW
--WHERE "Value" LIKE '%ind%'
--ORDER BY "Message";

--
--SELECT * FROM BCA_COMMON.AEDIT_VW
--WHERE "Message" LIKE '%PLCATEGORY%'
----ORDER BY "Message";




--SELECT * FROM BCA_COMMON.AEDITJUR_VW
--WHERE "Table Name" LIKE 'REGMAST' AND "Field Name" = 'PLCATEGORY'
--ORDER BY "Message";
