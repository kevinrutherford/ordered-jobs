require './lib/instruction'
require './lib/job'

describe Instruction do
  let(:factory) { JobsList.new('') }

  describe '.parse' do
    context 'with no dependency' do
      it 'creates a new Job object' do
        factory.should_receive(:job).with('a').exactly(:once)
        Instruction.parse('a =>', factory)
      end
    end

    context 'with a dependency' do
      it 'makes the new Job dependent' do
        other = factory.job('b')
        Instruction.parse('a => b', factory).depends_on?(other).should be_true
      end
    end

    context 'with a self-referenctial dependency' do
      it 'raises an error' do
        expect { Instruction.parse('a => a', factory) }.to raise_error
      end
    end
  end
end

