describe Job do
  describe '#<=>' do
    subject { Job.new('h') }

    context 'given identical jobs' do
      let(:other) { Job.new('h') }

      it 'compares equal' do
        subject.<=>(other).should == 0
      end
    end

    context 'given a job later in the alphabet' do
      let(:other) { Job.new('s') }

      it 'will sort the jobs alphebatically' do
        subject.<=>(other).should < 0
      end
    end

    context 'given a job earlier in the alphabet' do
      let(:other) { Job.new('c') }

      it 'will sort the jobs alphebatically' do
        subject.<=>(other).should > 0
      end
    end

  end
end

