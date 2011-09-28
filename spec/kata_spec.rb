def parse(input)
  dependencies = input.split("\n")
  jobs = dependencies.map {|s| s[0]}
  jobs.reverse.join
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
      ['a', 'b', 'c'].each do |job|
        output.should match(/#{job}/)
      end
    end
  end

  context 'multiple jobs, single dependency' do
    it '' do
      input = <<-END
a =>
b => c
c =>
END
      output = parse(input)
      output = parse(input)
      output.length.should == 3
      ['a', 'b', 'c'].each do |job|
        output.should match(/#{job}/)
      end
      output.index('b').should > output.index('c')
    end
  end
end

