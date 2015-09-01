class Van

DEFAULT_CAPACITY = 15


  def initialize options = {}
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)  
  end 

  def bike_count
    @bikes.count
  end 

  def load bike
    raise 'Van is full' if full?
  @bikes << bike
  end

  def unload bike
    @bikes.delete bike 
  end 

  def full?
    bike_count == @capacity
  end 

  def accepted_bikes
    @bikes.reject { |bike| !bike.broken?}
  end

  def fixed_bikes
    @bikes.select { |bike| bike.fix}
  end

end