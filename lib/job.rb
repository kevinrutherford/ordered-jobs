class Job

  def initialize(name)
    @job = name
  end

  def add_to(schedule)
    schedule.add(@job)
  end

end

