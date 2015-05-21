# A Subway system with multiple lines.
# Can be used for most city subway systems, MBTA in Boston, MTA in NYC, ...
class SubwaySystem
  attr_reader :name, :city

  def initialize(name, city)
    @name = name
    @city = city
    @lines = []
  end

  def find_line_by_name(name)
    @lines.select { |line| line.name == name }[0]
  end

  def add_line(line)
    @lines << line
  end

  def create_line(line_name, station_names)
    line = Line.new(line_name)
    station_names.each do |sname|
      station = Station.new(sname)
      line.add_station(station)
    end
    add_line(line)
  end

  # Calculate the number of stops given a
  # starting line and station and an ending line and station.
  def calculate_stops(sstation, sline, estation, eline)
    if (sline == eline)
      # same line for start and stop
      eline.calculate_stops(estation, sstation)
    else
      (sline.stops_from_park(sstation) - eline.stops_from_park(estation)).abs
    end
  end
end
