class Subway
	def stops_between_stations(start_line, start_station, end_line, end_station)
		s = SubwayLines.new
		lines = s.getLines 		#get all lines with stations
		stops = lines[start_line]		#get all stations for start line
		start_station_index = stops.find_index(start_station) 		#get index for start_station
		common_station_index = stops.find_index(s.getCommonStation)		#get index for intersected station for all subway lines
		start_diff = start_station_index - common_station_index		#finding the index difference for start_station and intersected station,this will be
																	#the total number of stops for the start line
		print 'You must travel through the following stops on the ', start_line,' Line:'
		puts ''
		if start_station_index <= common_station_index	#if start_station_index is at 2 and common_station_index is 4, the range will be (2 to 4).
			stop_names = get_stop_names(stops,start_station_index, common_station_index) 	#get stop names
		else
			stop_names = get_stop_names(stops, common_station_index, start_station_index).reverse()
		end
		print stop_names
		puts''
		print 'Change at ', s.getCommonStation,'.'
		puts''
		stops = lines[end_line]		#get all stations for end_station
		end_station_index = stops.find_index(end_station)		#get end station index
		common_station_index = stops.find_index(s.getCommonStation) #get common station index
		end_diff = end_station_index - common_station_index 	#the total number of stops for the end line
		if end_station_index <= common_station_index
			stop_names = get_stop_names(stops,end_station_index, common_station_index).reverse()
		else
			stop_names = get_stop_names(stops, common_station_index, end_station_index)
		end
		print 'Your trip continues through the following stops on the ', end_line, ' Line:'
		puts ''
		print stop_names
		puts ''
		print start_diff.abs() + end_diff.abs() , ' Stops in total'    #adding both lines stops count to get total number of stops
	end
	
	#get the stop names array with a range of start and stop index
	def get_stop_names(stops, start, ends)
		stop_names = []
		#iterating stops array and collecting stop names 
		while(start <= ends)
			stop_names.push(stops[start])
			start=start+1
		end
		return stop_names
	end
	
end

class SubwayLines
	#initializing the Subway line details with their stops 
	def initialize()
		@lines = Hash[
				'Red' => ['South Station', 'Kendall', 'Central','Harvard', 'Park Street', 'Porter', 'Davis', 'Alewife'],
				'Green' => ['Government Center','Boylston', 'Arlington', 'Park Street', 'Copley', 'Hynes', 'Kenmore'],
				'Orange' => ['North Station', 'Haymarket', 'State', 'Downtown Crossing', 'Chinatown', 'Park Street', 'Back Bay','Forest Hills']
		]
		@common_station = 'Park Street'
	end
	
	#Common intersected stop for all the three lines
	def getCommonStation
		@common_station
	end
	
	#get the lines hash object
	def getLines
		@lines
	end
end

#Taking user inputs for the start and end stops
puts 'Please enter start line'
start_line=gets.chomp
puts 'Please enter start station'
start_station=gets.chomp
puts 'Please enter end line'
end_line=gets.chomp
puts 'Please enter end station'
end_station=gets.chomp

s=Subway.new
#calling the method to get no of stops and their names
s.stops_between_stations(start_line, start_station, end_line, end_station)