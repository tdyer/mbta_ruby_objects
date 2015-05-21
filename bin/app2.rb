require 'pry'

# This will allow you to access code in these files.

# paste the contents of the lib/station.rb file into this file
require_relative '../lib/station'
# paste the contents of the lib/line.rb file into this file
require_relative '../lib/line'
# paste the contents of the lib/subway_system file into this file
require_relative '../lib/subway_system'

mbta = SubwaySystem.new('mbta', 'boston')

# Create the Red line
rline = Line.new('red')

# Add stations to the Red Line
['south station', 'park', 'kendall', 'central', 'harvard', 'porter', 'davis', 'alewife'].each do |sname|
  station = Station.new(sname)
  rline.add_station(station)
end

# Create the Green line
gline = Line.new('green')

# Add stations to the Green Line
['haymarket', 'government center', 'park', 'bolyston', 'arlington', 'copley'].each |sname|
  station = Station.new(sname)
  gline.add_station(station)
end

# Create the Orange line
oline = Line.new('orange')

# Add stations to the Green Line
['north station', 'haymarket', 'park st', 'state', 'downtown crossing', 'chinatown', 'back bay', 'forest hills'].each do |sname|
  station = Station.new(sname)
  gline.add_station(station)
end


# Create a station for haymarket
hay_station= Station.new('haymarket')
# Add it to green line

# Create a station for gov center
gov_station= Station.new('government center')
gline.add_station(gov_station)

park_station= Station.new('park');
gline.add_station(park_station)

boy_station= Station.new('boyleston')
gline.add_station(boy_station)

arl_station= Station.new('arlington')
gline.add_station(arl_station)

# Hard code some stations on the same line, JUST FOR TESTING.
puts "going from haymarket to bolyston"

# define a variable, start_station, it's value will be the haymarket station
start_station = hay_station
# define a variable, gline, it's value will be the the green line
start_line = gline

# define a variable, end_station, it's value will be the haymarket station
end_station = boy_station
# define a variable, end line, it's value will be the green line
end_line = gline

#
binding.pry
num_of_stops = mbta.calculate_stops(start_station, start_line, end_station, end_line)

puts "number of stops is #{num_of_stops}"
