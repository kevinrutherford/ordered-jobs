def parse(input)
  if input.length > 0
    input[0]
  else
    input
  end
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
      output = parse(input)
      output.should == job
    end
  end
end

