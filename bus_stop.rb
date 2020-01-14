class BusStop

  attr_reader :name, :queue
  attr_writer :queue

  def initialize(name)
    @name=name
    @queue=[]
  end


  def add_passengers_to_queue(traveller)
    @queue.push(traveller)
  end





end
