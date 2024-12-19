-- Purpose: Query to get the status of public parking spot.
select 
    spot_location, 
    time_when_marked_vacant,
    vacancy_status
from
    Public_Parking_Spot
where 
    -- if we make it an array with two floats we can
    -- use a query to limit the searches to a certain area
    --spot_location_x >= 40,60 and spot location_x <= 40.62 and 
    --spot_location_y >= 22.95 and spot_location_y <= 22.97;
    -- If we use something like 
    -- spot_location = "40.494741,23.007795"
    -- then there is no way to implement an sql query to the problem.
    -- It will have to be done in the application layer by:
    -- understanging the x and y coordinates from the varchar
    and
    vacancy_status = 1;


-- Purpose: Query to update the status of a public parking spot.
-- This needs an algorithm to check if the spot's location is near
-- enough to any other entry in the database.
update 
    Public_Parking_Spot
set
    photograph = 'photograph.png',
    time_when_marked_vacant = 'current_time',
    vacancy_status = 1
where 
    spot_location = "40.494741,23.007795";

-- Purpose: Query to insert a new public parking spot.
-- This implementation has no plan of mapping the urban grid.
-- It assumes every spot gets created from scratch each time it is inserted.
insert into 
    Public_Parking_Spot
values 
    ("40.494741,23.007795","current_time", "photograph.png", 1);