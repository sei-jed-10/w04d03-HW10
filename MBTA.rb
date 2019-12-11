

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

