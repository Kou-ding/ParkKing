-- Purpose: Query to get the capacity of each grid in a facility.
select 
    Private_Parking_Spot.x_coordinate as x
    Private_Parking_Spot.y_coordinate as y
    Private_Parking_Spot.spot_vehicle_type as Vehicle
    Private_Parking_Spot.vacancy_status as Vacancy
    Grid.facility_location as Facility
    count(*) as Capacity_per_Grid
from 
    Private_Parking_Spot join Grid 
on 
    Private_Parking_Spot.grid_id = Grid.grid_id 
where 
    Grid.facility_location = "Delfon 148"
group by 
    grid_id;

