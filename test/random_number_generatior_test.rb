require './test/test_helper'
require './lib/random_number_generator'

class RandomNumberGeneratorTest < Minitest::Test

  def test_can_generate_random_key
    assert_equal 5, RandomNumberGenerator.generate_random_key.length
    assert_equal String, RandomNumberGenerator.generate_random_key.class
  end

end
