require './lib/encryptionable'

class Enigma
  include Encryptionable

  def encrypt(message, key = RandomNumberGenerator.generate_random_key, date = Date.generate_todays_date)
    encryption_helper(message, key, date)
  end

end
