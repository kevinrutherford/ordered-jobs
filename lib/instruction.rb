class Instruction

  class << self
    def parse(line)
      new(line)
    end
  end

  def initialize(line)
    @job = line[0]
  end

  def add_to(schedule)
    schedule.add(@job)
  end

end

