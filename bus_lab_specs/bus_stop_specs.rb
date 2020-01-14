require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus_lab')
require_relative('../person')
require_relative('../bus_stop.rb')


class BusStopTest < MiniTest::Test

  def setup
    @passenger=Person.new("Joseph",38)
    @bus=Bus.new(45,"Greenock")
    @stop=BusStop.new("Port Glasgow")
  end



  def test_for_bus_stop_name
    assert_equal("Port Glasgow",@stop.name)
  end

  def test_for_queue_length_empty
    assert_equal(0,@stop.queue.length)
  end

  def test_for_queue_length_plus_1
    @stop.add_passengers_to_queue(@passenger)
    assert_equal(1,@stop.queue.length)
  end

  def test_for_passing_queue_to_bus
    @stop.add_passengers_to_queue(@passenger)
    @stop.add_passengers_to_queue(@passenger)
    @stop.add_passengers_to_queue(@passenger)
    @stop.add_passengers_to_queue(@passenger)
    assert_equal(4,@stop.queue.length)
    @stop.queue_to_bus(@bus)
    assert_equal(0,@stop.queue.length)
  end














end
