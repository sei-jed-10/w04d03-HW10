class Subway
    attr_accessor :red
    attr_accessor :green
    attr_accessor :orange


    def initialize 


        @red = ["South Station","Kendall","Central","Harvard","Park Street","Porter","Davis","Alewife"]
        @green = ["Government Center","Boylston","Arlington","Park Street","Copley","Hynes","Kenmore"]
        @orange = ["North Station","Haymarket","State","Downtown Crossing","Chinatown","Park Street","Back Bay","Forest Hills"]
        


    end

    def stops_between_stations(start_line, start_station, end_line, end_station)

        @dist = 0;
        start_line = self.instance_variable_get("@#{start_line}")
        end_line = self.instance_variable_get("@#{end_line}")

        if start_line == end_line

        dist = (start_line.index(start_station)- end_line.index(end_station)).abs
        puts "Number of Stations to be travelled is #{dist} "

        elsif start_line != end_line

            if start_station == "Park Street"
                puts "Switching lines"
                dist = (start_line.index("Park Street") - end_line.index(end_station)).abs
                puts "Number of Stations to be travelled is #{dist} "
            elsif end_station == "Park Street"
                puts "Switching lines"
                dist = (start_line.index(start_station) - end_line.index("Park Street")).abs
                puts "Number of Stations to be travelled is #{dist} "
            elsif start_station && end_station != "Park Street"
                puts "Switching lines"
                dist = (start_line.index(start_station)- start_line.index("Park Street")).abs + (end_line.index(end_station) - end_line.index("Park Street")).abs
                puts "Number of Stations to be travelled is #{dist} "
                
            end


        end

   
    end
end

    
#   # One line, all the stations on that line
#   class Line 

#     attr_accessor :station
#     attr_accessor :color_of_line

#     def initialize (station,color_of_line)

#         @color_of_line = color_of_line
#         @station = station

#     end
    

#   end
  
#   # One station
#   class Station 

#     def initialize(name)
#         @name = name
#     end

#   end


  
  mbta = Subway.new
  mbta.stops_between_stations('red', 'Alewife', 'red', 'Park Street') # 3 stops
  #mbta.stops_between_stations('red', 'Alewife', 'orange', 'Downtown Crossing') # 5 stops 
  #mbta.stops_between_stations('red', 'South Station', 'green', 'Kenmore') # 7 stops 
  
