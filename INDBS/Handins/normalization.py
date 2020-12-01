from getpass import getpass as password
from os import environ as env
import itertools
import subprocess as sys

env_password = False

# Check if password var is set
if env.get('PGPASSWORD') != None :
  env_password = True

db = input('Database: ')
user = input('Username: ')

if not env_password : 
  env["PGPASSWORD"] = password()
  

table = input('Table:    ')


def psql(query) :
  return sys.check_output('psql {} -U {} -w <<< "{}" '.format(db, user, query),shell=True) 

def get_columns(table) :
  query = "select  column_name \
           from    information_schema.columns \
           where   table_name = '{}';".format(table)
  return extract(psql(query)) 

def extract(sql) :
  rows = sql.split()[2:-2]
  names = []
  for row in rows :
    names.append( str(row)[2:-1] )
  if len(names) == 1 : return names[0]
  return names

def possibleFD(X,Y) :
  inner = "select   '*' \
           from     {0} \
           group by ({1}) \
           having   count(distinct ({2})) > 1".format(
            table,
            X,
            Y
           )  
  query = "select '' as FD, \
           case   when count(*)=0 then '1' \
           else   '0' end as validity\
           from   ({0}) X;".format(inner)
  return int(extract(psql(query))[-1]) == 1

def checkFD(X,Y) :
  if possibleFD(X,Y) :
    print("{0} -> {1}".format(X,Y))


print('\nIdentifying functional dependencies :')

cols = get_columns(table)
for i in range(2,3):
  R = list()
  R.extend(list(itertools.permutations(cols,i)))

  for t in R :
    X = t[0:i-1]
    if i > 2 : 
      X = ','.join(X)
    else :
      X = X[0] 
    Y = t[-1]
    checkFD(X,Y) 

#todo: add multivalued dependencies

#todo: remove trivial and redundant dependencies

#todo: remove 'fine' dependencies by finding keys

# Leave things how we found them
if not env_password :
  env["PGPASSWORD"] = ""
