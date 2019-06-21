require 'spec_helper'
require_relative '../lib/highest_city_processor'

RSpec.describe "highest city processor" do
  let(:processor) { HighestCityProcessor.new }
  let(:string_io) { StringIO.new }

  it "should output city altitude" do
    processor.process(City.new("Rome", "Italy", 14.0))

    processor.output(string_io)

    expect(string_io.string).to eq("14m - Rome, Italy\n")
  end
  
  it "should output highest city for a country" do
    processor.process(City.new("Milano", "Italy", 108.0))
    processor.process(City.new("Rome", "Italy", 14.0))

    processor.output(string_io)

    expect(string_io.string).to eq("108m - Milano, Italy\n")
  end

  it "should output highest city for each country in descent order" do
    processor.process(City.new("Milano", "Italy", 108.0))
    processor.process(City.new("Rome", "Italy", 14.0))
    processor.process(City.new("Kabul", "Afghanistan", 1808.0))
    processor.process(City.new("Kandahar", "Afghanistan", 1015.0))

    processor.output(string_io)

    expect(string_io.string).to eq("1808m - Kabul, Afghanistan\n108m - Milano, Italy\n")
  end
end