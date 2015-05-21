require_relative './spec_helper'
require_relative '../lib/subway_system'

describe SubwaySystem do
  subject { SubwaySystem.new('mbta', 'boston') }

  it "#name" do
    expect(subject.name).to eq 'mbta'
  end

  it "#city" do
    expect(subject.city).to eq 'boston'
  end

  it "#create_line" do
    subject.create_line('red',
                     ['south station', 'park', 'kendall', 'central', 'harvard',
                      'porter', 'davis', 'alewife'])
   expect(subject.find_line_by_name('red')).to be_instance_of(Line)
  end

  it "#calculate_stops south station to alewife, easy" do
    subject.create_line('red',
                        ['south station', 'park', 'kendall', 'central', 'harvard',
                         'porter', 'davis', 'alewife'])
    expect(subject.calculate_stops('south station', 'red', 'alewife', 'red')).to eq 7
  end

  it "#calculate_stops alewife to south station, easy" do
    subject.create_line('red',
                        ['south station', 'park', 'kendall', 'central', 'harvard',
                         'porter', 'davis', 'alewife'])
    expect(subject.calculate_stops('alewife', 'red', 'south station', 'red')).to eq 7
  end


  it "#calculate_stops haymarket to alewife" do
    subject.create_line('red',
                        ['south station', 'park', 'kendall', 'central', 'harvard',
                         'porter', 'davis', 'alewife'])

    subject.create_line('green',
                 ['haymarket', 'government center', 'park', 'bolyston',
                  'arlington', 'copley'])

    expect(subject.calculate_stops('haymarket', 'green', 'alewife', 'red')).to eq 8
  end

  it "#calculate_stops alewife to haymarket" do
    subject.create_line('red',
                        ['south station', 'park', 'kendall', 'central', 'harvard',
                         'porter', 'davis', 'alewife'])

    subject.create_line('green',
                 ['haymarket', 'government center', 'park', 'bolyston',
                  'arlington', 'copley'])

    expect(subject.calculate_stops('alewife', 'red', 'haymarket', 'green')).to eq 8
  end
end
