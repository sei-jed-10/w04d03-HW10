
# your solution here

class Station
    attr_reader :name
    def initialize(name)
      @name = name
    end
end


class Line
    attr_reader :intersected_stop
    attr_reader :line
    def initialize(stops)
        @line = stops
        @intersected_stop = "Park Street"
    end

    def calc_distance(from, to)
        rawArrOfStops = @line.map { |stop| stop.name}
        indexFrom = rawArrOfStops.find_index(from)
        indexTo = rawArrOfStops.find_index(to)
        return (indexFrom - indexTo).abs
    end

    def display_stops(from, to, multi_lines=false)
        temp = @line

        rawArrOfStops = temp.map { |stop| stop.name}
        rawArrOfStops.reverse! if rawArrOfStops.find_index(from) > rawArrOfStops.find_index(to)

        indexFrom = rawArrOfStops.find_index(from)
        indexTo = rawArrOfStops.find_index(to)

        indexFrom = rawArrOfStops.find_index(from)+1 if multi_lines && from==@intersected_stop

        return rawArrOfStops.slice(indexFrom..indexTo)
    end
end

class Subway
    attr_reader :lines
    attr_reader :intersected_stop
    def initialize(lines)
      @lines = lines
      @intersected_stop = "Park Street"
    end

    def stops_between_stations(line1, from, line2, to)
        puts "You must travel through the following stops on the #{line1.capitalize} line:"
        if line1.downcase == line2.downcase
            puts @lines[line1.downcase].display_stops(from, to)
            puts @lines[line1.downcase].calc_distance(from, to).to_s + " stops in total."
        else
            puts @lines[line1.downcase].display_stops(from, @intersected_stop, true)
            puts "Change at #{@intersected_stop}."
            puts "Your trip continues through the following stops on the #{line2.capitalize} line:"
            puts @lines[line2.downcase].display_stops(@intersected_stop, to, true)
            distance = @lines[line1.downcase].calc_distance(from, @intersected_stop) + @lines[line2.downcase].calc_distance(@intersected_stop, to)
            puts distance.to_s + " stops in total."
        end
    end

    def add_line(line)
        @lines.merge! line
    end
end

redLine = ["South Station","Kendall","Central","Harvard","Park Street","Porter","Davis","Alewife"]

redLineObjs = redLine.map do |station|
    obj = Station.new(station)
end

greenLine = ["Government Center","Boylston","Arlington","Park Street","Copley","Hynes","Kenmore"]

greenLineObjs = greenLine.map do |station|
    obj = Station.new(station)
end

orangeLine = ["North Station","Haymarket","State","Downtown Crossing","Chinatown","Park Street","Back Bay","Forest Hills"]

orangeLineObjs = orangeLine.map do |station|
    obj = Station.new(station)
end


red = Line.new(redLineObjs)
green = Line.new(greenLineObjs)
orange = Line.new(orangeLineObjs)

subway = Subway.new({"red" => red})
subway.add_line({"green" => green})
subway.add_line({"orange" => orange})

puts subway.stops_between_stations('Red', 'Alewife', 'Red', 'Park Street')
puts subway.stops_between_stations('Red', 'Alewife', 'Orange', 'Downtown Crossing')
puts subway.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore')

print "Enter start line: "
startLine = gets.chomp.to_s.downcase
print "Enter start station: "
startStation = gets.chomp.to_s.capitalize
print "Enter end line: "
endLine = gets.chomp.to_s.downcase
print "Enter end station: "
endStation = gets.chomp.to_s.capitalize

puts subway.stops_between_stations(startLine, startStation, endLine, endStation)


