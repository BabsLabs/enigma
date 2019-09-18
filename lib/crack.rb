require_relative 'enigma'
require_relative 'date'
require_relative 'crack'
require_relative 'random_number_generator'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

message = incoming_text

writer = File.open(ARGV[1], "w")

enigma = Enigma.new

decrypted_hash = enigma.crack(message, ARGV[2])

writer.write(decrypted_hash[:decryption])

puts "Created #{ARGV[1]} with the cracked key #{decrypted_hash[:key]} and date #{decrypted_hash[:date]}"

writer.close
