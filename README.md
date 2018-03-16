# NASA_Server_Log_Analysis
Used Hadoop/MapReduce and Hive to analyze, explore, and answer questions about Nasa's server log files.

## Data
Nasa Server Logs. 

## Technology Used
- Hive/SQL
- Hadoop (MapReduce)
- Python 3

## Some Questions Answered

Find the number of 200 status code in the response in the month of August.

Answer : 2797976

Find the number of unique source IPs that have made requests to the NASA server for the month of September.

Answer : 81982

Which was the most requested URL in the year 1995.

Answer: /images/NASA-logosmall.gif

Simple plot depicting the number of requests made in a day for every day in the month of October.

![](./october.png)

Error Codes Used (MapReduce):

200 9301563

302 219210

304 800316

400 45

403 675

404 62700

500 195

501 123
