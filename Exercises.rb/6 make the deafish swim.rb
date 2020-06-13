=begin

Write a simple parser that will parse and run Deadfish.

Deadfish has 4 commands, each 1 character long:

i increments the value (initially 0)
d decrements the value
s squares the value
o outputs the value into the return array
Invalid characters should be ignored.

parse("iiisdoso")  ==>  [8, 64]


we need an empty array called result

we separate each character, and act upon the character

str.chars 


=end




def parse(data)
  result = []
  total = 0
  data.chars.each { |char|
    case char
    when 'i' then total += 1
    when 'd' then total -= 1
    when 's' then total = total ** 2
    when 'o' then result << total
    end }
  result
end



p parse("ooo")#, [0, 0, 0])
p parse("iiisdoso")#, [8, 64])
p parse("ioioio")#, [1, 2, 3])
p parse("idoiido")#, [0, 1])
p parse("isoisoiso")#, [1, 4, 25])
p parse("codewars")#, [0])