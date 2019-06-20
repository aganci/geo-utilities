require 'csv'

namespace :geo_utilities do

  desc "read a csv file and output the highest city for each country"
  task :find_highest_cities, [:filename] => :environment do |t, args|
  end
end
