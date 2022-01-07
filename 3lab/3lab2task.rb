def studen
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

STUDENTS_LIST = 'student.txt'
BUFFER = 'buffer.txt'