def parse(input)
  dependencies = input.split("\n")
  jobs = dependencies.map {|s| s[0]}
  jobs.reverse.join
end

shared_examples_for 'it reports all of the jobs' do |expected_jobs|
  it 'returns the correct number of jobs' do
    subject.length.should == expected_jobs.length
  end

  it 'reports every job' do
    expected_jobs.each { |job| subject.index(job).should_not be_nil }
  end
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

    it_should_behave_like 'it reports all of the jobs', %w{a}
  end

  context 'step 3 -- multiple jobs' do
    let(:input) { '
a =>
b =>
c =>
' }

    it_should_behave_like 'it reports all of the jobs', %w{a b c}
  end

  context 'step 4 -- multiple jobs, single dependency' do
    let(:input) { '
a =>
b => c
c =>
' }

    it_should_behave_like 'it reports all of the jobs', %w{a b c}

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

    it_should_behave_like 'it reports all of the jobs', %w{a b c d  e f}
  end
end

