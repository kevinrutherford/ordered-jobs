require './lib/job'
require './lib/jobs_list'
require './lib/instruction'
require './lib/schedule'

def parse(input)
  schedule = Schedule.new
  JobsList.new(input).add_to(schedule)
  schedule.ordered_jobs.map(&:name).join
end

shared_examples_for 'it reports all of the jobs' do |expected_jobs|
  it 'returns the correct number of jobs' do
    subject.length.should == expected_jobs.length
  end

  it 'reports every job' do
    expected_jobs.each { |job| subject.index(job).should_not be_nil }
  end
end

shared_examples_for 'jobs come in this order' do |job1, job2|
  it "#{job1} before #{job2}" do
    subject.index(job1).should < subject.index(job2)
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
    let(:input) { "a =>\nb =>\nc =>" }

    it_should_behave_like 'it reports all of the jobs', %w{a b c}
  end

  context 'step 4 -- multiple jobs, single dependency' do
    context 'with the given example' do
      let(:input) { "a =>\nb => c\nc =>" }

      it_should_behave_like 'it reports all of the jobs', %w{a b c}
      it_should_behave_like 'jobs come in this order', 'c', 'b'
    end

    context 'with a very similar example' do
      let(:input) { "a =>\nb => a\nc =>" }

      it_should_behave_like 'it reports all of the jobs', %w{a b c}
      it_should_behave_like 'jobs come in this order', 'a', 'b'
    end
  end

  context 'step 5 -- multiple jobs, multiple dependencies' do
    let(:input) { "a =>\nb => c\nc => f\nd => a\ne => b\nf =>" }

    it_should_behave_like 'it reports all of the jobs', %w{a b c d e f}
    it_should_behave_like 'jobs come in this order', 'c', 'b'
    it_should_behave_like 'jobs come in this order', 'f', 'c'
    it_should_behave_like 'jobs come in this order', 'a', 'd'
    it_should_behave_like 'jobs come in this order', 'b', 'e'
  end

  context 'step 6 -- multiple jobs, self-referencing dependency' do
    let(:input) { "a =>\nb =>\nc => c" }

    it 'complains' do
      expect { parse(input) }.to raise_error
    end
  end

end

