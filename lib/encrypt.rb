<<<<<<< HEAD
ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"
=======
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
>>>>>>> c4de50217eca71cfc1318907a332838e9d2030b6
