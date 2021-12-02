require 'rspec'
require 'C:\Users\Vadim\Desktop\myrep\cdg-practice\2lab\2lab2task.rb'

RSpec.describe 'lab2task2 ' do
  it '#pokemon' do

    allow_any_instance_of(Kernel).to receive(:gets).and_return(1,"Pikachu","yellow")
    expect(pokemon).to eq ([{"name"=>"Pikachu", "color"=>"yellow"}])
  end
  it '#pokemon' do
    a = "Pikachu,"
    b = "yellow"
    a = a+b
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2,"Pikachu","yellow","Pikachu","yellow")
    expect(pokemon).to eq ([{"name"=>"Pikachu", "color"=>"yellow"},{"name"=>"Pikachu", "color"=>"yellow"}])

  end

    end

