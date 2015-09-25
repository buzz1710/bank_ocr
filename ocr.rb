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

      mappings[number_string] ? parsed_number << mappings[number_string] : parsed_number << "?"

    end
    output << parsed_number
    output << valid_number?(parsed_number)
    output << "\n"
  end

  puts output
end

def valid_number?(number)
  reversed = number.reverse
  result = 0
  if reversed.include?('?')
    return " ILL"
  elsif
    for i in 1..9
      result += reversed[i-1].to_i * i
    end
    if (result % 11 == 0)
      return ""
    else
      return " ERR"
    end
  end
end

parse_string
