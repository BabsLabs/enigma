require './test/test_helper'
require './lib/enigma'
require './lib/encryptionable'
require './lib/decryptionable'
require './lib/date'
require './lib/random_number_generator'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_can_make_encryption_hash

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

    expected_2 = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected_2, @enigma.encrypt("hello world!", "02715", "040895")

    expected_3 = {
      encryption: "hello world",
      key: "00000",
      date: "00000"
    }
    assert_equal expected_3, @enigma.encrypt("hello world", "00000", "00000")

    expected_4 = {
      encryption: "!!hello world!!",
      key: "00000",
      date: "00000"
    }
    assert_equal expected_4, @enigma.encrypt("!!hello world!!", "00000", "00000")

    expected_5 = {
      encryption: "@!$%keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected_5, @enigma.encrypt("@!$%hello world!", "02715", "040895")

    expected_6 = {
      encryption: "@!$%leder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected_6, @enigma.encrypt("@!$%iello world!", "02715", "040895")

    expected_7 = {
      encryption: "!fxvvwuh:)!",
      key: "80111",
      date: "210484"
    }
    assert_equal expected_7, @enigma.encrypt("!Chester:)!", "80111", "210484")
  end

  def test_can_make_decryption_hash
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")

    expected_2 = {decryption: "hello world!",
                key: "02715",
                date: "040895"
                }
    assert_equal expected_2, @enigma.decrypt("keder ohulw!", "02715", "040895")

    expected_3 = {decryption: "!@$^hello world!",
                key: "02715",
                date: "040895"
                }
    assert_equal expected_3, @enigma.decrypt("!@$^keder ohulw!", "02715", "040895")

    expected_4 = {
      decryption: "!chester:)!",
      key: "80111",
      date: "210484"
    }
    assert_equal expected_4, @enigma.decrypt("!fxvvwuh:)!", "80111", "210484")
  end

  def test_can_encrypt_with_default_params
    expected = {:encryption=>"njhauesdxq !!!",
                :key=>"02715",
                :date=>"140919"}

    assert_equal expected, @enigma.encrypt("hello world!!!", "02715")

    # RandomNumberGenerator.stub(:generate_random_key).returns("33351")
    # rand_key = RandomNumberGenerator.generate_random_key
    # rand_key.stub(:generate_random_key, "33351")
    # expected_2 = {:encryption=>"rpzjykjmawr", :key=>"33351", :date=>"140919"}
    #
    # assert_equal expected_2, @enigma.encrypt("hello world")

    # test below needs filled out
    # assert_equal ({enigma.encrypt("hello world")
  end

  # def test_can_decrypt_with_default_params
  #   assert_equal ({}), @enigma.decrypt(encrypted[:encryption], "02715")
  # end

end
