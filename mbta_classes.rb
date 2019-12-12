class Subway
attr_accessor :subway_line_list
$intersection = "Park Street"

    def initialize
        @subway_line_list=[] #will be used to store references to 'Line' objects for Red, Green, and Orange Lines.
    end

    def add_subway_lines(line1,line2,line3)
        @subway_line_list=[line1,line2,line3] #Method to add the lines to the list.
    end

    def getSubwayLineList(inputLine)
        for line in @subway_line_list #loop through the array of subway_line_list
            if(line.name==inputLine.downcase) #compare each line name with the name used as an input.
            return line #if it exists, return reference of that line
            end
        end
            return "error" #else, return error (will be used by another method to notify the user about the mistake).
    end


    def stops_between_stations(start_line, start_station, end_line, end_station)
        numberOfStops = 0 #Will use it as a counter for each station the rider stops by.
        startSubwayLineList = getSubwayLineList(start_line) #stores the array representing the start line in another called startSubwayLineList
        endSubwayLineList = getSubwayLineList(end_line) #stores the array representing the end line in another called endSubwayLineList
        if (startSubwayLineList == "error" || endSubwayLineList == "error")  #if either the start or end subway line name is wrong.
            puts("\nSorry you entered an invalid subway line name!") #Display a message informing the user about their wrong entry.
        return
        #if either start or end station names are incorrecr:
        elsif(!(startSubwayLineList.validate_station(start_station))||!(endSubwayLineList.validate_station(end_station)))
            puts("\nSorry you entered an invalid station name!") #diaplay a message to the user.
        return
    
        else
            if(startSubwayLineList==endSubwayLineList) #if start line is the same as end line:
                if(start_station==end_station) #check if the start and end stations on that line are the same.
                    puts("Start and end stations are the same");
                    puts(numberOfStops.to_s+" stops in total.""\n"); #Number of stops will be 0.        
                    return
    
                else #start and end stations are different.
                    puts "\nYou must travel through the following stops on the #{start_line} line:"
                    for station in startSubwayLineList.list_of_stations #loop through all stations on that line.
                        print station.name #print each station.
                        if (!(station.name==end_station)) #as long as the end station on that line hasn't been reached yet:
                            print ", " #add commas between station names.
                    
                        else #if the station in the current itration is the end station.
                        print "."
                        numberOfStops=startSubwayLineList.get_station_index(start_station)-startSubwayLineList.get_station_index(end_station) #calculate the number of stops by getting the difference between the indices of the start and end stations on that line.
                        puts  "\n" +numberOfStops.to_s+" stops in total." #print the total number of stops.
                        return
                        end #of inner if .. else (for printing stations)
                    end #of for loop.
                end #of if startstation==end station
    
            else #start subway line != end subway line.
            puts "\nYou must travel through the following stops on the #{start_line} line:"
                for station in startSubwayLineList.list_of_stations
                #same as before, keep printing station names and seperate them by commas except when we reach "Park Street".
                    if (!(station.name==$intersection))
                      print station.name+", "
            
                    else
                      print "and "+$intersection+"."
                      break
                      end #of inner if (printing stations)
                  end #of for loop.
    
            puts "\nChange at "+$intersection
            puts "Your trip continues through the following stops on #{end_line} Line:" 
        #loop through the stations of the end subway line list starting from the index of the intersection until the end station.
        if (endSubwayLineList.already_passed_the_destination($intersection,end_station))
            puts "Inside if"
            endSubwayLineList.list_of_stations=endSubwayLineList.get_reversed_list
        end
        endSubwayLineList.list_of_stations[(endSubwayLineList.get_station_index($intersection)+1)..-1].each {|endLineStation|
            if(endLineStation.name==end_station)
              print "and "+endLineStation.name+"."
            else
            print endLineStation.name+", "
            end #of if statement.
          }
            #calculate and print the total number of stops.
            #First we need to calculate the difference between the index of the start station and the intersection on the start line.
            numberOfStops=(startSubwayLineList.get_station_index(start_station)-startSubwayLineList.get_station_index($intersection)).abs()
            #Then we need to calculate the difference between the index of the intersection and the end station on the end line.
            #And finally, sum the two values calculated earlier to get the total number of stops from the start station on the start line to the end station on the en line.
            numberOfStops+=(endSubwayLineList.get_station_index(end_station)-endSubwayLineList.get_station_index($intersection)).abs
            puts  "\n" +numberOfStops.to_s+" stops in total."
             
          end 
        end #of outer else
    end #of stops_between_stations method
  end #of class Subway
    
  # One line, all the stations on that line
  class Line 
    attr_accessor :list_of_stations
    attr_accessor :name

    def initialize (line_name)
        @name=line_name     
    end
        
    # create_stations_list method generates an array of 'Station' instances (from an array of strings) in order to assign it to its respective subway 'Line' afterwards.
    def create_stations_list (array)
        stations_list=[] #Create an empty array to use it in storing references to station objects.
        array.map{|station_name| #for each string in the array:
        current_station=Station.new(station_name) #Create a new instance of 'Station' with that string as its name.
        stations_list.push(current_station) #Push the Station to the array created earlier.
        }
        self.list_of_stations=stations_list #Set the newly created array of stations to the current line.
    end

    # a method to be used to return the index of a station in the line's array of stations.
    def get_station_index(station_name) #The method takes the station name that we're trying to find its index as a parameter.
        for station in list_of_stations #loop through each station in the array
            if station.name==station_name #check if the name of the current station matches the input name
                return list_of_stations.index(station) #if so, return the index of that station.
            end
        end
        
    end

    def already_passed_the_destination(intersection,destination)
        if (get_station_index(intersection)>get_station_index(destination))
            return true
        end

    end

    def get_reversed_list
        temp_list=list_of_stations.reverse
        return temp_list;
    end

    #validate_station method checks if the station name entered (either start or end) is an actual station name.
    def validate_station(station_name)
        for station in list_of_stations
            if (station.name.downcase==station_name.downcase) #compare each station name with the input name (converted to downcase to ignore the case sensitivity)
                return true
            end
        end
        return false
    end
       
  end
  
  # One station
  class Station
    attr_reader :name
    def initialize(name)
    @name=name
    end

  end

  mbta = Subway.new #Create a new instance of 'Subway' name 'mbta'

  #Next, define 3 arrays of strings that has station names of each subway line
  red_line_stations=["South Station", "Kendall","Central","Harvard","Park Street", "Porter", "Davis", "Alewife"]
  green_line_stations=["Government Center", "Boylston", "Arlington", "Park Street","Copley", "Hynes", "Kenmore"]
  orange_line_stations=["North Station", "Haymarket",  "State", "Downtown Crossing", "Chinatown", "Park Street", "Back Bay", "Forest Hills"]

  #Create new objects to represent the three subway lines.
  red_line=Line.new('red')
  green_line=Line.new('green')
  orange_line=Line.new('orange')

  #Call create_stations_list using each of its respective line object to convert strings into 'Station' objects.
  red_line.create_stations_list(red_line_stations)
  green_line.create_stations_list(green_line_stations)
  orange_line.create_stations_list(orange_line_stations)

  mbta.add_subway_lines(red_line,green_line,orange_line) #add the three lines to subway_line_list of the mbta Subway object.

   mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street') # 3 stops
   mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
   mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops
   

   