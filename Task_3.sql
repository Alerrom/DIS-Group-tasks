-- Task 3

/*
Create a report which will display: 
Warehouse Code, 
Purchase order, 
Supplier Code, 

Creation Date Time, 
User who created purchase order, 

Current purchase order status,
Date Time when status was changed to current, 
User who changed purchase order status to current
*/

with creation_info (PURCHASE_ORDER, CREATION_TIME, LAST_UPDATE_DATE_TIME)
as
	(
	select distinct PURCHASE_ORDER, 
		min(STATUS_CHANGE_DATE_TIME) over (partition by PURCHASE_ORDER), 
		USER_
	from MGSCD
	where STATUS = 1
	),
current_info (PURCHASE_ORDER, LAST_UPDATE_DATE_TIME, CURRENT_STATUS, USER_LAST_UPDATER)
as
	(
	select distinct PURCHASE_ORDER, 
		min(STATUS_CHANGE_DATE_TIME) over (partition by PURCHASE_ORDER),
		STATUS,
		USER_
	from MGSCD
	)
select cdf.WAREHOUSE_CODE,
	cdf.PURCHASE_ORDER,
	cdf.SUPPLIER_CODE,
	crinf.CREATION_TIME,
	crinf.LAST_UPDATE_DATE_TIME,
	curinf.CURRENT_STATUS,
	curinf.LAST_UPDATE_DATE_TIME,
	curinf.USER_LAST_UPDATER
from MGCDF as cdf
	inner join creation_info as crinf
		on cdf.PURCHASE_ORDER = crinf.PURCHASE_ORDER
	inner join current_info as curinf
		on cdf.PURCHASE_ORDER = curinf.PURCHASE_ORDER