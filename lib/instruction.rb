class SelfDependencyError < ArgumentError; end
class CircularDependencyError < ArgumentError; end

class Instruction

  class << self
    def parse(line, factory)
      job_name, dependent_name = line.split('=>').map(&:strip)
      result = factory.job(job_name)
      if dependent_name
        raise SelfDependencyError if dependent_name == job_name
        dependent = factory.job(dependent_name)
        raise CircularDependencyError if dependent.depends_on?(result)
        result.depends_on(dependent)
      end
      result
    end
  end

end

