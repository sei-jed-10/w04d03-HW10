class Subway
    attr_accessor :line
    
    
    
     def initialize()   

     @station = Station.new
    
      end
      
      def stops_between_stations(start_line, start_station, end_line, end_station)
      
      @station.cal(start_line, start_station, end_line, end_station)
    
    end
      
    # One line, all the stations on that line
    class Line < Subway 
     def initialize()  
    
     @line={
        red:["South Station","Kendall","Central","Harvard","Park Street","Porter","Davis","Alewife"],
        green:["Government Center","Boylston","Arlington","Park Street","Copley","Hynes","Kenmore"],  
        orange: ["North Station","Haymarket","State","Downtown Crossing","Chinatown","Park Street","Back Bay","Forest Hills"]
     }
      end
    
    
    
    end
    
    
    # One station
    class Station < Line

    def cal(start_line, start_station, end_line, end_station)
    
        str_station = line[start_line.downcase.to_sym].index(start_station);
     en_station = line[end_line.downcase.to_sym].index(end_station); 
     break_line1 = line[start_line.downcase.to_sym].index("Park Street")
     break_line2 = line[end_line.downcase.to_sym].index("Park Street")
     first_stop = 0
     second_stop = 0
     result = 0
    
    if start_line == end_line
      result = (str_station - en_station).abs
      p "You need to take #{result} Stops from #{start_station} to #{end_station}"
    else
          first_stop = (str_station - break_line1).abs
        second_stop = (((en_station - break_line2).abs)+ first_stop)
           p "You need to take #{second_stop} Stops from #{start_station} to #{end_station}"
    
     end
    
     end
    end
    
    
    end
    
    mbta = Subway.new
    # mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street') # 3 stops
    # mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
    # mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops

    p "Enter the statrt line"

user_input1 = gets.chomp

p "Enter the statrt station"

user_input2 = gets.chomp

p "Enter the end line"

user_input3 = gets.chomp

p "Enter the end station"

user_input4 = gets.chomp


mbta.stops_between_stations(user_input1, user_input2, user_input3, user_input4)