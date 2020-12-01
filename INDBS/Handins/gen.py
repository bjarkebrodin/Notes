def PrintSQL(Att1, Att2):
 print(f"SELECT '{Att1} --> {Att2}' AS FD,\
  CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'\
  ELSE 'does not hold' END AS VALIDITY\
  FROM (\
  SELECT {Att1}\
  FROM Project\
  GROUP BY {Att1}\
  HAVING COUNT(DISTINCT {Att2}) > 1\
  ) X;"
  )

R = ['id', 'pid', 'sid', 'sn', 'pn', 'mid', 'mn']
for i in range(len(R)):
  for j in range(len(R)):
    if (i != j):
      PrintSQL(R[i], R[j])
