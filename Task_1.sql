-- Task 1

/*
Create a query which will display: 
Article, 
User, 
Last Tariff Creation Date Time, 

only for user "iomel"
*/

select top 1 tt.Article,
	tt.User, 
	tt.Date_Time
from Tab_tariffs as tt
where tt.User = 'iomel'
order by tt.Date_Time desc