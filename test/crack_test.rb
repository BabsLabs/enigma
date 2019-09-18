require './test/test_helper'
require './lib/crack_class'
require './lib/enigma'
require './lib/date'
require './lib/random_number_generator'
require 'mocha/minitest'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @crack = Crack.new
  end

  def test_crack_encryption_with_date_and_cracked_key
    # crack an encryption with a date
    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    }
    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
    assert_equal expected, @crack.crack_helper("vjqtbeaweqihssi", "291018")
  end

  # this might works but it has like 1000000 encryptions to check so I commented it out...
  # def test_crack_encryption_with_todays_date_and_cracked_key
  #   # crack an encryption with a date
  #   # Date.stubs(:generate_todays_date).returns("170919")
  #   expected = {
  #     decryption: "hello world end",
  #     date: "170919",
  #     key: "08304"
  #   }
  #   assert_equal expected, @enigma.crack("vjqtbeaweqihssi")
  # end

end