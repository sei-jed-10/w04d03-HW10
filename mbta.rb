class Subway
    
def stops_between_stations(line1,station1, line2, station2)
    orangeLine = Line.new("Orange")
    orangeLine.orange
    #puts orangeLine.get_station[6].get_name
    #puts orangeLine.get_station[1].get_name
    greenLine = Line.new("Green")
    greenLine.green

    redLine = Line.new("Red")
    redLine.red

    sub = [greenLine,orangeLine,redLine]

    subline1 = sub.find{|line| line.get_lineName == line1}

     subline2 = sub.find{|line| line.get_lineName == line2}

    # puts 
     subline1
     if line1 == line2
   startstation= subline1.get_station.index{ |station| station.get_name == station1 }

   endstation = subline1.get_station.index{ |station| station.get_name == station2 }

    puts "// #{(endstation - startstation).abs} stops "
    end
    if line1 != line2
  startstation1= subline1.get_station.index{ |station| station.get_name == station1 }

   endstation1 = subline1.get_station.index{ |station| station.get_name == "Park Street" }

   startstation2= subline2.get_station.index{ |station| station.get_name == "Park Street"  }

   endstation2 = subline2.get_station.index{ |station| station.get_name == station2 }

   firstLegStops = (endstation1 - startstation1).abs
   secondLegStops = (endstation2 - startstation2).abs

   puts " // #{(firstLegStops.abs + secondLegStops.abs)} stops"

   ## bonce
  #  `# "You must travel through the following stops on the #{line1} line"
  #  #{station1} `
  # 3.times  {|x| p subline1[startstation1]}
  # hange at #{station2}."
 # "Your trip continues through the following stops on #{line2} Line:" 
 # 3.times  {|x| p subline2[startstation2]}
# " #{(firstLegStops.abs + secondLegStops.abs)} stops in total."
     
   end
end
end



class Station
def initialize(name)
  @name = name
end
def get_name
@name
end
end

class Line
  attr_reader :name
  attr_reader :stations

def initialize(name)
  @name = name
  @stations
end
def green
    @stations= [
        Station.new("Government Center"),
        Station.new("Boylston"),
        Station.new("Arlington"),
        Station.new("Park Street"),
        Station.new("Copley"),
        Station.new("Hynes"),
        Station.new("Kenmore")]
  end 

  def red
    @stations= [
        Station.new("South Station"),
        Station.new("Kendall"),
        Station.new("Central"),
        Station.new("Harvard"),
        Station.new("Park Street"),
        Station.new("Porter"),
        Station.new("Davis"),
        Station.new("Alewife")]
  end 
  
  def orange
    @stations= [
        Station.new("North Station"),
        Station.new("Haymarket"),
        Station.new("State"),
        Station.new("Harvard"),
        Station.new("Downtown Crossing"),
        Station.new("Chinatown"),
        Station.new("Park Street"),
        Station.new("Back Bay"),
        Station.new("Forest Hills")]
  end 
   
  def get_station
    @stations
  end 
  def get_lineName
    @name
  end   
end

mbta= Subway.new()
mbta.stops_between_stations("Red","South Station","Green", "Kenmore")

#Double Bonus

# bonD = Subway.new()
# p "Enter the start_line "

# start_line = gets.chomp

# p "Enter the start_station"

# start_station = gets.chomp

# p "Enter the end_line"

# end_line = gets.chomp

# p "Enter the end_station"

# end_station = gets.chomp

# bonD.stops_between_stations(start_line,start_station,end_line, end_station)






