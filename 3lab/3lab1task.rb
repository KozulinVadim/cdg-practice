if File.exist?('artists.txt')
  ACTORS_LIST_PATH = 'artists.txt'
  BUFFER = 'buffer.txt'
def index #Выводит все строки
  File.foreach(ACTORS_LIST_PATH) {|actor|puts actor}
end

def update(id, name) # Заменяет строку
    file = File.open(BUFFER, 'w')
    File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
      file.puts(id == index ? name : actor)
    end
    file.close
    File.write(ACTORS_LIST_PATH, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
end # Заменяет строку
def find(line) #Выводит определенную строку
    file = 'artists.txt'
    lines = File.readlines(file)
    puts lines[line]
end #Выводит определенную строку

else puts "Файл не найден"
end
index
update(0, 'Vasua Pupkin')
puts where('Vadim' )
find (1)
