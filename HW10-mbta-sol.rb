class Subway
	attr_accessor :start_line_park_street_index
	attr_accessor :end_line_park_street_index
	attr_accessor :trip_to_park_street
	attr_accessor :trip_from_park_street
	attr_accessor :num_stops
	attr_accessor :subway_lines


	def initialize(start_line, start_station, end_line, end_station)
		@subway_lines = 
		{
			red:["South Station","Kendall","Central","Harvard","Park Street","Porter","Davis","Alewife"],

			green:["Government Center","Boylston","Arlington","Park Street","Copley","Hynes","Kenmore"],

			orange:["North Station","Haymarket","State","Downtown Crossing","Chinatown","Park Street","Back Bay","Forest Hills"]
		}
		
		@start_line = start_line
		@start_station = subway_lines[start_line.to_sym].index(start_station)
		
		@end_line = end_line
		@end_station = subway_lines[end_line.to_sym].index(end_station)

		@start_line_park_street_index = subway_lines[start_line.to_sym].index('Park Street')
		@end_line_park_street_index = subway_lines[end_line.to_sym].index('Park Street')

	end
end

class Line < Subway
	def stops_between_stations
		if @start_line == @end_line
			p @num_stops = (@start_station - @end_station).abs
		
		elsif @start_line != @end_line
			@trip_to_park_street = (@start_station - @start_line_park_street_index).abs
			@trip_from_park_street = (@end_line_park_street_index - @end_station).abs

			p @num_stops = @trip_to_park_street + @trip_from_park_street

		end
				

	end
end

mbta1 = Line.new('red','Alewife','red','Park Street')
mbta1.stops_between_stations

mbta2 = Line.new('red','Alewife','orange','Downtown Crossing')
mbta2.stops_between_stations

mbta3 = Line.new('red','South Station','green','Kenmore')
mbta3.stops_between_stations



