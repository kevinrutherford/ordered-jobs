class Schedule

  def initialize
    @jobs = []
  end

  def add(job)
    @jobs << job
  end

  def ordered_jobs
    @jobs
  end
end

