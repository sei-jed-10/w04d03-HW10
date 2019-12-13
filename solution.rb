class Subway  
 attr_accessor :lines
 
 def initialize()
  


 @s = Station.new
 end 

  def stops_between_stations(start_line,start_station,end_line,end_station)
 
  @s.find_index(start_line,start_station,end_line,end_station,)
 
  end
  
  end
  
 class Line < Subway

def initialize()
 
 @lines = {
  "Red" =>["South Station" ,
"Kendall" ,
"Central",
"Harvard",
"Park Street",
"Porter" ,
"Davis" ,
"Alewife"],
 
"Green" =>[
  "Government Center",
"Boylston" ,
"Arlington" ,
"Park Street" ,
"Copley" ,
"Hynes",
"Kenmore"
],
"Orange" => [
 "North Station",
"Haymarket" ,
"State" ,
"Downtown Crossing",
"Chinatown" ,
"Park Street" ,
"Back Bay" ,
"Forest Hills"
]
}
# ,

#  Green:["Government Center",
# "Boylston",
# "Arlington",
# "Park Street",
# "Copley",
# "Hynes",
# "Kenmore"]}

end

 
end
########Line#######

class Station < Line

 def find_index(start_line,start_station, end_line ,end_station)
 
#   all_lines
start_station_index =lines[start_line].index(start_station)

 end_station_index =lines[end_line].index(end_station)


  if start_line == end_line

  same_line = start_station_index - end_station_index
  same_line.abs
 return "#{same_line} stop"

  end
park_strate_start = start_station_index - lines[start_line].index("Park Street")


park_strate_end  = end_station_index - lines[end_line].index("Park Street")
 
 dif_lines = park_strate_start.abs + park_strate_end.abs
  
  return "#{dif_lines.abs } stop"
end


end

f = Subway.new
p f.stops_between_stations("Green","Copley","Orange","Chinatown")


# f = Station.new
# p f.find_index("Green","Copley","Orange","Chinatown")

