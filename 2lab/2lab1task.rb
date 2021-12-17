def script
  puts "Введите слово:"
  word = gets.chomp
  puts "Наше слово: #{word}"
  a = word.length
  puts "Длинна слова: #{a}"
  puts "Последние 2 буквы слова: #{word[a-2] + word[a-1]}"
  if word[a-2] == "c" && word[a-1] == "s"
   2 ** a
  else
   word.reverse
  end
end

puts script

