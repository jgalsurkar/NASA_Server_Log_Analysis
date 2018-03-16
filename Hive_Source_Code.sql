DROP TABLE IF EXISTS nasa_logs;

-- 1. Create a schema for the dataset in Hive. You will have to create a concrete structure describing all the required fields.

CREATE EXTERNAL TABLE nasa_logs (
`source_ip` STRING,
`date_time` STRING,
`http_method` STRING,
`request_url` STRING,
`http_protocol` STRING,
`status_code` STRING, 
`response_bytes` STRING 
) ROW FORMAT SERDE "org.apache.hadoop.hive.serde2.RegexSerDe" 
WITH SERDEPROPERTIES (
"input.regex" = "([^ ]*) - - \\[([^\\]]*)\\] \"*(.*?)[ \"](.*?)[ \"]\s*(.*?)\"* ([0-9\-]+) ([0-9\-]+)",
"output.format.string" = "%1$s %2$s %3$s %4$s %5$s %6$s %7$s"
) STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/training/Desktop/csds-material/hw/july.txt' OVERWRITE INTO TABLE nasa_logs;

-- 2. Find the number of 200 status code in the response in the month of August.
SELECT COUNT(*) FROM nasa_logs WHERE date_time LIKE '%Aug%' AND status_code = 200;
-- Answer : 2797976

-- 3. Find the number of unique source IPs that have made requests to the NASA server for the month of September.
SELECT COUNT(DISTINCT source_ip) FROM nasa_logs WHERE date_time LIKE '%Sept%';
-- Answer : 81982

-- 4. Which was the most requested URL in the year 1995.
SELECT request_url, COUNT(request_url) as total FROM nasa_logs 
WHERE date_time LIKE '%1995%' GROUP BY request_url 
ORDER BY total DESC LIMIT 1;
-- Answer: /images/NASA-logosmall.gif

-- 5. Make a simple plot depicting the number of requests made in a day for every day in the month of October.
SELECT SUBSTR(date_time, 1, 2), COUNT(SUBSTR(date_time, 1, 2)) FROM nasa_logs WHERE date_time LIKE '%Oct%' GROUP BY substr(date_time, 1, 2);
-- Answer: Plot saved as october.png, R script saved as october_requests.r
/*
04      59557
06      32420
08      60157
11      61246
13      36480
15      58847
17      58988
19      32094
20      32963
22      57762
24      52552
26      31608
28      55496
31      90125
01      33996
03      41388
05      31893
07      57362
09      60458
10      61248
12      38071
14      59878
16      56653
18      56246
21      55540
23      58097
25      57321
27      32823
29      67988
30      80641
*/
