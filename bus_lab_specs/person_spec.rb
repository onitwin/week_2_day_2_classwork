require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../person')

class PersonTest < Minitest::Test

  def setup
    @person=Person.new("Joseph",38)
  end

  def test_for_name
    assert_equal("Joseph", @person.name)
  end

  def test_for_age
    assert_equal(38,@person.age)
  end


















end
