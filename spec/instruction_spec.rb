require './lib/instruction'

describe Instruction do
  describe '.parse' do
    it 'creates a new Instruction object' do
      Instruction.should_receive(:new).exactly(:once)
      Instruction.parse('a =>')
    end
  end
end

