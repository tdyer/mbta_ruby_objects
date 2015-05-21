require 'pry'
require_relative '../lib/station'
require_relative '../lib/line'
require_relative '../lib/subway_system'

####### Setup #############

# Create the SubwaySystem for the 'T'
mbta = SubwaySystem.new('mbta', 'boston')

# Create the Red line
mbta.create_line('red',
                 ['south station', 'park', 'kendall', 'central', 'harvard', 'porter', 'davis', 'alewife'])

# Create the Green line
mbta.create_line('green',
                 ['haymarket', 'government center', 'park', 'bolyston', 'arlington', 'copley'])

# Create the Orange line
mbta.create_line('orange',
                 ['north station', 'haymarket', 'park', 'state', 'downtown crossing', 'chinatown', 'back bay', 'forest hills'])

####### Test 1 #############
# Green Line, haymarket to bolyston, easy on the same line
start_line = mbta.find_line_by_name('green')
end_line = mbta.find_line_by_name('green')

start_station= start_line.find_station_by_name('haymarket')
end_station= end_line.find_station_by_name('bolyston')

num_of_stops = mbta.calculate_stops(start_station, start_line, end_station, end_line)
puts "number of stops from haymarket to bolyston is #{num_of_stops}"

####### Test 2 #############
# Green Line, bolyston to haymarket, easy on the same line
start_station= start_line.find_station_by_name('bolyston')
end_station= end_line.find_station_by_name('haymarket')

num_of_stops = mbta.calculate_stops(start_station, start_line, end_station, end_line)
puts "number of stops from bolyston to haymarket is #{num_of_stops}"

####### Test 3 #############
# Green Line and Red Line
# haymarket to alewife
end_line = mbta.find_line_by_name('red')

start_station= start_line.find_station_by_name('haymarket')
end_station= end_line.find_station_by_name('alewife')

num_of_stops = mbta.calculate_stops(start_station, start_line, end_station, end_line)
puts "number of stops from haymarket to alewife is #{num_of_stops}"

####### Test 4 #############
# alewife to haymarket
start_line = mbta.find_line_by_name('red')
end_line = mbta.find_line_by_name('green')
start_station= start_line.find_station_by_name('alewife')
end_station= end_line.find_station_by_name('haymarket')

num_of_stops = mbta.calculate_stops(start_station, start_line, end_station, end_line)
puts "number of stops from alewife to haymarket is #{num_of_stops}"
