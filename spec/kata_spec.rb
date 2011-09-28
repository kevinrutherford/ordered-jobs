def parse(input)
  dependencies = input.split("\n")
  jobs = dependencies.map {|s| s[0]}
  jobs.reverse.join
end

describe 'Ordered Jobs' do
  context 'step 1 -- empty string' do
    it 'returns an empty string' do
      input = ''
      output = parse(input)
      output.should == ''
    end
  end

  context 'step 2 -- single job' do
    let(:job) { 'a' }

    it 'returns the single job' do
      input = "#{job} =>"
      output = parse(input)
      output.should == job
    end
  end

  context 'step 3 -- multiple jobs' do
    it 'returns the correct number of jobs' do
      input = <<-END
a =>
b =>
c =>
END
      output = parse(input)
      output.length.should == 3
    end

    it 'returns the jobs in any order' do
      input = <<-END
a =>
b =>
c =>
END
      output = parse(input)
      ['a', 'b', 'c'].each do |job|
        output.should match(/#{job}/)
      end
    end
  end

  context 'step 4 -- multiple jobs, single dependency' do
    it 'returns the correct number of jobs' do
      input = <<-END
a =>
b => c
c =>
END
      output = parse(input)
      output.length.should == 3
    end

    it 'reports every job' do
      input = <<-END
a =>
b => c
c =>
END
      output = parse(input)
      ['a', 'b', 'c'].each do |job|
        output.should match(/#{job}/)
      end
    end

    it 'puts c before b' do
      input = <<-END
a =>
b => c
c =>
END
      output = parse(input)
      output.index('b').should > output.index('c')
    end
  end

  context 'step 5 -- multiple jobs, multiple dependencies' do
    it 'gets the right number of jobs' do
      input = <<-END
a =>
b => c
c => f
d => a
e => b
f =>
END
      output = parse(input)
      output.length.should == 6
    end

    it 'reports every job' do
      input = <<-END
a =>
b => c
c => f
d => a
e => b
f =>
END
      output = parse(input)
      %w{a b c d e f}.each do |job|
        output.should match(/#{job}/)
      end
    end
  end
end

