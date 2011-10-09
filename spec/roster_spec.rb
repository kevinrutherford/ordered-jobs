require './lib/roster'

describe Roster do

  describe '#job' do
    subject { Roster.new('') }

    it 'creates the named job' do
      subject.job('j').name.should == 'j'
    end

    it 'returns the same instance every time' do
      subject.job('s').should be subject.job('s')
    end
  end
end

