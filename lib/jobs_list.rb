class JobsList

  def initialize(spec)
    @jobs = {}
    instructions = spec.split("\n")
    instructions.map {|instr| Instruction.parse(instr, self) }
  end

  def job(name)
    if @jobs.has_key?(name)
      @jobs.fetch(name)
    else
      @jobs[name] = Job.new(name)
    end
  end

  def add_to(schedule)
    @jobs.each_value {|job| job.add_to(schedule) }
  end

end

