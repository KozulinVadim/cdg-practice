def greeting
  puts "Введите имя:"
  name = gets.chomp
  puts "Введите фамилию:"
  surname = gets.chomp
  puts "Введите возраст:"
  age = gets.to_i
  if age < 18
    return "Приветствую Тебя, #{name} #{surname}, тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else return "Привет, #{name} #{surname}, самое время заняться делом!"
  end
end
puts greeting