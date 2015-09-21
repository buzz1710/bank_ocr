def parse_string

  #read the input file and split into an array of account numbers
  input = IO.read("input.txt").gsub("\n","").scan(/.{108}/)
  valid = ""
  invalid = ""
  output = ""

  mappings = { "_| ||_|" => "0",
               "   |  |" => "1",
               "_ _||_ " => "2",
               "_ _| _|" => "3",
               " |_|  |" => "4",
               "_|_  _|" => "5",
               "_|_ |_|" => "6",
               "_  |  |" => "7",
               "_|_||_|" => "8",
               "_|_| _|" => "9"}

  input.each do |string|
    string.gsub!('\n', '')
    parsed_number = ""
    
    for i in [1,4,7,10,13,16,19,22,25]
      number_string = ""
      number_string << string[i]
      number_string << string[i+26..i+28]
      number_string << string[i+53..i+55]

      parsed_number << mappings[number_string]
    end

    if valid_number?(parsed_number)
      valid << "#{parsed_number} \n"
    else
      invalid << "#{parsed_number} \n"
    end
    output = "Valid:\n#{valid}\nInvalid:\n#{invalid}"
  end

  puts output
end

def valid_number?(number)
  reversed = number.reverse
  result = 0
  for i in 1..9
    result += reversed[i-1].to_i * i
  end
  if (result % 11 == 0)
    return true
  else
    return false
  end
end

parse_string
