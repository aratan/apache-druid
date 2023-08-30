# apache-druid
Dockerfile de druid 


docker build -t mydruid-27 .

docker run -p 8888:8888 mydruid-27


## Query

### ejemplos:


 SELECT 
  "countryName",
  //SUM(added) FILTER(WHERE channel = '#en.wikipedia'),
  REPLACE(countryName, 'Argentina', 'Madrid')

FROM "wikiticker-2015-09-12-sampled"

GROUP BY "countryName" 

limit 5

******************************************

1. 

SELECT 
  "countryName", 
  SUM(added)

FROM "wikipedia"
WHERE "countryName" != 'Angola'
GROUP BY countryName

LIMIT 5

******************************************

2.

SELECT 
  "countryName", 
  SUM(added)

FROM "wikipedia"
WHERE "channel" = '#en.wikipedia' AND "countryName" != 'Angola'
GROUP BY countryName

LIMIT 5

******************************************
3. 

SELECT 
  REPLACE(countryName, 'United States', 'El ') AS countryName

FROM wikipedia
WHERE LENGTH(countryName) > 10


******************************************
4. 
SELECT 
  COUNT(*) AS num_nulls

FROM wikipedia
WHERE countryName IS NULL


******************************************


SELECT 
  countryName, COUNT(*) AS num_occurrences

FROM wikipedia
GROUP BY countryName


******************************************

SELECT 
  countryName, COUNT(DISTINCT countryName) AS num_occurrences

FROM wikipedia
GROUP BY countryName

******************************************

SELECT countryName
FROM wikipedia
WHERE countryName IS NOT NULL
GROUP BY countryName

******************************************

SELECT LOWER(countryName) AS countryName
FROM wikipedia
WHERE countryName IS NOT NULL
GROUP BY countryName

******************************************

SELECT 
  REGEXP_REPLACE(countryName, '^Ar', '') AS countryName
FROM wikipedia

******************************************
select 
 "signature",
 JSON_VALUE("controllerExtension", '$.email') AS email
from "inline_data"



## Docker
https://hub.docker.com/r/systemdeveloper868/druid
