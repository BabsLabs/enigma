require './test/test_helper'
require './lib/date'

class DateTest < Minitest::Test

  def test_can_generate_todays_date
    assert_equal 6, Date.generate_todays_date.length
    assert_equal String, Date.generate_todays_date.class
  end

end
