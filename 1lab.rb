def greetings()
  name=gets.chomp
  surname=gets.chomp
  age=gets.to_i
  if age < 18
    return "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    return "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end
def foobar()
  a=gets.to_i
  b=gets.to_i
  if a == 20
    return b
  elsif b == 20
    return a
  end
  a + b
end
greetings()
