# apache-druid
Dockerfile de druid 


docker build -t mydruid-27 .

docker run -p 8888:8888 mydruid-27


## Query


SELECT 
  "countryName",
  //SUM(added) FILTER(WHERE channel = '#en.wikipedia'),
  REPLACE(countryName, 'Argentina', 'Madrid')

FROM "wikiticker-2015-09-12-sampled"

GROUP BY "countryName" 

limit 5

## Docker
https://hub.docker.com/r/systemdeveloper868/druid
