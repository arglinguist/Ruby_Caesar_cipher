#This is a simple interactive caeser cipher created as a project for The Odin Project's Ruby Programming course.
def caesar_cipher(message, offset)
  letter_codes = message.bytes #converts string to array of character codes
  shifted_codes = []
  letter_codes.map do |code|
    if code.between?(65,90) #uppercase letters
      code = letter_shift(code, offset, 90) 
    elsif code.between?(97,122) #lowercase letters
      code = letter_shift(code, offset, 122)
    else
      code = code #no shift for non-letter characters
    end
    shifted_codes << code
  end
  puts shifted_codes.pack('c*')  #prints the letter equivalent of new character codes    
end

def letter_shift(letter, shift, upper) #returns shifted code of original letter, wrapping if needed
  letter+= shift
    if letter>upper
      letter-=26 #wrap back to beginning
    end
  letter
end

puts "What string would you like to code?"
message = gets.chomp
offset = 26
until (offset.between?(0,25)) #forces user to select an appropriate amount by which to offset letters
  puts "By how much would you like to shift? (please select a number betwen 0 and 25)"
  offset = gets.to_i
end
caesar_cipher(message, offset)