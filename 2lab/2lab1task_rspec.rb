require 'rspec'
require './2lab1task'

RSpec.describe 'lab2task1 ' do
  it '#script' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Vadimcs")
    expect(script).to eq(128)
  end
  it '#script' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("vadim")
    expect(script).to eq("midav")
  end
end
