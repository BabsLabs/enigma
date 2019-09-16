require './test/test_helper'
require './lib/alphabet'

class AlphabetTest < Minitest::Test

  def setup
    @alphabet = ("a".."z").to_a << " "
  end

  def test_can_generate_alphabet
    assert_equal @alphabet, Alphabet.alphabet_generator
  end
end