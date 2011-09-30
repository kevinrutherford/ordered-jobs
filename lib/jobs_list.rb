class JobsList

  def initialize(spec)
    instructions = spec.split("\n")
    @jobs = instructions.map {|instr| Instruction.parse(instr) }
  end

  def add_to(schedule)
    @jobs.each {|i| i.add_to(schedule) }
  end

end

