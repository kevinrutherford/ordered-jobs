class Schedule

  def initialize
    @jobs = []
  end

  def add(instruction)
    @jobs << instruction
  end

  def ordered_jobs
    @jobs
  end
end

