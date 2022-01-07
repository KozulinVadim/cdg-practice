def balance
  if File.exist?("balance.txt")
    f = File.open("balance.txt")
    balance = f.read.to_f
    f.close
  end

  loop do
    puts "B, to check balance \nD, to deposit money \nW, to withdraw money \nQ, to quit"
    choose = gets.chomp

    case choose.downcase
    when 'b'
      puts "Your balance: #{balance}"
    when 'd'
      puts 'Input amount of deposit: '
      money_input = gets.to_f
      if money_input <= 0
        puts 'Deposit amount must be greater than 0.'
      else
        balance += money_input
        puts "Your balance: #{balance}"
        f = File.open('balance.txt', 'w')
        f.write(balance)
        f.close
      end
    when 'w'
      puts 'Input amount to withdraw: '
      money_output = gets.to_f
      if money_output <= 0
        puts 'Withdraw amount must be greater than 0.'
      elsif money_output > balance
        puts 'Not enough money on balance.'
      else
        balance -= money_output
        puts "Your balance: #{balance}"
      end
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
    when 'q'
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
      break
    else
      puts 'Wrong menu item.'
    end
  end
end

def read
  file = File.open('input.txt')
  students = file.readlines.map { |line| line.chomp }
  file.close
  result = []

  loop do
    puts 'Input age: '
    input = gets.to_i
    break if input == -1

    students.each { |student|
      result.append(student) if student.split(' ')[2].to_i == input
    }
    break if students.length == result.length
  end

  file = File.open('result.txt', 'w')
  result.each { |s|
    puts s
    file.write(s + "\n")
  }
  file.close
end
def crud_menu
  loop do
    puts 'Menu: '
    puts '1. Output file data.'
    puts '2. Output string from file.'
    puts '3. Output data with pattern'
    puts '4. Update string.'
    puts '5. Delete string.'
    puts '0. Quit.'

    choose = gets.to_i
    case choose
    when 1
      index
    when 2
      puts 'Input id: '
      id = gets
      find(id)
    when 3
      puts 'Input pattern: '
      pattern = gets
      where(pattern)
    when 4
      puts 'Input id: '
      id = gets
      puts 'Input text: '
      text = gets
      update(id, text)
    when 5
      puts 'Input id: '
      id = gets
      delete(id)
    when 0
      menu
    else
      puts "Wrong menu item."
    end
  end
end

def menu
  loop do
    puts "Menu: "
    puts '1. Balance.'
    puts '2. Reading from file.'
    puts '3. CRUD Menu.'
    puts '0. Quit.'

    choose = gets.to_i
    case choose
    when 1
      balance
    when 2
      read
    when 3
      crud_menu
    when 0
      break
    else
      puts "Wrong menu item."
    end
  end
end

menu