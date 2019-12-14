# Class subway has stops_between_stations methods which will call the method in class line
class Subway 

  def initialize()
    @lin = Line.new # an opject to use it function
  end 
 
   def stops_between_stations (start_line,start_station, end_line, end_station) 
 
    intersection_index_1= @lin.lines[start_line].index("Park Street")
    intersection_index_2= @lin.lines[end_line].index("Park Street")
    start_station_index= @lin.lines[start_line].index(start_station) 
    end_station_index= @lin.lines[end_line].index(end_station)
 
             
   if (start_line == end_line)
 
     if(start_station==end_station)   
      puts "Rider boards the train a #{start_station} Station and end up in the same station ."
      puts "Number of stops = 0 " 
                   
     elsif (start_station_index < end_station_index)
       puts "Rider boards the train a #{start_line} Line and #{start_station} "
       arr = @lin.lines[start_line].slice(start_station_index , end_station_index + 1)
       print " This is the stops stations #{arr} \n"
       num =@lin.Stops_loop(arr)
       puts "Rider exits the train at #{end_line} Line and #{end_station} "
       puts "Number of stops = #{num} "
                   
     elsif (start_station_index>end_station_index)
       puts "Rider boards the train a #{start_line} Line and #{start_station} "
       arr = @lin.lines[start_line].slice( end_station_index , start_station_index + 1)
       print " This is the stops stations #{arr.reverse()} \n"
       num = @lin.Stops_loop(arr)
       puts "Rider exits the train at #{end_line} Line and #{end_station} "
       puts "Number of stops = #{num} "
     end
                   
   else
     if(start_station_index > intersection_index_1)
       puts "Rider boards the train a #{start_line} Line and #{start_station} "
       arr1 = @lin.lines[start_line].slice( intersection_index_1 , start_station_index + 1 )
       arr2 = @lin.lines[end_line].slice( end_station_index , intersection_index_2 -2  )
       p arr1.reverse()
       puts "Rider transfers from #{start_line} Line to #{end_line} Line at Park Street. "
       p arr2.reverse()
       num1 =@lin.Stops_loop(arr1)
       num2=@lin.Stops_loop(arr2)
       num =num1+num2
       puts "Rider exits the train at #{end_line} Line and #{end_station} "
       puts "Number of stops = #{num} "
             
     elsif( intersection_index_1 > start_station_index)
       puts "Rider boards the train a #{start_line} Line and #{start_station} "
       arr1 = @lin.lines[start_line].slice(start_station_index , intersection_index_1 + 1)
       arr2 = @lin.lines[end_line].slice(intersection_index_2 , end_station_index + 1)
       p arr1
       num1 =@lin.Stops_loop(arr1)
       puts "Rider transfers from #{start_line} Line to #{end_line} Line at Park Street. "
       p arr2 
       num2=@lin.Stops_loop(arr2)
       num =num1+num2
       puts "Rider exits the train at #{end_line} Line and #{end_station} "
       puts "Number of stops = #{num} "
     end
   end 
 end #for def
 end #for class
 
 
       
 # One line, all the stations on that line
 class Line
   attr_accessor :lines 
  
   # It has initialize which will have stations 
  def initialize()
    @lines = {
    "red" =>["South Station" ,"Kendall" ,"Central","Harvard","Park Street","Porter" ,"Davis" ,"Alewife"],
    "green" =>["Government Center","Boylston" ,"Arlington" ,"Park Street" ,"Copley" ,"Hynes","Kenmore" ],
    "orange"=>["North Station","Haymarket" ,"State" ,"Downtown Crossing","Chinatown" ,"Park Street" ,"Back Bay" ,"Forest Hills" ]
     }
  end
   
   def call_station ()
     @lines.map{|stat|
     Station.new(stat) } 
   end
 
   #methods that will return index station
   def station_index(station_name) 
     for station in arr_stat
       if station.name==station_name 
         return arr_stat.index(station)
       end
     end 
   end
 
   # method that count one line
   def Stops_loop (arr)# counter of Number of stops
    stops = -1
     for lines in arr do
       stops +=1
     end 
    return stops
   end
 
 end
 
 
 # One station
 class Station
   attr_accessor :name 
   # It has initialize for the name
   def initialize (name)
     @name = name
   end   
 end
 
 
 
 mbta = Subway.new
 mbta.stops_between_stations('red', 'Alewife', 'red', 'Park Street') # 3 stops
 #mbta.stops_between_stations('red','Park Street', 'red', 'Alewife') # 3 stops
 #mbta.stops_between_stations('red', 'Alewife', 'orange', 'Downtown Crossing') # 5 stops
 #mbta.stops_between_stations('red', 'South Station', 'green', 'Kenmore') # 7 stops