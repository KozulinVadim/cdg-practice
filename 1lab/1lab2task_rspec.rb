require 'rspec'
require 'C:\Users\Vadim\Desktop\myrep\ruby-course\1lab\1lab2task.rb'

RSpec.describe 'lab1task2 ' do
  it '#footbar' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 15)
    expect(footbar).to eq (15)
  end
  it '#footbar' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(13, 20)
    expect(footbar).to eq (13)
  end
  it '#footbar' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(11, 12)
    expect(footbar).to eq (23)
  end
end
