
 
 class Subway

    attr_accessor :lines

    def initialize()
          @way = Station.new 

      end
   end
      
  def stops_between_stations(start_line, start_station, end_line, end_station)

      @way.index(start_line, start_station, end_line, end_station)

end




class Line < Subway
 
    
    def initialize()

   $subwayLines = {
       "Red" => [
         'South Station',
         'Kendall',
         'Central',
         'Harvard',
         'Park Street',
         'Porter',
         'Davis',
         'Alewife'
       ],
       "Green" => [
         'Government Center',
         'Boylston',
         'Arlington',
         'Park Street',
         'Copley',
         'Hynes',
         'Kenmore'
       ],
     "Orange" => [
         'North Station',
         'Haymarket',
         'State',
         'Downtown Crossing',
         'Chinatown',
         'Park Street',
         'Back Bay',
         'Forest Hills'
       ]
     } end

end


class Station < Line 

    def index(start_line, start_station, end_line, end_station)


         $stops =0
            $total_stops=0

            indexof_start_station = lines[start_line.to_sym].index(start_station)
            indexof_end_station = lines[end_line.to_sym].index(end_station)

            if start_line == end_line

                stops = (indexof_start_station-indexof_end_station).abs
                return "#{stops} stops"

            end

            if start_line != end_line

                indexof_parkStreet_start = lines[start_line.to_sym].index("Park Street")
                indexof_parkStreet_end = lines[end_line.to_sym].index("Park Street")

                park_street_start_line = (indexof_start_station - indexof_parkStreet_start).abs
                park_street_end_line = (indexof_end_station - indexof_parkStreet_end).abs

                total_stops = park_street_start_line + park_street_end_line

                return "#{total_stops} stops"

            end
    end

end



mbta = Subway.new
#mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street') # 3 stops
#mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
#mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops
