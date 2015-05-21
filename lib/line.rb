class Line
  attr_reader :name

  def initialize(name)
    @name = name
    @stations = []
  end

  def add_station(station)
    @stations << station
    if (station.name == 'park')
      @park_station_index = @stations.length
    end
  end

  def find_station_by_name(name)
    @stations.select{ |station| station.name == name}[0]
  end

  def stops_from_park(station)
    stop_num = 999
    @stations.each_index do |i|
      stop_num = i if station.name == @stations[i].name
    end
    stop_num - @park_station_index
  end

  def calculate_stops(end_station, start_station)
    (stops_from_park(end_station) - stops_from_park(start_station)).abs
  end
end
