require 'rspec'
require 'C:\Users\Vadim\Desktop\myrep\ruby-course\1lab.rb'

RSpec.describe 'lab1 metods' do
  it '#greetings' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Gulizar', 'Izmaylova', 19)
    expect(greetings).to eq ('Привет, Gulizar Izmaylova. Самое время заняться делом!')
  end
  it '#greetings' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Gulizar', 'Izmaylova', 12)
    expect(greetings).to eq ('Привет, Gulizar Izmaylova. Тебе меньше 18 лет, но начать учиться программировать никогда не рано')
  end
  it '#foobar' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 2)
    expect(foobar).to eq(2)
  end
  it '#foobar' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2, 20)
    expect(foobar).to eq(2)
  end
  it '#foobar' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2, 2)
    expect(foobar).to eq(4)
  end
end
