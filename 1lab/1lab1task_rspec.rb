require 'rspec'
require 'C:\Users\Vadim\Desktop\myrep\ruby-course\1lab\1lab1task.rb'

RSpec.describe 'lab1task1 ' do
  it '#greeting' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Vadim", "Kozulin", 13)
    expect(greeting).to eq ("Приветствую Тебя, Vadim Kozulin, тебе меньше 18 лет, но начать учиться программировать никогда не рано")
  end
  it '#greeting' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Vadim", "Kozulin", 22)
    expect(greeting).to eq ("Привет, Vadim Kozulin, самое время заняться делом!")
  end
  end