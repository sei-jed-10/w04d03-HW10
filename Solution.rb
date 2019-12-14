class Subway
    attr_accessor :break_point_of_start
    attr_accessor :break_point_of_end
    attr_accessor :result
    attr_accessor :steps
    attr_accessor :subway
    def initialize(start_line,start_station,end_line,end_station)
        @subway = {
            red:["South Station","Kendall","Central","Harvard", "Park Street", "Porter","Davis", "Alewife"],
            green:["Government Center","Boylston","Arlington","Park Street", "Copley", "Hynes","Kenmore"],
            orange:["North Station","Haymarket", "State", "Downtown Crossing", "Chinatown","Park Street", "Back Bay", "Forest Hills"]
           }
           @start_line = start_line
           @start_station = subway[start_line.to_sym].index(start_station)
           @end_line = end_line
           @end_station = subway[end_line.to_sym].index(end_station)
           @break_point_of_start = subway[start_line.to_sym].index('Park Street')
           @break_point_of_end = subway[end_line.to_sym].index('Park Street') 
           @result = 0
           @steps = 0
    end    
end
class Line < Subway
    def stops_between_stations
       if @start_line == @end_line
            p  @result = (@start_station - @end_station).abs
       elsif @start_line != @end_line
            @steps = (@start_station - @break_point_of_start ).abs
            p @result = (@end_station - @break_point_of_end).abs + steps
       end
    end
end

mbta = Line.new('red','Davis','red','Porter')
mbta.stops_between_stations