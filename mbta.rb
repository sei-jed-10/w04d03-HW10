class Line 
  attr_accessor :start_line
  attr_accessor :start_station
  attr_accessor :end_line
  attr_accessor :end_station

  $subwayLines = {
      "Red" => [
        'South Station',
        'Kendall',
        'Central',
        'Harvard',
        'Park Street',
        'Porter',
        'Davis',
        'Alewife'
      ],
      "Green" => [
        'Government Center',
        'Boylston',
        'Arlington',
        'Park Street',
        'Copley',
        'Hynes',
        'Kenmore'
      ],
    "Orange" => [
        'North Station',
        'Haymarket',
        'State',
        'Downtown Crossing',
        'Chinatown',
        'Park Street',
        'Back Bay',
        'Forest Hills'
      ]
    }

  def stops_between_stations(start_line, start_station, end_line, end_station)
    @start_line = start_line
    @start_station = start_station
    @end_line = end_line
    @end_station = end_station
  end

end #end Line class

class Subway 
  def stops_between_stations(start_line, start_station, end_line, end_station)
    startStationIndex = $subwayLines[start_line].index(start_station)
    endStationIndex = $subwayLines[end_line].index(end_station)

    if start_line === end_line
      return (startStationIndex - endStationIndex).abs
    end

    startLineParkStreetIndex = $subwayLines[start_line].index('Park Street')
    tripToParkStreet = (startStationIndex - startLineParkStreetIndex).abs

    endLineParkStreetIndex = $subwayLines[end_line].index('Park Street')
    tripToDestination = (endStationIndex - endLineParkStreetIndex).abs

    totalTrip = tripToParkStreet + tripToDestination
    return totalTrip
  end
end #end Subway class

class Station 
  # It has initialize for the name
  attr_reader :name
  def initialize(name)
    @name = name
  end
end #end Station class

mbta = Subway.new
# mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street') # 3 stops
# mbta.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing') # 5 stops
# mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 7 stops

############ Double Bonus ##############
  puts 'Enter start_line: '
  start_line = gets.chomp.to_s

  puts 'Enter start_station: '
  start_station = gets.chomp.to_s

  puts 'Enter end_line: '
  end_line = gets.chomp.to_s

  puts 'Enter end_station: '
  end_station = gets.chomp.to_s
 
mbta.stops_between_stations(start_line, start_station, end_line, end_station)
