class Instruction

  def initialize(line)
    @job = line[0]
  end

  def add_to(schedule)
    schedule.add(@job)
  end

end

