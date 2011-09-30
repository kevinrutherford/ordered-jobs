class Instruction

  class << self
    def parse(line)
      Job.new(line[0])
    end
  end

end

