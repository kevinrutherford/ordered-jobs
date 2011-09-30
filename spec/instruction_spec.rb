require './lib/instruction'

describe Instruction do
  describe '.parse' do
    it 'creates a new Instruction object' do
      Instruction.parse('a =>').should_not be_nil
    end
  end
end

