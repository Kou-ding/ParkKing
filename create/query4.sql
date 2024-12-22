-- Purpose: Query to get all the available private parking spots of each grid in a facility.
select 
    grid.facility_location as Facility,
    grid.grid_id as Grid_id,
    count(*) as Capacity_Per_Grid
from 
    private_parking_spot join grid 
on 
    private_parking_spot.grid_id = grid.grid_id 
where 
    grid.facility_location = "Thermi 42"
    and
    private_parking_spot.vacancy_status=True
group by 
    grid.grid_id;