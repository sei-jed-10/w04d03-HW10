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
  def stops_between_stations(start_line, start_station, end_line, end_station)
  end
end
  
# One line, all the stations on that line
class Line
end

# One station
class Station
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

```rb

class Subway
  attr_accessor:start_line
  attr_accessor:start_station
  attr_accessor:end_line
  attr_accessor:end_station
  attr_reader:subways
  attr_accessor:stops

  def initialize
     @stops = 0
     @subways = {
        
        Red: ["South Station","Kendall","Central","Harvard","Park Street","Porter","Davis","Alewife"]
        Green: ["Government Center","Boylston","Arlington","Park Street","Copley","Hynes","Kenmore"]
        Orange: ["North Station","Haymarket","State","Downtown Crossing","Chinatown","Park Street","Back Bay","Forest Hills"]
        
                }
  end

  def stops_between_stations(start_line, start_station, end_line, end_station)
  @start_line, @start_station, @end_line, @end_station = start_line, start_station, end_line, end_station
  
  if @start_line == @end_line
          @stops = (@subways[@start_line].index(@start_station) - @subways[@end_line].index(@end_station)).abs
        else
          @stops = (@subways[@start_line].index(@start_station) - @subways[@start_line].index('Park Street')).abs
          @stops = @stops + (@subways[@end_line].index(@end_station) - @subways[@end_line].index('Park Street')).abs
        end
  end

end
  
# One line, all the stations on that line
class Line < Subway
attr_reader: name
attr_accessor: stations

      def initialize(name,stations)
        @name = name
        @stations = stations
      end

end

# One station
class Station < Line
attr_reader: name

      def initialize(name)
        @name = name
      end
end


mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street')) # 3 stops
mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops

```