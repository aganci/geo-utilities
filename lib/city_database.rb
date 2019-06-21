require 'csv'
require_relative './city'

class CityDatabase
  
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def foreach_city(processor)
    CSV.foreach(@csv_path, col_sep: ";") do |row|
      processor.process(City.new(row[2], row[1], row[5].to_f))
    end
  end
end