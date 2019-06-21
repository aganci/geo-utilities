class HighestCityProcessor
  
  def process(city)
    @city = city
  end

  def output(io)
    io.puts @city.format_description
  end
end