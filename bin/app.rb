require 'pry'
require_relative '../lib/subway_system'

####### Setup #############

# Create the SubwaySystem for the 'T'
mbta = SubwaySystem.new('mbta', 'boston')

# Create the Red line
mbta.create_line('red',
                 ['south station', 'park', 'kendall', 'central', 'harvard',
                  'porter', 'davis', 'alewife'])

# Create the Green line
mbta.create_line('green',
                 ['haymarket', 'government center', 'park', 'bolyston',
                  'arlington', 'copley'])

# Create the Orange line
mbta.create_line('orange',
                 ['north station', 'haymarket', 'park', 'state',
                  'downtown crossing', 'chinatown', 'back bay', 'forest hills'])

####### Test 1 #############
# Green Line, haymarket to bolyston, easy on the same line
num_of_stops = mbta.calculate_stops('haymarket', 'green', 'bolyston', 'green')
puts "number of stops from haymarket to bolyston is #{num_of_stops}"

####### Test 2 #############
# Green Line, bolyston to haymarket, easy on the same line
num_of_stops = mbta.calculate_stops('bolyston', 'green', 'haymarket', 'green')
puts "number of stops from bolyston to haymarket is #{num_of_stops}"

####### Test 3 #############
# Green Line and Red Line
# haymarket to alewife

num_of_stops = mbta.calculate_stops('haymarket', 'green', 'alewife', 'red')
puts "number of stops from haymarket to alewife is #{num_of_stops}"

####### Test 4 #############
# alewife to haymarket

num_of_stops = mbta.calculate_stops('alewife', 'red', 'haymarket', 'green')
puts "number of stops from alewife to haymarket is #{num_of_stops}"
