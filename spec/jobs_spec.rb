describe Job do
  describe '#<=>' do
    subject { Job.new('h') }

    context 'given identical jobs' do
      it 'compares equal' do
        other = Job.new('h')
        subject.<=>(other).should == 0
      end
    end

    context 'given a job later in the alphabet' do
      it 'will sort the jobs alphebatically' do
        other = Job.new('s')
        subject.<=>(other).should < 0
      end
    end

    context 'given a job earlier in the alphabet' do
      it 'will sort the jobs alphebatically' do
        other = Job.new('c')
        subject.<=>(other).should > 0
      end
    end

  end
end

