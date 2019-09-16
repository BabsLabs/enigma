require './test/test_helper'
require './lib/enigma'
require './lib/alphabet'
require './lib/encryptionable'
require './lib/decryptionable'

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
  end

end
