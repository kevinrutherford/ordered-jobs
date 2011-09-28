def parse(input)
  dependencies = input.split("\n")
  jobs = dependencies.map {|s| s[0]}
  jobs.reverse.join
end

describe 'Ordered Jobs' do
  subject { parse(input) }

  context 'step 1 -- empty string' do
    let(:input) { '' }

    it 'returns an empty string' do
      subject.should == ''
    end
  end

  context 'step 2 -- single job' do
    let(:input) { 'a =>' }

    it 'returns the single job' do
      subject.should == 'a'
    end
  end

  context 'step 3 -- multiple jobs' do
    let(:input) { '
a =>
b =>
c =>
' }

    it 'returns the correct number of jobs' do
      subject.length.should == 3
    end

    it 'returns the jobs in any order' do
      ['a', 'b', 'c'].each do |job|
        subject.should match(/#{job}/)
      end
    end
  end

  context 'step 4 -- multiple jobs, single dependency' do
    let(:input) { '
a =>
b => c
c =>
' }

    it 'returns the correct number of jobs' do
      subject.length.should == 3
    end

    it 'reports every job' do
      ['a', 'b', 'c'].each do |job|
        subject.should match(/#{job}/)
      end
    end

    it 'puts c before b' do
      subject.index('b').should > subject.index('c')
    end
  end

  context 'step 5 -- multiple jobs, multiple dependencies' do
    let(:input) { '
a =>
b => c
c => f
d => a
e => b
f =>
' }

    it 'gets the right number of jobs' do
      subject.length.should == 6
    end

    it 'reports every job' do
      %w{a b c d e f}.each do |job|
        subject.should match(/#{job}/)
      end
    end
  end
end

