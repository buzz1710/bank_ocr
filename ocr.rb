
buzz1710 [5:27 PM] 
```def parse_string

  #read the input file and split into an array of account numbers
  input = IO.read("input.txt").gsub("\n","").scan(/.{108}/m)
  parsed_numbers = ""

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
    for i in [1,4,7,10,13,16,19,22,25]
      number_string = ""
      number_string << string[i]
      number_string << string[i+26..i+28]
      number_string << string[i+53..i+55]

      parsed_numbers << mappings[number_string]
    end
    parsed_numbers << "\n"
  end

  puts parsed_numbers
end

parse_string
```
(edited)
