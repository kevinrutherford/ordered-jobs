class Instruction

  class << self
    def parse(line, factory)
      job, other = line.split('=>').map(&:strip)
      result = factory.job(job)
      if other
        if other == job
          raise ArgumentException
        end
        result.depends_on(factory.job(other))
      end
      result
    end
  end

end

