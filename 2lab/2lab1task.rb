puts "Введите слово:"
word = gets.to_s
puts "Наше слово: #{word}"
def script (word)
a = word.length
  puts "Длинна слова: #{a}"
puts "Последние 2 буквы слова: #{word[a-3] + word[a-2]}"
if word[a-3] == "c" && word[a-2] == "s"
  puts "Произведение: #{2 ** a}"
else
  i = 0
  puts "Слово наоборот: "
  while i <= a
    print "#{word[a]} "
    a = a-1
  end
end
end
script (word)