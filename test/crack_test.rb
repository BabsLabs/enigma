require 'test_helper'
require './lib/crack'
require './lib/enigma'
require './lib/date'
require './lib/random_number_generator'
require 'mocha/minitest'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_crack_encryption_with_date_and_cracked_key
    # crack an encryption with a date
    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    }
    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  # def test_crack_encryption_with_todays_date_and_cracked_key
  #   # crack an encryption with a date
  #   expected = {
  #     decryption: "hello world end",
  #     date: "170919",
  #     key: "08304"
  #   }
  #   assert_equal expected, @enigma.crack("vjqtbeaweqihssi")
  # end

end