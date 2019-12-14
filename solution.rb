class Subway  
  attr_accessor :lines # to make accesseble throgh the entire classes
  
  def initialize()
   
  @s = Station.new # an opject to use it function
  end 
 
   def stops_between_stations(start_line,start_station,end_line,end_station)
  
   @s.find_index(start_line,start_station,end_line,end_station,)
  
   end
   
   end
   
  class Line < Subway
 
 def initialize()
  
  @lines = {
   "Red" =>["South Station" ,"Kendall" ,"Central","Harvard","Park Street","Porter" ,"Davis" ,"Alewife"],
  
 "Green" =>[
   "Government Center","Boylston" ,"Arlington" ,"Park Street" ,"Copley" ,"Hynes","Kenmore"
 ],
 "Orange"=> [
  "North Station","Haymarket" ,"State" ,"Downtown Crossing","Chinatown" ,"Park Street" ,"Back Bay" ,"Forest Hills"
 ]
 }
 
 end
 
 end
 ########Line#######
 
 class Station < Line
 
  def find_index(start_line,start_station, end_line ,end_station)
  
 #   all_lines
  start_station_index =lines[start_line].index(start_station)
 
  end_station_index =lines[end_line].index(end_station)
 
   if start_line == end_line
 # to count the stations between
   same_line = start_station_index - end_station_index
   p "You must travel through the following stops on the #{start_line} line:"
   # create an arrey by specifying the range from the line arrey from the station index
    #it will only get the station needed in the trip
 # check the order to print the station in the corrcet trip order
   if start_station_index > end_station_index
 
   lines[start_line][end_station_index..start_station_index].reverse.each do |o|
   s = ""
   print s.concat(o +" ")
   end
  return "#{same_line.abs} stop"   
  else 
  
   lines[start_line][start_station_index..end_station_index].each do |o|
   s = ""
   print s.concat(o +" ")
 
   end
  return "#{same_line.abs} stop"
 
   end
   end
   start_park_index = lines[start_line].index("Park Street")
   end_park_index =   lines[end_line].index("Park Street")
   # to count the stops and then add them to the other line and get the total stops 
  park_strate_start = start_station_index - start_park_index
 
  p "You must travel through the following stops on the #{start_line} line:"
 # checking the order for start station
  if start_station_index < start_park_index
  lines[start_line][start_station_index..start_park_index].each do |o|
   station_to = " "
   print station_to.concat(o +" ")
 
   end
 else 
  statin_correct_order= lines[start_line][start_park_index..start_station_index]
  
  statin_correct_order.reverse.each do |o|
   station_to = ""
   print station_to.concat(o +" ")
  end
   end#if
 
  puts # create new line
 
 puts "Change at Park Street."
 
 park_strate_end  = end_station_index - end_park_index
  #total stops
  dif_lines = park_strate_start.abs + park_strate_end.abs
 
   p "You must travel through the following stops on the #{end_line} line:"
 # -1 to prevent printing park strate agin
 if end_station_index < end_park_index
  lines[end_line][end_station_index..end_park_index-1].reverse.each do |o|
   station_to = ""
   print station_to.concat(o +" ")
   end
 else 
  statin_correct_order= lines[end_line][end_park_index+1..end_station_index]
  
  statin_correct_order.each do |o|
   station_to = ""
   print station_to.concat(o +" ")
  end
   end#if
   puts
   return "#{dif_lines.abs } stops in total"
 end
 
 end
 
 f = Subway.new
 p f.stops_between_stations("Red","South Station","Red","Alewife")
  