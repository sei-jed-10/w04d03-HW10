class Subway
  attr_accessor :start_line
  attr_accessor :start_station
  attr_accessor :end_line
  attr_accessor :end_station
  attr_accessor :stops
  def initialize
     @stops = 0
   @red =  Line.new('red',["South Station","Kendall","Central","Harvard","Park Street","Porter","Davis","Alewife"]) 
   @green = Line.new('green',["Government Center","Boylston","Arlington","Park Street","Copley","Hynes","Kenmore"]) 
   @orange = Line.new('orange',["North Station","Haymarket","State","Downtown Crossing","Chinatown","Park Street","Back Bay","Forest Hills"]) 
  
  end
  def stops_between_stations()#start_line, start_station, end_line, end_station)
    puts "Please Enter StartLine: "
    start_line = gets.chomp
     
    puts "Please Enter StartStation : "
    start_station = gets.chomp
    
    puts "Please Enter EndLine : "
    end_line = gets.chomp
   
    puts "Please Enter EndStation : "
    end_station = gets.chomp

  @start_line = self.instance_variable_get("@#{start_line}")
  @end_line = self.instance_variable_get("@#{end_line}")
  
    if @start_line == @end_line  
      Line.same_count_index(@start_line, start_station, end_station)
    else
      Line.deff_count_index(@start_line, start_station, @end_line, end_station)
    end
  end
end
# One line, all the stations on that line
class Line
  attr_reader :name
  attr_accessor :stations
       def initialize(name,stations)
        @name = name
        @stations =  stations
       end
       def self.same_count_index(line, start_station, end_station)
        stops = ( line.stations.index(end_station) - line.stations.index(start_station) ).abs
            # bouns       
         puts "Rider Transfers from #{@start_line} line from #{start_station}"
         puts "Rider Arrives to #{@end_line} line At #{end_station} "
         puts "#{stops} stops"
       end
       def self.deff_count_index(start_line, start_station, end_line, end_station)
        stops = (end_line.stations.index(end_station) - end_line.stations.index('Park Street')).abs
        stops = stops + (start_line.stations.index('Park Street') - start_line.stations.index(start_station)).abs
            # bouns       
        puts "Rider Transfers from #{@start_line} line from #{start_station}"
        if startline != endline
         puts "Change at Park Street. "	
        end
        puts "Rider Arrives to #{@end_line} line At #{end_station} "
        puts "#{stops} stops"
       end
end
# One station
class Station
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
mbta = Subway.new
mbta.stops_between_stations()#'red', 'Alewife', 'red', 'Park Street') # 3 stops
# mbta.stops_between_stations('red', 'Alewife', 'orange', 'Downtown Crossing') # 5 stops
# mbta.stops_between_stations('red', 'South Station', 'green', 'Kenmore') # 7 stops