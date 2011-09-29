class JobsList

  def initialize(spec)
    @instructions = spec.split("\n").map {|instr| Instruction.new(instr) }
  end

  def add_to(schedule)
    @instructions.each {|i| i.add_to(schedule) }
  end

end

