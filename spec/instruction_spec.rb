require './lib/instruction'
require './lib/job'

describe Instruction do
  describe '.parse' do
    it 'creates a new Job object' do
      Job.should_receive(:new).with('a').exactly(:once)
      Instruction.parse('a =>')
    end
  end
end

