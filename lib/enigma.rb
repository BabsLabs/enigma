class Enigma

  def initialize
  end

  def encrypt(message, key = RandomNumberGenerator.generate_random_key, date = Date.generate_todays_date)
    encryption_hash = Hash.new
    encryption_hash[:encryption]  = message # Needs changed to encrypted message
    encryption_hash[:key] = key
    encryption_hash[:date] = date
    encryption_hash
  end

end
