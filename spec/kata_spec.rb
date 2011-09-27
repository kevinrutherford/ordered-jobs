describe 'Ordered Jobs' do
  context 'empty string' do
    it 'returns an empty string' do
      input = ''
      output = input
      output.should == ''
    end
  end

  context 'single job' do
    it 'returns the single job' do
      input = 'a =>'
      output = 'a'
      output.should == 'a'
    end
  end
end

