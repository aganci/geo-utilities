require 'spec_helper'
require_relative '../lib/highest_city_processor'

RSpec.describe "highest city processor" do
  it "should output city altitude" do
    processor = HighestCityProcessor.new
    processor.process(City.new("Rome", "Italy", 14.0))
    string_io = StringIO.new

    processor.output(string_io)

    expect(string_io.string).to eq("14m - Rome, Italy\n")
  end
  
  it "should output highest city for a country" do
    processor = HighestCityProcessor.new
    processor.process(City.new("Milano", "Italy", 108.0))
    processor.process(City.new("Rome", "Italy", 14.0))
    string_io = StringIO.new

    processor.output(string_io)

    expect(string_io.string).to eq("108m - Milano, Italy\n")
  end
end