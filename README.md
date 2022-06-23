# DKatalis Task 1
## Folder Structure
```
+-- csvs                  // folder containing .csv files found in retail-banking-demo-data
|   +-- ...
+-- sql                   // folder containing .sql files for init and queries
|   +-- ...
+-- insights              // folder containing presentation that summarises findings for Task 1
|   +-- ...
+-- docker-compose.yaml   // build instructions
```
## ER Diagram
![QuickDBD-Free Diagram](https://user-images.githubusercontent.com/20048824/175198022-f35df83e-7c60-4d85-82a6-39d61608db70.png)
## Getting Started
### Run container
```
$ docker-compose --verbose up -d
```
- When running container for the first time, database is initiated based on `sql/crm.sql`, and tables filled from `csvs`
- *Note: Transactions table is defined but data is not imported from completedtrans.csv due to large file size*
### Run SQL queries 
- SQL queries used to populate insights are found in `sql` folder
```
Page 3
- sql/average_service_time_by_server_1.sql
- sql/average_service_time_by_server_2.sql
- sql/average_service_time_by_server_3.sql
Page 4
- sql/average_service_time_by_response_and_dispute_1.sql
- sql/average_service_time_by_response_and_dispute_2.sql
```
- Run a test query
```
$ docker-compose exec postgres psql -U postgres -d crm -c "SELECT * FROM loan LIMIT 5"
```
![image](https://user-images.githubusercontent.com/20048824/175203500-40212f32-cde4-4718-9d23-5fa9e097697f.png)

- To run the pre-built SQL queries, in the same terminal, run
```
$ docker-compose exec postgres psql -U postgres -d crm -f ./var/lib/postgresql/sql/{SQL_FILE}
```
Example
```
$ docker-compose exec postgres psql -U postgres -d crm -f var/lib/postgresql/sql/average_service_time_by_priority.sql
```
![image](https://user-images.githubusercontent.com/20048824/175203560-94d62c43-04cd-4e29-8dfa-4b65ac4a5a84.png)
