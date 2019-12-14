#parent class
class Subway

	attr_accessor :subway_lines

	def initialize()
  		@station = Station.new

  	end
  	#this method will call a method from Station class using the object
  def stops_between_stations(start_line, start_station, end_line, end_station)

  	@station.get_index(start_line, start_station, end_line, end_station)
 
end

end
  
# One line, all the stations on that line
class Line < Subway
	#initilizing each line with the stations
	def initialize()

	@subway_lines = {Red: ['South Station',
						'Kendall',
						'Central',
						'Harvard',
						'Park Street',
						'Porter',
						'Davis',
						'Alewife'],

				 Green: ['Government Center',
						'Boylston',
						'Arlington',
						'Park Street',
						'Copley',
						'Hynes',
						'Kenmore'],

				 Orange: ['North Station',
						'Haymarket',
						'State',
						'Downtown Crossing',
						'Chinatown',
						'Park Street',
						'Back Bay',
						'Forest Hills']}
	end

end

# One station
class Station < Line
	
	def get_index(start_line, start_station, end_line, end_station)

		  
		 $stops =0
   		 $total_stops=0

            indexof_start_station = subway_lines[start_line.to_sym].index(start_station)
            indexof_end_station = subway_lines[end_line.to_sym].index(end_station)

            if start_line == end_line#same line

                stops = (indexof_start_station-indexof_end_station).abs
                return "#{stops} stops"
                
            end

            if start_line != end_line#different lines

                indexof_parkStreet_start = subway_lines[start_line.to_sym].index("Park Street")
                indexof_parkStreet_end = subway_lines[end_line.to_sym].index("Park Street")

                park_street_start_line = (indexof_start_station - indexof_parkStreet_start).abs
                park_street_end_line = (indexof_end_station - indexof_parkStreet_end).abs

                total_stops = park_street_start_line + park_street_end_line

				return "#{total_stops} stops"

            end
	end

end



mbta = Subway.new
#mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street') # 3 stops
#mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
#mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops

####bonus####
p "Enter your statrt line"

user_input1 = gets.chomp

p "Enter your statrt station"

user_input2 = gets.chomp

p "Enter your end line"

user_input3 = gets.chomp

p "Enter your end station"

user_input4 = gets.chomp


mbta.stops_between_stations(user_input1, user_input2, user_input3, user_input4)



