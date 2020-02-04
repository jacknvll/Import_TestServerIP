# ImportTestConnection
 Imports 'Server' names/IPs from file, and tests connections. Returns as a CSV

## Requirements
Imported file must have one column with either hostnames or IP addresses. The running computer must be on the same network as the queried machines.
Export file and location can be specified, otherwise it will default to $PWD and the file name "results.csv".
Count defaults to 1. This cannot be changed yet.

## How To Use
### Example 1:
Test-ServerIP -File servers.txt
This will import a file called servers.txt that is located in the same directory your command is running. The function will test each object in the list for one Ping test. The results will be compiled into a file called results.csv and save to working directory.
### Example 2:
Test-ServerIP -File servers.txt -Export 'C:\Temp\report.csv'
This imports the 'servers.txt' file and exports to the 'reports.csv' file located in C:\Temp.

## Possible Upgrades
### Count
User able to specify the count. This will increase the time required to complete the task. Count can default to 1, unless otherwise specified. Recommended to not go over 4. Switch statement for successful Count: 
If speciified Count, return ON. 
If less than specified Count, return BAD. 
If 0, return OFF.
### FileType
Create switch statement / Parameter Set. If the imported file is a text file (one column) or a csv file (multiple columns). The CSV file needs to be in a readable format. For example, the column name must either be in an order or must be the specific Name "Hostname".
Additional Parameter for the column name definition. This would need to be a mandatory field if the parameter 'FileType'=CSV. This definition would remove the requirement of the CSV file required to be in a readable state as the user will need to specify the 'ColumnName'.