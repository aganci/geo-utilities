require 'csv'
require_relative '../city_database'
require_relative '../highest_city_processor'

namespace :geo_utilities do

  desc "read a csv file and output the highest city for each country"
  task :find_highest_cities, [:filename] => :environment do |t, args|
    db = CityDatabase.new(args[:filename])
    processor = HighestCityProcessor.new
    db.for_each_city(processor)
    processor.output($stdout)
  end
end
