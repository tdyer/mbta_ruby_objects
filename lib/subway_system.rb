class SubwaySystem
  attr_reader :name, :city

  # two argument/parameters for name and city
  def initialize(name, city)
    @name = name
    @city = city
    @lines = []
  end

  def find_line_by_name(name)
    @lines.select{ |line| line.name == name}[0]
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
    self.add_line(line)
  end

  def calculate_stops(sstation, sline, estation, eline)
    # Logic to calculate number of stops

    if(sline == eline)
      # same line for start and stop
      # absolute(end station index - start station index)
      number_of_stops = eline.calculate_stops(estation, sstation)
    else
      number_of_stops = (sline.stops_from_park(sstation) - eline.stops_from_park(estation)).abs
      # raise "hey we haven't calculated number of stops between lines yet!!!!"
    end
  end

end
