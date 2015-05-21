require_relative './spec_helper'
require_relative '../lib/station'


describe Station do

  let(:name) { "alewife" }
  subject { Station.new(name) }

  it "#name" do
    expect(subject.name).to eq name
  end

end
