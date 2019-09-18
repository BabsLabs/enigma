require_relative 'encryptionable'
require_relative 'decryptionable'
require_relative 'crack'

class Enigma < Crack
  include Encryptionable
  include Decryptionable

  def encrypt(message, key = RandomNumberGenerator.generate_random_key, date = Date.generate_todays_date)
    encryption_helper(message, key, date)
  end

  def decrypt(cyphertext, key, date = Date.generate_todays_date)
    decryption_helper(cyphertext, key, date)
  end

  def crack(cyphertext, date = Date.generate_todays_date)
    crack_helper(cyphertext, date)
  end

end
