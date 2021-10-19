def footbar
  puts "Ввеите 1 число:"
  a = gets.to_i
  puts "Введите 2 число:"
  b = gets.to_i
  if a == 20
    return b
  elsif b == 20
    return a
    else return a+b
  end
end
puts footbar
