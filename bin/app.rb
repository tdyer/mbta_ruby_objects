require 'pry'
require_relative '../lib/station'
require_relative '../lib/line'
require_relative '../lib/subway_system'

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
['haymarket', 'government center', 'park', 'bolyston', 'arlington', 'copley'].each do |sname|
  station = Station.new(sname)
  gline.add_station(station)
end

# Create the Orange line
oline = Line.new('orange')

# Add stations to the Green Line
['north station', 'haymarket', 'park', 'state', 'downtown crossing', 'chinatown', 'back bay', 'forest hills'].each do |sname|
  station = Station.new(sname)
  oline.add_station(station)
end

mbta = SubwaySystem.new('mbta', 'boston')
mbta.add_line(rline)
mbta.add_line(gline)
mbta.add_line(oline)

# haymarket to bolyston, easy on the same line
start_station= gline.find_station_by_name('haymarket')
end_station= gline.find_station_by_name('bolyston')

num_of_stops = mbta.calculate_stops(start_station, gline, end_station, gline)
puts "number of stops from haymarket to bolyston is #{num_of_stops}"

# bolyston to haymarket, easy on the same line
start_station= gline.find_station_by_name('bolyston')
end_station= gline.find_station_by_name('haymarket')

num_of_stops = mbta.calculate_stops(start_station, gline, end_station, gline)
puts "number of stops from bolyston to haymarket is #{num_of_stops}"

# haymarket to alewife
start_station= gline.find_station_by_name('haymarket')
end_station= rline.find_station_by_name('alewife')
num_of_stops = mbta.calculate_stops(start_station, gline, end_station, rline)
puts "number of stops from haymarket to alewife is #{num_of_stops}"

# alewife to haymarket
start_station= rline.find_station_by_name('alewife')
end_station= gline.find_station_by_name('haymarket')
num_of_stops = mbta.calculate_stops(start_station, rline, end_station, gline)
puts "number of stops from alewife to haymarket is #{num_of_stops}"
