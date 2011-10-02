class Instruction

  class << self
    def parse(line)
      job, other = line.split('=>').map(&:strip)
      result = Job.new(job)
      if other
        if other == job
          raise ArgumentException
        end
        result.depends_on(Job.new(other))
      end
      result
    end
  end

end

