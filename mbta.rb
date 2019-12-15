$subwayLines = {
    Red:['South Station','Kendall','Central','Harvard','Park Street','Porter','Davis','Alewife'],
    Green:['Government Center','Boylston','Arlington','Park Street','Copley','Hynes','Kenmore'],
    Orange:['North Station','Haymarket','State','Downtown Crossing','Chinatown','Park Street','Back Bay','Forest Hills']}


# Class subway has stops_between_stations methods which will call the method in class line
class Subway
    def stops_between_stations(start_line, start_station, end_line, end_station)
        $start_line = start_line
        $start_station = start_station
        $end_line = end_line
        $end_station = end_station
        #@end_station = $subwayLines[end_line.to_sym].index(end_station)
        lines = Line.new
        lines.initialize
    end

    def stops#(s_station,e_station)
        #s_station = $s_station
        #e_station = $e_station  
        if $start_line == $end_line 
            $stops = $e_station - $s_station
            p  "#{$stops} Stops"

            ########################################       

        elsif $start_line != $end_line

            $stops_t = ($p_start-$s_station)+($e_station-$p_end)
            p  "#{$stops_t} Stops"

            ###########################################


        end
    end
end

# One line, all the stations on that line
# It has initialize which will have stations and methods that will return index staion,
# Also, method that count one line
class Line
    def initialize
        $s_line = $subwayLines[$start_line.to_sym]
        $e_line = $subwayLines[$end_line.to_sym]

        #p $s_line
        #p $e_line
        p "test"

        stations = Station.new
        stations.initialize
    end
end
 
# One station
# It has initialize for the name
class Station
    def initialize
        $s_station = $s_line.index($start_station)
        $e_station = $e_line.index($end_station)
        $p_start = $s_line.index("Park Street")
        $p_end = $e_line.index("Park Street")
        #p $p_start
        #p $p_end

        #p $s_station
        #p $e_station

        subway = Subway.new
        subway.stops
    end
end


mbta = Subway.new
#mbta.stops_between_stations('Red', 'Kendall', 'Red', 'Porter') # 3 stops
#mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops