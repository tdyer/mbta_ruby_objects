require_relative './spec_helper'
require_relative '../lib/line'


describe Line do
  # TODO: test a couple of different subway systems
  let(:name) { "red" }
  let(:alewife) { Station.new('alewife') };
  let(:davis) { Station.new('davis') };
  let(:porter) { Station.new('porter') };
  let(:harvard) { Station.new('harvard') };
  let(:kendall) { Station.new('kendall') };
  let(:mgh) { Station.new('mgh') };
  let(:park_station) { Station.new('park') };
  let(:downtown) { Station.new('downtown') };
  let(:sstation) { Station.new('south station') };

  subject do
    rline = Line.new(name)
    rline.add_station(alewife)
    rline.add_station(davis)
    rline.add_station(porter)
    rline.add_station(harvard)
    rline.add_station(kendall)
    rline.add_station(mgh)
    rline.add_station(park_station)
    rline.add_station(downtown)
    rline.add_station(sstation)
    rline
  end

  it "#name" do
    expect(subject.name).to eq name
  end

  it "#find_station_by_name" do
    expect(subject.find_station_by_name("downtown")).to eq downtown
    expect(subject.find_station_by_name("alewife")).to eq alewife
  end

  it "#stops_from_park alewife" do
    expect(subject.stops_from_park(alewife)).to eq 6
  end

  it "#stops_from_park south station" do
    expect(subject.stops_from_park(sstation)).to eq 2
  end

  it "#calculate_stops alewife to south station" do
    expect(subject.calculate_stops(sstation, alewife)).to eq 8
  end

  it "#calculate_stops south station to alewife" do
    expect(subject.calculate_stops(alewife, sstation)).to eq 8
  end

end
