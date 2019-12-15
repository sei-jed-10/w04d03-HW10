$subway= { 
Red:['South Station', 'Kendall', 'Central', 'Harvard', 'Park Street', 'Porter', 'Davis', 'Alewife'],
Green:['Government Center', 'Boylston', 'Arlington', 'Park Street', 'Copley', 'Hynes', 'Kenmore'],
Orange:['North Station', 'Haymarket', 'State', 'Downtown Crossing', 'Chinatown', 'Park Street', 'Back Bay', 'Forest Hills']
}
class Subway
  attr_accessor :last_line, :first_line
    def initialize
        @first_line = first_line
        @last_line = last_line

    end
  def stops_between_stations(start_line, start_station, end_line, end_station)
   if first_line == last_line
    last_line =  $subway[last_line.to_sym].index(last_station) 
    first_line =  $subway[first_line.to_sym].index(first_station) 
    last_line - first_line
   end
   
  end
end
  
# One line, all the stations on that line
class Line < Subway
    attr_accessor 
    def initialize
        f first_line != last_line
    pS1 =  $subway[first_line.to_sym].index("Park Street") 
    pS2 =  $subway[last_line.to_sym].index("Park Street")
    pS1 + pS2 
    end
    end
end

# One station
class Station < Subway
    def initialize
    end
end
```

And we should be able to find the number of stops with
```rb
mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street')) # 3 stops
mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops


### Double Bonus

##Use `get` to allow the user to input their start line, start station, end line, and end station.
