class Instruction

  class << self
    def parse(line)
      new(line[0])
    end
  end

  def initialize(name)
    @job = name
  end

  def add_to(schedule)
    schedule.add(@job)
  end

end

