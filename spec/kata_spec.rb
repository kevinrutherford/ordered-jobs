def parse(input)
  if input.length > 0
    input.split("\n").map {|s| s[0]}.reverse.join
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

  context 'multiple jobs' do
    it 'returns the jobs in any order' do
      input = <<-END
a =>
b =>
c =>
END
      output = parse(input)
      output.length.should == 3
      output[0].should_not == output[1]
      output[0].should_not == output[2]
      output[1].should_not == output[2]
      ['a', 'b', 'c'].each do |job|
        output.should match(/#{job}/)
      end
    end
  end
end

