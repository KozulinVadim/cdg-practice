MY_FILE = "myfile.txt"
BUFFER = "buffer.txt"

def index
  puts "Все строки файла:"
  arr = File.read(MY_FILE).split("\n")
  arr
end

def find(id)
  puts "Значение введенной строки:"
  File.foreach(MY_FILE).with_index do |i, index|
    return i.chomp if index == id - 1
  end
end

def where(pattern)
  puts "Номер(а) строки с указаным Паттерном:"
  File.foreach(MY_FILE).with_index do |i, index|
    if i.include?(pattern)
      return (index + 1)
    end
  end
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  File.foreach(MY_FILE).with_index do |i, index|
    file.puts(id - 1 == index ? text : i)
  end
  file.close
  File.write(MY_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(MY_FILE).with_index do |i, index|
    if id != index+1
      file.puts(i)
    end
  end
  file.close
  File.write(MY_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

puts index
puts find(3)
puts where("5")
update(3, 'qq')
delete(4)