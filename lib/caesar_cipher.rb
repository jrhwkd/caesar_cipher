# Caesar Cipher

def caesar_cipher(string, shift)
  alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  
  # create array of given string
  original_array = string.downcase.split("")
  
  # create arrays for shifted string
  shifted_array = Array.new
  shifted_ch_array = Array.new
  
  # convert string to character related numbers and shift
  original_array.each_with_index do |letter, i|
    if alphabet.include?(letter)
      alphabet.each_with_index do |ch, idx|
        shifted_array.push(idx + shift) if ch == letter
      end
    else 
      shifted_array.push(letter)
    end
  end

  # correct numbers greater than 25 (outside alphabet)
  shifted_array = shifted_array.map do |num|
    if num.is_a?(Integer)
      num > 25 && shift < 26 ? num = (25 % shift) : num = num
      num > 25 && shift > 26 ? num = (shift % 25) - 2 : num = num
    else
      num = num
    end
  end

  # convert shifted numbers to letters 
  shifted_array.each_with_index do |num, i|
    if num.is_a?(Integer)
      if string[i] == string[i].upcase #check for capitalization
        shifted_ch_array.push(alphabet[num].upcase)
      else
        shifted_ch_array.push(alphabet[num])
      end
    else
      shifted_ch_array.push(num)
    end
  end
  p shifted_ch_array.join #join and print
  end
  
  caesar_cipher("What a string!", 5)