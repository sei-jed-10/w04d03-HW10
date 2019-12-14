class Subway

    def stops_between_stations(start_line, start_station, end_line, end_station)
       if start_line === end_line
       ($lines[start_line].index(start_station)) - $lines[end_line].index(end_station).abs
  
      elsif start_line != end_line
       ($lines[start_line].index(start_station) - $lines[start_line].index("Park Street")).abs + ($lines[end_line].index(end_station) - $lines[end_line].index("Park Street")).abs
       end
    end
    end
  
  class Line
  $lines = {
      "Red" => ['South Station','Kendall','Central','Harvard','Park Street','Porter','Davis','Alewife'],
      "Green" => ['Government Center','Boylston','Arlington','Park Street','Copley','Hynes','Kenmore'],
      "Orange" => ['North Station','Haymarket','State','Downtown Crossing','Chinatown','Park Street','Back Bay','Forest Hills']
       }
  end
  
  mbta = Subway.new
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street') 
  mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') 
  mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') 