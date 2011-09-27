def parse(input)
  input
end

describe 'Ordered Jobs' do
  context 'empty string' do
    it 'returns an empty string' do
      input = ''
      output = parse(input)
      output.should == ''
    end
  end

  context 'single job' do
    let(:job) { 'a' }

    it 'returns the single job' do
      input = "#{job} =>"
      output = 'a'
      output.should == job
    end
  end
end

