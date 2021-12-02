
def deposit
  puts "Введите сумму (Больше 0)"
  $start_balance = gets.to_i + $start_balance
  puts "Ваш новый баланс: #{$start_balance}"
end

def withdraw
  puts "Введите сумму для снятия"
  sum_withdraw = gets.to_i
  if sum_withdraw > $start_balance
    puts "Ошибка!Сумма для снятия не может быть больше баланса, введите корректную сумму."
    withdraw
  else
    $start_balance -= sum_withdraw
    puts "Ваш новый баланс: #{$start_balance}"
  end
end

def balance
  puts "Ваш баланс: #{$start_balance}"
end

def atm
$start_balance = File.read('balance.txt').to_i
puts "Внести деньги D (deposit)\nВывести деньги W (withdraw)\nПроверит баланс B (balance)\nВыйти Q (quit)"

loop do
  operation = gets.chomp
  check_input = ["Q","q","D","d","W","w","B","b"].include?(operation) # Проверка на корректный ввод операции
  if check_input == false
    puts "Ошибка!Вы ввели неверную операцию! Повторите попытку."
    else
  break if operation == "Q" or operation == "q"
  deposit if operation == "D" or operation == "d"
  withdraw if operation == "W" or operation == "w"
  balance if operation == "B" or operation == "b"
    end
  end
end

if File.exists?("balance.txt") != true # проверка на наличие файла
  file = File.new("balance.txt","w")
  file.puts(100)
  file.close
  atm
  else atm
end
file = File.open("balance.txt", "w")
file.puts($start_balance)