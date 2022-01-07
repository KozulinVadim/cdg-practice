require 'rspec'
require 'stringio'

require_relative '4lab1task.rb'

describe CashMachine do

  it 'should show balance with starting amount of money 100.0' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("B", "Q")
    expect(CashMachine.init)
    expect(File.read("balance.txt")).to eql("100.0")
  end

  it 'should deposit 100.0 to existing balance(100.0) and get 200.0 in total' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("D", "100", "Q")
    expect(CashMachine.init)
    expect(File.read("balance.txt")).to eql("200.0")
  end

  it 'should withdraw 100.0 from existing balance(200.0) and get 100.0' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("W", "100", "Q")
    expect(CashMachine.init)
    expect(File.read("balance.txt")).to eql("100.0")
  end

end
