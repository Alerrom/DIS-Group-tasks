-- Task 2

/*
Create a report which will display actual link store-warehouse. 
Fields to be included into query: 
Store Code, 
Store Name, 
Warehouse Code, 
Warehouse Name, 
Priority, 
Link Start Date, 
Link Finish Date

*/

select mag.Unit_Code,
	mag.Unit_Name,
	pdg.WAREHOUSE,
	pdg.PRIORITY,
	pdg.Start_Date,
	pdg.Finish_Date
from MGMAG as mag
	inner join MGPDG as pdg
		on mag.Unit_Code = pdg.Unit_Code