describe JobsList do
  describe '#add_to' do
    let(:spec) { %w{1 2 3 4 5}.join("\n") }
    let(:schedule) { double('Schedule') }
    subject { JobsList.new(spec) }

    it 'adds each job to the schedule' do
      schedule.should_receive(:add).exactly(5).times
      subject.add_to(schedule)
    end
  end

  describe '#job' do
    subject { JobsList.new('') }

    it 'creates the named job' do
      subject.job('j').name.should == 'j'
    end

    it 'returns the same instance every time' do
      subject.job('s').should be subject.job('s')
    end
  end
end

