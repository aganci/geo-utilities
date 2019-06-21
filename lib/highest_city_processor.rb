class HighestCityProcessor
  
  def process(city)
    @city = city if @city.nil? || city.higher_than(@city)
  end

  def output(io)
    io.puts @city.format_description
  end
end