class HighestCityProcessor
  def initialize
    @city_map = {}
  end

  def process(city)
    if @city_map.key?(city.country)
      @city_map[city.country] = city if city.higher_than(@city_map[city.country])
    else
      @city_map[city.country] = city
    end
  end

  def output(*args)
    cities_ordered_by_descending_altitude.each do |city|
      args.each { |io| io.puts city.format_description }
    end
  end

  private

    def cities_ordered_by_descending_altitude
      @city_map.values.sort_by { |c| -c.altitude }
    end
end