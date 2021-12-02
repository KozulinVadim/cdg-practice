BUFFER = 'buffer.txt'
STUDENT = 'student.txt'

def recording
  students = File.read(STUDENT).split("\n")
  specific_student = File.read('specific_student.txt').split("\n")

  while students.length > 0
    puts 'Введите возраст студента:'
    student_age = gets

    break if student_age.to_i == -1

    File.foreach(STUDENT) do|i|
      if i.include?(student_age)
        File.write("specific_student.txt",i, mode: "a")
      else
        File.write(BUFFER,i, mode: "a")
      end
    end

    File.write("student.txt",File.read(BUFFER), mode: "w")
  end
  File.write(BUFFER,'', mode: "w")
  puts specific_student
end

recording


#Второй вариант через массив


# def recording (number)
#   file = File.open('student.txt')
#   file_data = file.readlines
#   i = 0
#   student = file_data[i] if file_data[i].include?(number)
#   File.open("specific_student.txt", "a") do |file|
#     file.write(student)
#   end
#   file_data.delete_at(student.to_i) # удаляем студента из МАССИВА
#   File.open("student.txt", "w") do |file| #вставляем массив с удаленным студентом в 1 файл
#     file.puts(file_data)
#   end
#   @check_list = file_data.empty?
# end
#
# loop do
#   number = gets.to_s
#   break if number.to_i == -1
#   break if @check_list == true
#   recording(number)
# end
# file = File.open('specific_student.txt')
# file_data = file.readlines
# puts file_data

