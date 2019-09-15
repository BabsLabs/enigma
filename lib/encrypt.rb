handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = incoming_text

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text)

writer.close
