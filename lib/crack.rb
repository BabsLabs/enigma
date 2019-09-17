require_relative 'decryptionable'

class Crack
  include Decryptionable

  def crack_helper(cyphertext, date)
    crack_hash = Hash.new
    cyphertext_copy = cyphertext
    until cyphertext_copy[-4..-1] == " end"
      crack_hash = decryption_helper(cyphertext, RandomNumberGenerator.generate_random_key, date)
      cyphertext_copy = crack_hash[:decryption]
    end
    crack_hash
  end

end