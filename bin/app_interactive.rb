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


print  "Enter starting line: "
sline = gets.chomp
print  "Enter starting station: "
sstation = gets.chomp

print  "Enter ending line: "
eline = gets.chomp
print  "Enter ending station: "
estation = gets.chomp


num_of_stops = mbta.calculate_stops(sstation, sline, estation, eline)
puts "number of stops from #{sstation} to #{estation} is #{num_of_stops}"
