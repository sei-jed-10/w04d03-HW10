
class System
  attr_accessor :lines

  RED_LINE_STATIONS = [
      'South Station', 'Kendall','Central', 'Harvard','Park Street', 'Porter', 
      'Davis','Alewife'
    ]

    GREEN_LINE_STATIONS = [
      'Government Center', 'Boylston','Arlington','Park Street',
       'Copley','Hynes', 'Kenmore'
    ]

    ORANGE_LINE_STATIONS = [
      'North Station', 'Haymarket', 
      'State', 'Downtown Crossing', 'Chinatown','Park Street',
      'Back Bay', 'Forest Hills'
    ]



  def initialize
      @lines = {
        'Red' => Line.new('Red', RED_LINE_STATIONS),
        'Green' => Line.new('Green', GREEN_LINE_STATIONS),
        'Orange' => Line.new('Orange', ORANGE_LINE_STATIONS)
      }
  end



  
  def stops_between_stations(start_line, start_station, end_line, end_station)
            if start_line == end_line
              single_line(start_line, start_station, end_station)
            else
              multi_line(start_line, start_station, end_line, end_station)
  end
end



  def single_line(line, start_station, end_station)
       start = lines[line].stations.index { |s| s.station_name == start_station }
       stop = lines[line].stations.index { |s| s.station_name == end_station }
       if start < stop
          stop
        else
          start
      end
  end



  def multi_line(start_line, start_station, end_line, end_station)
      start_line_stops = distance_to_park_st(start_line, start_station) # 1
      end_line_stops = distance_to_park_st(end_line, end_station) # 7
  
       (start_line_stops + end_line_stops) - 1
  end



   
  def distance_to_park_st(line, line_station)
      start = lines[line].stations.index { |s| s.station_name == line_station }
      park = lines[line].stations.index { |s| s.station_name == 'Park Street' }

      if start < park
        lines[line].stations[start..park].length - 1
      else
        lines[line].stations[park..start].length
      end
    end
  end





#LINES
class Line
    attr_reader :name, :stations

    def initialize(name, stations)
      @name = name
      @stations = stations.map { |station_name| Station.new(station_name) }
    end
  end




#STATIONS
  class Station
    attr_reader :station_name

    def initialize(station_name)
      @station_name = station_name
    end
  end




mbta = System.new
p mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing')

