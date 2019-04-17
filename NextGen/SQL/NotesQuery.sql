WITH cte([Key], 
         [GrpName], 
         [User ID], 
         [Date], 
         [Notes])
     AS (SELECT 1, 
                'General', 
                'ACHAPLIN', 
                CAST('2015-06-15' AS DATE), 
                'DTR - Redefined Sketch. Modified decks and/or covered porches'
         UNION
         SELECT 2, 
                'General', 
                'TSHYMKO', 
                CAST('2018-04-18' AS DATE), 
                'Land size verified against Parcel Map BC and BCA GIS'
         UNION
         SELECT 3, 
                'Land', 
                'CFSTURRO', 
                CAST('2014-07-24' AS DATE), 
                '2014 Land Review - Land component area has been updated based on the GIS data (assessment fabric).'
         UNION
         SELECT 4, 
                'Land', 
                'CFSTURRO', 
                CAST('2014-09-14' AS DATE), 
                'Land Curve Project 2014 -added acre curve J21362.'
         UNION
         SELECT 5, 
                'Main Building', 
                '', 
                CAST('2003-09-28' AS DATE), 
                'ID: 0101100 NEW ROOF CONDITION LOOKS AVERAGE FOR AGE 03/90. 22OCT98 ADD DECK. 09D EC2002 REVISED SKETCH. INVENTORIED 2002 ADDN FROM PLANS; NO START AS OF 31OCT 2002; ROOM INVENTORY INCLUDES ADDN. ,28AUG2003 HAVE STARTED AT 25 O/O N.O.H'
         UNION
         SELECT 6, 
                'Main Building', 
                '', 
                CAST('2003-09-28' AS DATE), 
                'ID: 0101100 INFE:OVERLOOKING NEW SUBDIVISION - BASEMENT FINISH - NO CONC FNDN. ROOF - NEWER_- DEPN .648 - .10 = .548 HSE IS IN EXTREMELY POOR COND .'
         UNION
         SELECT 7, 
                'Main Building', 
                'CMYEAK', 
                CAST('2015-07-16' AS DATE), 
                'DTR Eff yr review: Chg Eff yr fr 1930 to 1978 to reflect addn in 2003')
     SELECT *
     FROM cte;