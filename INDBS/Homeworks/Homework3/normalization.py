def PrintSQL(Att1,  Att2):
    print (f"SELECT 'Person: {Att1} --> {Att2}' AS FD, CASE WHEN COUNT(*)=0 THEN 'MAY HOLD' ELSE 'does not hold' END AS VALIDITY FROM (\
     SELECT {Att1}\
     FROM Rentals\
     GROUP BY {Att1}\
     HAVING COUNT(DISTINCT {Att2}) > 1 ) X;")

R = ['pid', 'hid', 'pn','s','hs','hz','hc']
for i in range(len(R)):
    for j in range(len(R)):
        if (i != j):
            PrintSQL(R[i], R[j])
