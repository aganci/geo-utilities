class City
  def initialize(city_name, country, altitude)
    @city_name = city_name
    @country = country
    @altitude = altitude
  end

  def ==(o)
    o.class == self.class && o.state == state
  end

  protected

  def state
    [@city_name, @country, @altitude]
  end  
end