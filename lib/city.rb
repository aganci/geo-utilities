class City
  attr_reader :name, :country, :altitude

  def initialize(city_name, country, altitude)
    @name = city_name
    @country = country
    @altitude = altitude
  end

  def format_description
    "#{altitude.round}m - #{name}, #{country}"
  end

  def higher_than(city)
    altitude > city.altitude
  end

  def ==(o)
    o.class == self.class && o.state == state
  end

  protected

  def state
    [name, country, altitude]
  end  
end