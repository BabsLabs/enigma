require_relative 'encryptionable'
require_relative 'decryptionable'

class Enigma
  include Encryptionable
  include Decryptionable

  def encrypt(message, key = RandomNumberGenerator.generate_random_key, date = Date.generate_todays_date)
    encryption_helper(message, key, date)
  end

end
