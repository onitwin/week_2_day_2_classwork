require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus_lab')
require_relative('../person')
require_relative('../bus_stop')


class BusLabTest < MiniTest::Test


  def setup
    @bus=Bus.new(22,"Ocean Terminal") #again Joseph, check the spaces
    @passenger=Person.new("Michelle",37)
    @busstop=BusStop.new('Port Glasgow')
  end

  def test_get_bus_route
    assert_equal(22,@bus.route)
  end

  def test_get_destination
    assert_equal("Ocean Terminal",@bus.destination)
  end

  def test_get_noise
    assert_equal("Brum Brum",@bus.drive)
  end

  def test_check_number_passengers_empty
    assert_equal(0,@bus.passengers.length)
  end

  def test_pick_up_passengers
    @bus.pick_up(@passenger)
    assert_equal(1,@bus.passengers.length)
  end

  def test_drop_off_passengers
    @bus.pick_up(@passenger)
    assert_equal(1,@bus.passengers.length)
    @bus.drop_off(@passenger)
    assert_equal(0,@bus.passengers.length)
  end

  def test_empty_bus
    @bus.pick_up(@passenger)
    @bus.pick_up(@passenger)
    @bus.pick_up(@passenger)
    assert_equal(3,@bus.passengers.length)
    @bus.empty
    assert_equal(0,@bus.passengers.length)
  end

  def test_pick_up_passengers_from_queue #imported add passengers function from bus stop file
    @busstop.add_passengers_to_queue(@passenger)
    @busstop.add_passengers_to_queue(@passenger)
    @busstop.add_passengers_to_queue(@passenger)
    @busstop.add_passengers_to_queue(@passenger)
    @busstop.add_passengers_to_queue(@passenger)
    @busstop.add_passengers_to_queue(@passenger)
    @busstop.add_passengers_to_queue(@passenger)
    assert_equal(7,@busstop.queue.length)#initial test showed 7 passengers at stop- so works this far
    @bus.queue_to_bus(@busstop)
    assert_equal(7,@bus.passengers.length)
    assert_equal(0,@busstop.queue.length)
  end

















end
