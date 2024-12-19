-- Purpose: Query to get the number of customers per manager.
select 
    manager_id, 
    count(*) as Customers_per_Manager
from
    Reservation_Actors
group by 
    manager_id;