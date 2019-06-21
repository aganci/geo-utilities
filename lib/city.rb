class City
  attr_reader :altitude

  def initialize(city_name, country, altitude)
    @city_name = city_name
    @country = country
    @altitude = altitude
  end

  def format_description
    "#{altitude.round}m - #{@city_name}, #{@country}"
  end

  def higher_than(city)
    altitude > city.altitude
  end

  def ==(o)
    o.class == self.class && o.state == state
  end

  protected

  def state
    [@city_name, @country, altitude]
  end  
end