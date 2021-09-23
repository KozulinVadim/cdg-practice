def footbar
  puts "Ввеите 1 число:"
  a = gets.to_i
  puts "Введите 2 число:"
  b = gets.to_i
  if a == 20
    puts b
  elsif b == 20
    puts a
    else puts a+b
  end
end
footbar
