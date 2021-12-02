MY_FILE = "myfile.txt"
BUFFER = "buffer.txt"

def index
  puts "Все строки файла:"
  File.foreach(MY_FILE) { |i| puts i }
end

def find(id)
  puts "Значение введенной строки:"
  File.foreach(MY_FILE).with_index do |i,index|
    puts i if index == id-1
  end
end

def where(pattern)
  puts "Номер(а) строки с указаным Паттерном:"
  File.foreach(MY_FILE).with_index do |i, index|
    if i.include?(pattern)
      puts index+1
    end
  
  end
end

def update(id,text)
  file = File.open(BUFFER, 'w')
  File.foreach(MY_FILE).with_index do |i, index|
    file.puts(id-1 == index ? text : i)
  end
  file.close
  File.write(MY_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(MY_FILE).with_index do |i, index|
    next if id-1 == index
    file.puts(id-1 == index ? text : i)
  end
  file.close
  File.write(MY_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

index
find(3)
where("1")
update(2,'qq')
delete(4)