def pokemon
  puts "Сколько добавить покемонов?"
  number = gets.to_i
  array = []
  i = 0
  while i < number
    puts "Введите Имя покемона "
    pokemon_name = gets
    puts "Введите Цвет покемона "
    pokemon_color = gets
    hash = {"name" =>pokemon_name.chomp , "color" => pokemon_color.chomp} # хэш покемона
    array[i] = hash # по очереди каждый хэш добавляем в массив
    i = i+1
  end
  return array
end
puts pokemon
