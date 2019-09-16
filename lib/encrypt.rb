require_relative 'enigma'
require_relative 'date'
require_relative 'random_number_generator'

# open the first command line arg
handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

message = incoming_text

writer = File.open(ARGV[1], "w")

enigma = Enigma.new

encrypted_hash = enigma.encrypt(message, key = RandomNumberGenerator.generate_random_key, date = Date.generate_todays_date)

writer.write(encrypted_hash[:encryption])

puts "Created #{ARGV[1]} with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"

writer.close

