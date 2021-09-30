def recording (number)
  file = File.open('student.txt')
  file_data = file.readlines
  i = 0
  student = file_data[i] if file_data[i].include?(number)
  File.open("specific_student.txt", "a") do |file2|
    file2.write(student)
  end
  file_data.delete_at(student.to_i) # удаляем студента из МАССИВА
  File.open("student.txt", "w") do |file| #вставляем массив с удаленным студентом в 1 файл
    file.puts(file_data)
  end
  @check_list = file_data.empty?
end

loop do
  number = gets.to_s
  break if number.to_i == -1
  break if @check_list == true
  recording(number)
end
file = File.open('specific_student.txt')
file_data = file.readlines
puts file_data

