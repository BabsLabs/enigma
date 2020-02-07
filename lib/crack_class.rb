require_relative 'decryptionable'
require './lib/date'

class Crack
  include Decryptionable

  def crack_helper(cyphertext, date)
    crack_hash = Hash.new
    cyphertext_copy = cyphertext
    until cyphertext_copy[-4..-1] == " end"
      crack_hash = decryption_helper(cyphertext, key = RandomNumberGenerator.generate_random_key, date)
      cyphertext_copy = crack_hash[:decryption]
      p "Cracking: CypherText: #{cyphertext_copy}, Key: #{key}, Date: #{date}" # uncomment this line to watch the crack in progress!!!
    end
    crack_hash
  end

end