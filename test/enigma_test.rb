require './test/test_helper'
require './lib/enigma'
require './lib/date'
require './lib/crack'
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

  def test_can_encrypt_message_with_key_uses_todays_date
    # encrypt a message with a key (uses today's date)
    Date.stubs(:generate_todays_date).returns("140919")
    expected = {:encryption=>"njhauesdxq !!!",
                :key=>"02715",
                :date=>"140919"} # this date needs to always be changed to todays date... do I import my date.generate_todays_date into the test?

    assert_equal expected, @enigma.encrypt("hello world!!!", "02715")
  end

  def test_can_encrypt_with_random_key_todays_date
    # encrypt a message (generates random key and uses today's date)
    RandomNumberGenerator.stubs(:generate_random_key).returns("33351")
    Date.stubs(:generate_todays_date).returns("160919")

    expected = {:encryption=>"rpzjykjmawr", :key=>"33351", :date=>"160919"}
    assert_equal expected, @enigma.encrypt("hello world")
  end

  def test_can_decrypt_with_a_key_uses_todays_date
    #decrypt a message with a key (uses today's date)
    Date.stubs(:generate_todays_date).returns("120919")
    @encrypted = {:encryption => "hello world"}

    expected = {:decryption=>"b pwiv zlgh", :key=>"02715", :date=>"120919"}
    assert_equal expected, @enigma.decrypt(@encrypted[:encryption], "02715")
  end

end
