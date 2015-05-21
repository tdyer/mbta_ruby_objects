# A Subway system with multiple lines.
# Can be used for most city subway systems, MBTA in Boston, MTA in NYC, ...
class SubwaySystem
  attr_reader :name, :city

  def initialize(name, city)
    @name = name
    @city = city
    @lines = []
  end

  # Given a line name and an array of stations names
  # Create a Line instance and add stations this line.
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
  def calculate_stops(sstation_name, sline_name, estation_name, eline_name)
    # get starting line
    sline = find_line_by_name(sline_name)
    # get starting station
    sstation = sline.find_station_by_name(sstation_name)
    # get ending line
    eline = find_line_by_name(eline_name)
    # get ending station
    estation = eline.find_station_by_name(estation_name)

    if (sline == eline)
      # same line for start and stop stations
      eline.calculate_stops(estation, sstation)
    else
      # different lines for start and stop stations
      (sline.stops_from_park(sstation) - eline.stops_from_park(estation)).abs
    end
  end

  private

  def find_line_by_name(name)
    @lines.select { |line| line.name == name }[0]
  end

  def add_line(line)
    @lines << line
  end
end
