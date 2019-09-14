module Encryptionable

  def encryption_helper(message, key, date)
    #make a new hash to be returned at the end
    encryption_hash = Hash.new

    # key ABCD creation section
    key_a = key[0] + key[1]
    key_b = key[1] + key[2]
    key_c = key[2] + key[3]
    key_d = key[3] + key[4]

    # date ABCD creation section
    date_squared = date.to_i * date.to_i
    date_last_4 = date_squared.to_s.split(//).last(4).join("")

    date_a = date_last_4[0]
    date_b = date_last_4[1]
    date_c = date_last_4[2]
    date_d = date_last_4[3]


    # shift ABCD creation section
    shift_a = key_a.to_i + date_a.to_i
    shift_b = key_b.to_i + date_b.to_i
    shift_c = key_c.to_i + date_c.to_i
    shift_d = key_d.to_i + date_d.to_i

    shift_array = [shift_a, shift_b, shift_c, shift_d]

    # create our alphabet array to shift things by
    alphabet_array = ("a".."z").to_a << " "


    # now the actual shifting of the message

    # split up our message into individual chars
    downcase_split_message = message.downcase.split(//)

    # itearte through the characters
    encrypted_message = []
    downcase_split_message.each do |letter|
      #check if the character is included in the shift array
      if alphabet_array.include?(letter)
        #if so then it gets shifted by the an amount and the shift array rotates
        new_letter = alphabet_array.rotate(shift_array[0] + alphabet_array.index(letter))
        encrypted_message << new_letter[0]
      else
        encrypted_message << letter
      end
      shift_array.rotate!
    end

    encryption_hash[:encryption]  = encrypted_message.join
    encryption_hash[:key] = key
    encryption_hash[:date] = date
    
    encryption_hash
  end

end
