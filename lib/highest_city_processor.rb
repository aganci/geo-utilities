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
    @city_map.values.sort_by { |c| -c.altitude }.each do |city|
      args.each { |io| io.puts city.format_description }
    end
  end
end