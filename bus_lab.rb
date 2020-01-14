class Bus

  attr_reader :route, :destination ,:passengers #works but sould not be present for security




# created new class to use for future derived objects
  def initialize(route_number,destination)

    @route=route_number
    @destination=destination
    @passengers=[]

  end


  def drive()
    return "Brum Brum"
  end


  def pick_up(passenger)
    @passengers.push(passenger)
  end


  def drop_off(passenger)
    @passengers.delete(passenger)
  end


  def empty
    @passengers=[]
  end

  def queue_to_bus(stop)
    @passengers.concat(stop.queue)
    stop.queue.clear
  end







end
