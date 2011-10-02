require './lib/instruction'
require './lib/job'

describe Instruction do
  describe '.parse' do
    context 'with no dependency' do
      it 'creates a new Job object' do
        Job.should_receive(:new).with('a').exactly(:once)
        Instruction.parse('a =>')
      end
    end

    context 'with a dependency' do
      it 'makes the new Job dependent' do
        other = Job.new('b')
        Instruction.parse('a => b').depends_on?(other).should be_true
      end
    end

    context 'with a self-referenctial dependency' do
      it 'raises an error' do
        expect { Instruction.parse('a => a') }.to raise_error
      end
    end
  end
end

