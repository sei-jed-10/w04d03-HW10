# Ruby Objects Homework

## Objectives:

- Apply your knowledge of Ruby to solve a real world problem.
- Get really good at Ruby classes and objects

## Activity

Create a program that models a subway system.

The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the journey and the total number of stops for the trip in the console:

There are 3 subway lines:

**Red line**
- South Station
- Kendall
- Central
- Harvard
- Park Street
- Porter
- Davis
- Alewife

**Green line** 
- Government Center
- Boylston
- Arlington
- Park Street
- Copley
- Hynes
- Kenmore

**Orange line**
- North Station
- Haymarket
- State
- Downtown Crossing
- Chinatown
- Park Street
- Back Bay
- Forest Hills

All 3 subway lines intersect at Park Street, but there are no other intersection points.

### Goal

Tell the user the number of stops between stations using ruby classes.
```rb

class Subway
# Class subway has stops_between_stations methods which will call the method in class line
  def stops_between_stations(start_line, start_station, end_line, end_station)
  end
end
  
# One line, all the stations on that line
class Line
# It has initialize which will have stations and methods that will return index staion,
# Also, method that count one line
end

# One station
class Station
# It has initialize for the name
end
```

And we should be able to find the number of stops with
```rb
mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street')) # 3 stops
mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops
```

### Bonus

Tell the user the number of stops between stations AND the stops IN ORDER that they will pass through or change at.
```rb
mbta = Subway.new
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') 
# "You must travel through the following stops on the Red line:"
# "South Station, Kendall, Central, Harvard and Park Street"
# "Change at Park Street."
# "Your trip continues through the following stops on Green Line:" 
# "Copley, Hines, and Kenmore."
# "7 stops in total."
```

### Double Bonus

Use `get` to allow the user to input their start line, start station, end line, and end station.
