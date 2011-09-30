describe Job do
  let(:other) { Job.new('s') }
  subject { Job.new('h') }

  describe '#depends_on?' do
    context 'with an unrelated job' do
      it 'does not depend on me' do
        other.depends_on?(subject).should be_false
      end

      it 'I do not depend on it' do
        subject.depends_on?(other).should be_false
      end
    end

    context 'given a job that depends on me' do
      before do
        other.depends_on(subject)
      end

      it 'depend on me' do
        other.depends_on?(subject).should be_true
      end

      it 'I do not depend on it' do
        subject.depends_on?(other).should be_false
      end
    end
  end

  describe '#<=>' do
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

      context 'when I depend on it' do
        before do
          subject.depends_on(other)
        end

        it 'places other before me' do
          subject.<=>(other).should > 0
        end
      end
    end

    context 'given a job earlier in the alphabet' do
      let(:other) { Job.new('c') }

      it 'will sort the jobs alphebatically' do
        subject.<=>(other).should > 0
      end

      context 'when it depends on me' do
        before do
          other.depends_on(subject)
        end

        it 'places me first' do
          subject.<=>(other).should < 0
        end
      end
    end

  end
end

