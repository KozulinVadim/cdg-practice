
def deposit(balance)
  puts "Введите сумму (Больше 0)"
  deposit = gets.to_i
  if deposit <= 0
    puts 'Ошибка, сумма меньше или равна 0 гривен'
    deposit(balance)
  else
    balance = deposit + balance
    puts "Ваш новый баланс: #{balance}"
    balance
  end
end

def withdraw(balance)
  puts "Введите сумму для снятия"
  sum_withdraw = gets.to_i

  if sum_withdraw > balance
    puts "Ошибка!Сумма для снятия не может быть больше баланса, введите корректную сумму."
    withdraw(balance)
    elsif sum_withdraw < 0
           puts "Ошибка!Сумма для снятия не может быть меньше 0 гривен"
           withdraw(balance)
  else
    balance -= sum_withdraw
    puts "Ваш новый баланс: #{balance}"
    balance
  end
end

def balance(balance)
  puts "Ваш баланс: #{balance}"
end

def init

  if File.exists?("balance.txt") != true # проверка на наличие файла
    file = File.new("balance.txt","w")
    file.puts(100)
    file.close
  end

  balance = File.read('balance.txt').to_i
  puts "Внести деньги D (deposit)\nВывести деньги W (withdraw)\nПроверит баланс B (balance)\nВыйти Q (quit)"

  loop do
    operation = gets.chomp
    check_input = ["Q","q","D","d","W","w","B","b"].include?(operation) # Проверка на корректный ввод операции
    if check_input == false
      puts "Ошибка!Вы ввели неверную операцию! Повторите попытку."
    else
      break if operation == "Q" or operation == "q"
      balance = deposit(balance) if operation == "D" or operation == "d"
      balance = withdraw(balance) if operation == "W" or operation == "w"
      balance(balance) if operation == "B" or operation == "b"
    end
  end
end

init