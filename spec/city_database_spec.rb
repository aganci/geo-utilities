require 'spec_helper'
require_relative('../lib/city_database')
require_relative('../lib/city')

RSpec.describe "city database" do
  it "should load the file and call process for each city" do
    database = CityDatabase.new(file_fixture("test_cities.csv").realpath)
    processor = TestCityProcessor.new

    database.for_each_city(processor)

    expect(processor.cities).to eq(
      [City.new("Rome", "Italy", 14.0), City.new("Milano", "Italy", 108.0)])
  end
end

class TestCityProcessor
  attr_reader :cities

  def initialize
    @cities = []
  end

  def process(city)
    @cities << city
  end

end